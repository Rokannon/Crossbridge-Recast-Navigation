package app.model
{
    import app.data.MeshBounds;
    import app.data.mesh.MeshInfo;
    import app.model.enum.PartitionType;
    import app.model.enum.ToolType;
    import app.model.tool.CrowdTool;
    import app.model.tool.MeshTool;
    import app.model.tool.TesterTool;

    import flash.events.EventDispatcher;

    import recastnavigation.debugutils.duLogBuildTimes;
    import recastnavigation.detour.navmesh.DTNavMesh;
    import recastnavigation.detour.navmesh.enum.DTTileFlags;
    import recastnavigation.detour.navmeshbuilder.DTNavMeshCreateParams;
    import recastnavigation.detour.navmeshbuilder.dtCreateNavMeshData;
    import recastnavigation.detour.navmeshquery.DTNavMeshQuery;
    import recastnavigation.detour.navmeshquery.DTQueryFilter;
    import recastnavigation.detour.status.dtStatusFailed;
    import recastnavigation.recast.RCCompactHeightfield;
    import recastnavigation.recast.RCConfig;
    import recastnavigation.recast.RCContext;
    import recastnavigation.recast.RCHeightfield;
    import recastnavigation.recast.contour.RCContourSet;
    import recastnavigation.recast.contour.rcBuildContours;
    import recastnavigation.recast.enum.RCLogCategory;
    import recastnavigation.recast.enum.RCTimerLabel;
    import recastnavigation.recast.filter.rcFilterLedgeSpans;
    import recastnavigation.recast.filter.rcFilterLowHangingWalkableObstacles;
    import recastnavigation.recast.filter.rcFilterWalkableLowHeightSpans;
    import recastnavigation.recast.mesh.RCPolyMesh;
    import recastnavigation.recast.mesh.rcBuildPolyMesh;
    import recastnavigation.recast.meshdetail.RCPolyMeshDetail;
    import recastnavigation.recast.meshdetail.rcBuildPolyMeshDetail;
    import recastnavigation.recast.rcBuildCompactHeightfield;
    import recastnavigation.recast.rcCreateHeightfield;
    import recastnavigation.recast.rcErodeWalkableArea;
    import recastnavigation.recast.rcMarkWalkableTriangles;
    import recastnavigation.recast.rcRasterizeTriangles;
    import recastnavigation.recast.region.rcBuildDistanceField;
    import recastnavigation.recast.region.rcBuildLayerRegions;
    import recastnavigation.recast.region.rcBuildRegions;
    import recastnavigation.recast.region.rcBuildRegionsMonotone;

    public class SoloMesh extends EventDispatcher
    {
        public static const TEXTURE_SIZE:int = 1024;

        private static const HELPER_BOUNDS_1:MeshBounds = new MeshBounds();
        private static const HELPER_BOUNDS_2:MeshBounds = new MeshBounds();

        public var cellSize:Number = 0.3;
        public var cellHeight:Number = 0.2;
        public var agentHeight:Number = 2;
        public var agentRadius:Number = 0.6;
        public var agentMaxClimb:Number = 0.9;
        public var agentMaxSlope:Number = 45;
        public var regionMinSize:Number = 8;
        public var regionMergeSize:Number = 20;
        public var edgeMaxLen:Number = 12;
        public var edgeMaxError:Number = 1.3;
        public var vertsPerPoly:Number = 6;
        public var detailSampleDist:Number = 6;
        public var detailSampleMaxError:Number = 1;
        public var partitionType:int = PartitionType.PARTITION_WATERSHED;
        public var totalBuildTimeMs:Number = 0;
        public const meshTools:Vector.<MeshTool> = new Vector.<MeshTool>();
        public const coordSpace:CoordSpace = new CoordSpace();

        private var _context:RCContext;
        private var _meshInfo:MeshInfo;
        private var _config:RCConfig;
        private var _solid:RCHeightfield;
        private var _chf:RCCompactHeightfield;
        private var _cset:RCContourSet;
        private var _pmesh:RCPolyMesh;
        private var _dmesh:RCPolyMeshDetail;
        private var _navMesh:DTNavMesh;
        private var _query:DTNavMeshQuery;
        private var _currentToolType:int = -1;
        private var _filter:DTQueryFilter;

        public function SoloMesh()
        {
            _config = new RCConfig();
            _config.alloc();

            _query = new DTNavMeshQuery();
            _query.alloc();

            meshTools[ToolType.TOOL_TESTER] = new TesterTool();
            meshTools[ToolType.TOOL_CROWD] = new CrowdTool();

            _filter = new DTQueryFilter();
            _filter.alloc();
            _filter.setIncludeFlags(0xffff);
            _filter.setExcludeFlags(0);
        }

        public function get meshInfo():MeshInfo
        {
            return _meshInfo;
        }

        public function get navMesh():DTNavMesh
        {
            return _navMesh;
        }

        public function get query():DTNavMeshQuery
        {
            return _query;
        }

        public function get currentToolType():int
        {
            return _currentToolType;
        }

        public function get filter():DTQueryFilter
        {
            return _filter;
        }

        public function connect(context:RCContext):void
        {
            _context = context;
            for each (var meshTool:MeshTool in meshTools)
                meshTool.connect(this);
        }

        public function setMesh(meshInfo:MeshInfo):void
        {
            cleanup();
            _meshInfo = meshInfo;
            _meshInfo.getMeshBoundMin(HELPER_BOUNDS_1);
            _meshInfo.getMeshBoundMax(HELPER_BOUNDS_2);
            coordSpace.reset(TEXTURE_SIZE, HELPER_BOUNDS_1.x, HELPER_BOUNDS_1.z, HELPER_BOUNDS_2.x, HELPER_BOUNDS_2.z);
            dispatchEvent(new SoloMeshEvent(SoloMeshEvent.MESH_SELECTED));
        }

        public function setCurrentToolType(toolType:int):void
        {
            if (_navMesh != null)
            {
                if (_currentToolType != -1)
                    meshTools[_currentToolType].sleep();
                meshTools[toolType].wake();
            }
            _currentToolType = toolType;
            dispatchEvent(new SoloMeshEvent(SoloMeshEvent.TOOL_CHANGED));
        }

        public function handleClick(x:Number, y:Number, shift:Boolean):void
        {
            if (_currentToolType == -1)
            {
                dispatchEvent(new SoloMeshEvent(SoloMeshEvent.NO_TOOL_SELECTED));
                return;
            }

            if (_meshInfo == null)
            {
                dispatchEvent(new SoloMeshEvent(SoloMeshEvent.NO_MESH_SELECTED));
                return;
            }

            if (_navMesh == null)
            {
                dispatchEvent(new SoloMeshEvent(SoloMeshEvent.MESH_IS_NOT_BUILT));
                return;
            }

            meshTools[_currentToolType].handleClick(x, y, shift);
        }

        public function build():void
        {
            if (_meshInfo == null)
            {
                dispatchEvent(new SoloMeshEvent(SoloMeshEvent.NO_MESH_SELECTED));
                return;
            }

            cleanup();

            //
            // Step 1. Initialize build config.
            //

            _config.cs = cellSize;
            _config.ch = cellHeight;
            _config.walkableSlopeAngle = agentMaxSlope;
            _config.walkableHeight = Math.ceil(agentHeight / cellHeight);
            _config.walkableClimb = Math.floor(agentMaxClimb / cellHeight);
            _config.walkableRadius = Math.ceil(agentRadius / cellSize);
            _config.maxEdgeLen = edgeMaxLen / cellSize;
            _config.maxSimplificationError = edgeMaxError;
            _config.minRegionArea = sq(regionMinSize);
            _config.mergeRegionArea = sq(regionMergeSize);
            _config.maxVertsPerPoly = vertsPerPoly;
            _config.detailSampleDist = detailSampleDist < 0.9 ? 0 : cellSize * detailSampleDist;
            _config.detailSampleMaxError = cellHeight * detailSampleMaxError;
            _config.rcCalcBounds(_meshInfo.verts);
            _config.rcCalcGridSize();

            _context.resetTimers();
            _context.startTimer(RCTimerLabel.RC_TIMER_TOTAL);
            _context.log(RCLogCategory.RC_LOG_PROGRESS, "Building navigation:");
            _context.log(RCLogCategory.RC_LOG_PROGRESS,
                         " - " + _config.width.toString() + " x " + _config.height.toString() + " cells");
            _context.log(RCLogCategory.RC_LOG_PROGRESS,
                         " - " + (_meshInfo.nverts / 1000).toFixed(1) + "K verts, " + (_meshInfo.ntris / 1000).toFixed(1) + "K tris");

            //
            // Step 2. Rasterize input polygon soup.
            //

            _solid = new RCHeightfield();
            if (!_solid.alloc())
            {
                _context.log(RCLogCategory.RC_LOG_ERROR, "buildNavigation: Out of memory 'solid'.");
                return;
            }
            if (!rcCreateHeightfield(_context, _solid, _config))
            {
                _context.log(RCLogCategory.RC_LOG_ERROR, "buildNavigation: Could not create solid heightfield.");
                return;
            }

            var triareas:Vector.<int> = new Vector.<int>();
            rcMarkWalkableTriangles(_context, _config.walkableSlopeAngle, _meshInfo.verts, _meshInfo.tris, triareas);
            rcRasterizeTriangles(_context, _meshInfo.verts, _meshInfo.tris, triareas, _solid, _config.walkableClimb);

            //
            // Step 3. Filter walkables surfaces.
            //

            rcFilterLowHangingWalkableObstacles(_context, _config.walkableClimb, _solid);
            rcFilterLedgeSpans(_context, _config.walkableHeight, _config.walkableClimb, _solid);
            rcFilterWalkableLowHeightSpans(_context, _config.walkableHeight, _solid);

            //
            // Step 4. Partition walkable surface to simple regions.
            //

            _chf = new RCCompactHeightfield();
            if (!_chf.alloc())
            {
                _context.log(RCLogCategory.RC_LOG_ERROR, "buildNavigation: Out of memory 'chf'.");
                return;
            }
            if (!rcBuildCompactHeightfield(_context, _config, _solid, _chf))
            {
                _context.log(RCLogCategory.RC_LOG_ERROR, "buildNavigation: Could not build compact app.data.");
                return;
            }
            _solid.free();
            _solid = null;
            if (!rcErodeWalkableArea(_context, _config.walkableRadius, _chf))
            {
                _context.log(RCLogCategory.RC_LOG_ERROR, "buildNavigation: Could not erode.");
                return;
            }
            switch (partitionType)
            {
                case PartitionType.PARTITION_WATERSHED:
                    if (!rcBuildDistanceField(_context, _chf))
                    {
                        _context.log(RCLogCategory.RC_LOG_ERROR, "buildNavigation: Could not build distance field.");
                        return;
                    }
                    if (!rcBuildRegions(_context, _chf, 0, _config.minRegionArea, _config.mergeRegionArea))
                    {
                        _context.log(RCLogCategory.RC_LOG_ERROR, "buildNavigation: Could not build watershed regions.");
                        return;
                    }
                    break;
                case PartitionType.PARTITION_MONOTONE:
                    if (!rcBuildRegionsMonotone(_context, _chf, 0, _config.minRegionArea, _config.mergeRegionArea))
                    {
                        _context.log(RCLogCategory.RC_LOG_ERROR, "buildNavigation: Could not build monotone regions.");
                        return;
                    }
                    break;
                case PartitionType.PARTITION_LAYERS:
                    if (!rcBuildLayerRegions(_context, _chf, 0, _config.minRegionArea))
                    {
                        _context.log(RCLogCategory.RC_LOG_ERROR, "buildNavigation: Could not build layer regions.");
                        return;
                    }
                    break;
            }

            //
            // Step 5. Trace and simplify region contours.
            //

            _cset = new RCContourSet();
            if (!_cset.alloc())
            {
                _context.log(RCLogCategory.RC_LOG_ERROR, "buildNavigation: Out of memory 'cset'.");
                return;
            }
            if (!rcBuildContours(_context, _chf, _config.maxSimplificationError, _config.maxEdgeLen, _cset))
            {
                _context.log(RCLogCategory.RC_LOG_ERROR, "buildNavigation: Could not create contours.");
                return;
            }

            //
            // Step 6. Build polygons mesh from contours.
            //

            _pmesh = new RCPolyMesh();
            if (!_pmesh.alloc())
            {
                _context.log(RCLogCategory.RC_LOG_ERROR, "buildNavigation: Out of memory 'pmesh'.");
                return;
            }
            if (!rcBuildPolyMesh(_context, _cset, _config.maxVertsPerPoly, _pmesh))
            {
                _context.log(RCLogCategory.RC_LOG_ERROR, "buildNavigation: Could not triangulate contours.");
                return;
            }

            //
            // Step 7. Create detail mesh which allows to access approximate height on each polygon.
            //

            _dmesh = new RCPolyMeshDetail();
            if (!_dmesh.alloc())
            {
                _context.log(RCLogCategory.RC_LOG_ERROR, "buildNavigation: Out of memory 'pmdtl'.");
                return;
            }
            if (!rcBuildPolyMeshDetail(_context, _pmesh, _chf, _config.detailSampleDist, _config.detailSampleMaxError,
                                       _dmesh))
            {
                _context.log(RCLogCategory.RC_LOG_ERROR, "buildNavigation: Could not build detail mesh.");
                return;
            }

            _chf.free();
            _chf = null;
            _cset.free();
            _cset = null;

            //
            // (Optional) Step 8. Create Detour app.data from Recast poly mesh.
            //

            if (_config.maxVertsPerPoly <= DTNavMesh.DT_VERTS_PER_POLYGON)
            {
                var navData:Vector.<int> = new Vector.<int>();
                for (var i:int = _pmesh.npolys - 1; i >= 0; --i)
                    _pmesh.setFlag(i, 1);

                var params:DTNavMeshCreateParams = new DTNavMeshCreateParams();
                params.alloc();
                params.initFromRecast(_config, _pmesh, _dmesh);
                params.walkableHeight = agentHeight;
                params.walkableRadius = agentRadius;
                params.walkableClimb = agentMaxClimb;
                params.buildBvTree = true;

                if (!dtCreateNavMeshData(params, navData))
                {
                    _context.log(RCLogCategory.RC_LOG_ERROR, "Could not build Detour navmesh.");
                    params.free();
                    return;
                }

                _navMesh = new DTNavMesh();
                if (!_navMesh.alloc())
                {
                    _context.log(RCLogCategory.RC_LOG_ERROR, "Could not create Detour navmesh");
                    params.free();
                    return;
                }

                var status:int;

                status = _navMesh.init(navData, DTTileFlags.DT_TILE_FREE_DATA);
                if (dtStatusFailed(status))
                {
                    _context.log(RCLogCategory.RC_LOG_ERROR, "Could not init Detour navmesh");
                    params.free();
                    return;
                }

                status = _query.init(_navMesh, 2048);
                if (dtStatusFailed(status))
                {
                    _context.log(RCLogCategory.RC_LOG_ERROR, "Could not init Detour navmesh query");
                    params.free();
                    return;
                }
            }

            _context.stopTimer(RCTimerLabel.RC_TIMER_TOTAL);

            duLogBuildTimes(_context, _context.getAccumulatedTime(RCTimerLabel.RC_TIMER_TOTAL));
            _context.log(RCLogCategory.RC_LOG_PROGRESS,
                         ">> Polymesh: " + _pmesh.nverts + " vertices  " + _pmesh.npolys + " polygons");

            totalBuildTimeMs = _context.getAccumulatedTime(RCTimerLabel.RC_TIMER_TOTAL) / 1000;

            dispatchEvent(new SoloMeshEvent(SoloMeshEvent.BUILD_COMPLETE));
            if (_currentToolType != -1)
                meshTools[_currentToolType].wake();

            params.free();
        }

        public function handleUpdate(dt:Number):void
        {
            if (_currentToolType != -1)
            {
                var meshTool:MeshTool = meshTools[_currentToolType];
                meshTool.handleUpdate(dt);
            }
        }

        private function cleanup():void
        {
            if (_solid != null)
            {
                _solid.free();
                _solid = null;
            }
            if (_chf != null)
            {
                _chf.free();
                _chf = null;
            }
            if (_cset != null)
            {
                _cset.free();
                _cset = null;
            }
            if (_pmesh != null)
            {
                _pmesh.free();
                _pmesh = null;
            }
            if (_dmesh != null)
            {
                _dmesh.free();
                _dmesh = null;
            }
            if (_navMesh != null)
            {
                _navMesh.free();
                _navMesh = null;
            }
            if (_currentToolType != -1)
                meshTools[_currentToolType].sleep();
        }

        [Inline]
        private function sq(x:Number):Number
        {
            return x * x;
        }
    }
}