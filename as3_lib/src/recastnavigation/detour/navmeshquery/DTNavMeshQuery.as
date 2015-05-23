package recastnavigation.detour.navmeshquery
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.detour.navmesh.DTNavMesh;
    import recastnavigation.detour.status.dtStatusSucceed;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_dtAllocNavMeshQuery;
    import recastnavigation.internal_api.internal_dtFreeNavMeshQuery;
    import recastnavigation.internal_api.internal_dtNavMeshQuery_finalizeSlicedFindPath;
    import recastnavigation.internal_api.internal_dtNavMeshQuery_finalizeSlicedFindPathPartial;
    import recastnavigation.internal_api.internal_dtNavMeshQuery_findNearestPoly;
    import recastnavigation.internal_api.internal_dtNavMeshQuery_findPath;
    import recastnavigation.internal_api.internal_dtNavMeshQuery_findStraightPath;
    import recastnavigation.internal_api.internal_dtNavMeshQuery_init;
    import recastnavigation.internal_api.internal_dtNavMeshQuery_initSlicedFindPath;
    import recastnavigation.internal_api.internal_dtNavMeshQuery_isInClosedList;
    import recastnavigation.internal_api.internal_dtNavMeshQuery_queryPolygons;
    import recastnavigation.internal_api.internal_dtNavMeshQuery_updateSlicedFindPath;

    use namespace rn_internal;

    /**
     * Provides the ability to perform pathfinding related queries against a navigation mesh.
     */
    public class DTNavMeshQuery extends RNBase
    {
        private static const HELPER_MEM_SIZE:int = 1024 * 2;
        private var _helperMem:int;

        /** Initializes the query object. */
        public function init(nav:DTNavMesh, maxNodes:int):int
        {
            return internal_dtNavMeshQuery_init(ptr, nav.ptr, maxNodes);
        }

        /** Finds a path from the start polygon to the end polygon. */
        public function findPath(startRef:int, endRef:int, startPosX:Number, startPosY:Number, startPosZ:Number,
                                 endPosX:Number, endPosY:Number, endPosZ:Number, filter:DTQueryFilter):int
        {
            var offset:int = 0;

            var startPos_ptr:int = _helperMem + offset;
            offset += 12;
            CModule.writeFloat(startPos_ptr + 0, startPosX);
            CModule.writeFloat(startPos_ptr + 4, startPosY);
            CModule.writeFloat(startPos_ptr + 8, startPosZ);

            var endPos_ptr:int = _helperMem + offset;
            offset += 12;
            CModule.writeFloat(endPos_ptr + 0, endPosX);
            CModule.writeFloat(endPos_ptr + 4, endPosY);
            CModule.writeFloat(endPos_ptr + 8, endPosZ);

            var pathCount_ptr:int = _helperMem + offset;
            offset += 4;

            var path_ptr:int = _helperMem + offset;
            var maxPath:int = (HELPER_MEM_SIZE - offset) / 4;

            var result:int = internal_dtNavMeshQuery_findPath(ptr, startRef, endRef, startPos_ptr, endPos_ptr,
                                                              filter.ptr, path_ptr, pathCount_ptr, maxPath);
            if (dtStatusSucceed(result))
            {
                polys.length = CModule.read32(pathCount_ptr);
                for (var i:int = polys.length - 1; i >= 0; --i)
                    polys[i] = CModule.read32(path_ptr + 4 * i);
            }
            return result;
        }

        public const straightPath:Vector.<Number> = new Vector.<Number>();
        public const straightPathFlags:Vector.<int> = new Vector.<int>();
        public const straightPathRefs:Vector.<int> = new Vector.<int>();

        public function findStraightPath(startPosX:Number, startPosY:Number, startPosZ:Number, endPosX:Number,
                                         endPosY:Number, endPosZ:Number, path:Vector.<int>, options:int = 0):int
        {
            var i:int;
            var offset:int = 0;

            var startPos_ptr:int = _helperMem + offset;
            offset += 12;
            CModule.writeFloat(startPos_ptr + 0, startPosX);
            CModule.writeFloat(startPos_ptr + 4, startPosY);
            CModule.writeFloat(startPos_ptr + 8, startPosZ);

            var endPos_ptr:int = _helperMem + offset;
            offset += 12;
            CModule.writeFloat(endPos_ptr + 0, endPosX);
            CModule.writeFloat(endPos_ptr + 4, endPosY);
            CModule.writeFloat(endPos_ptr + 8, endPosZ);

            var path_ptr:int = _helperMem + offset;
            var pathSize:int = path.length;
            offset += 4 * pathSize;
            for (i = 0; i < pathSize; ++i)
                CModule.write32(path_ptr + 4 * i, path[i]);

            var straightPathCount_ptr:int = _helperMem + offset;
            offset += 4;

            var maxStraightPath:int = (HELPER_MEM_SIZE - offset) / 17;

            var straightPath_ptr:int = _helperMem + offset;
            offset += 4 * 3 * maxStraightPath;

            var straightPathFlags_ptr:int = _helperMem + offset;
            offset += 1 * maxStraightPath;

            var straightPathRefs_ptr:int = _helperMem + offset;
            offset += 4 * maxStraightPath;

            var result:int = internal_dtNavMeshQuery_findStraightPath(ptr, startPos_ptr, endPos_ptr, path_ptr, pathSize,
                                                                      straightPath_ptr, straightPathFlags_ptr,
                                                                      straightPathRefs_ptr, straightPathCount_ptr,
                                                                      maxStraightPath, options);
            if (dtStatusSucceed(result))
            {
                var length:int = CModule.read32(straightPathCount_ptr);
                straightPath.length = 3 * length;
                straightPathFlags.length = length;
                straightPathRefs.length = length;
                for (i = 0; i < length; ++i)
                {
                    straightPath[3 * i + 0] = CModule.readFloat(straightPath_ptr + 12 * i + 0);
                    straightPath[3 * i + 1] = CModule.readFloat(straightPath_ptr + 12 * i + 4);
                    straightPath[3 * i + 2] = CModule.readFloat(straightPath_ptr + 12 * i + 8);
                    straightPathFlags[i] = CModule.read8(straightPathFlags_ptr + 1 * i);
                    straightPathRefs[i] = CModule.read32(straightPathRefs_ptr + 4 * i);
                }
            }
            return result;
        }

        public var nearestRef:int;
        public var nearestPtX:Number;
        public var nearestPtY:Number;
        public var nearestPtZ:Number;

        /** Finds the polygon nearest to the specified center point. */
        public function findNearestPoly(centerX:Number, centerY:Number, centerZ:Number, extentsX:Number,
                                        extentsY:Number, extentsZ:Number, filter:DTQueryFilter):int
        {
            var offset:int = 0;

            var center_ptr:int = _helperMem + offset;
            offset += 12;
            CModule.writeFloat(center_ptr + 0, centerX);
            CModule.writeFloat(center_ptr + 4, centerY);
            CModule.writeFloat(center_ptr + 8, centerZ);

            var extents_ptr:int = _helperMem + offset;
            offset += 12;
            CModule.writeFloat(extents_ptr + 0, extentsX);
            CModule.writeFloat(extents_ptr + 4, extentsY);
            CModule.writeFloat(extents_ptr + 8, extentsZ);

            var nearestRef_ptr:int = _helperMem + offset;
            offset += 4;

            var nearestPt_ptr:int = _helperMem + offset;
            offset += 4;

            var result:int = internal_dtNavMeshQuery_findNearestPoly(ptr, center_ptr, extents_ptr, filter.ptr,
                                                                     nearestRef_ptr, nearestPt_ptr);
            if (dtStatusSucceed(result))
            {
                nearestRef = CModule.read32(nearestRef_ptr);
                nearestPtX = CModule.readFloat(nearestPt_ptr + 0);
                nearestPtY = CModule.readFloat(nearestPt_ptr + 4);
                nearestPtZ = CModule.readFloat(nearestPt_ptr + 8);
            }
            return result;
        }

        /** Intializes a sliced path query. */
        public function initSlicedFindPath(startRef:int, endRef:int, startPosX:Number, startPosY:Number,
                                           startPosZ:Number, endPosX:Number, endPosY:Number, endPosZ:Number,
                                           filter:DTQueryFilter, options = 0):int
        {
            var offset:int = 0;

            var startPos_ptr:int = _helperMem + offset;
            offset += 12;
            CModule.writeFloat(startPos_ptr + 0, startPosX);
            CModule.writeFloat(startPos_ptr + 4, startPosY);
            CModule.writeFloat(startPos_ptr + 8, startPosZ);

            var endPos_ptr:int = _helperMem + offset;
            offset += 12;
            CModule.writeFloat(endPos_ptr + 0, endPosX);
            CModule.writeFloat(endPos_ptr + 4, endPosY);
            CModule.writeFloat(endPos_ptr + 8, endPosZ);

            return internal_dtNavMeshQuery_initSlicedFindPath(ptr, startRef, endRef, startPos_ptr, endPos_ptr,
                                                              filter.ptr, options);
        }

        public var doneIters:int;

        /** Updates an in-progress sliced path query. */
        public function updateSlicedFindPath(maxIter:int):int
        {
            var result:int = internal_dtNavMeshQuery_updateSlicedFindPath(ptr, maxIter, _helperMem);
            doneIters = CModule.read32(_helperMem);
            return result;
        }

        /** Finalizes and returns the results of a sliced path query. */
        public function finalizeSlicedFindPath():int
        {
            var offset:int = 0;

            var pathCount_ptr:int = _helperMem + offset;
            offset += 4;

            var path_ptr:int = _helperMem + offset;
            var maxPath:int = (HELPER_MEM_SIZE - offset) / 4;

            var result:int = internal_dtNavMeshQuery_finalizeSlicedFindPath(ptr, path_ptr, pathCount_ptr, maxPath);
            if (dtStatusSucceed(result))
            {
                polys.length = CModule.read32(pathCount_ptr);
                for (var i:int = polys.length - 1; i >= 0; --i)
                    polys[i] = CModule.read32(path_ptr + 4 * i);
            }
            return result;
        }

        /**
         * Finalizes and returns the results of an incomplete sliced path query,
         * returning the path to the furthest polygon on the existing path that
         * was visited during the search.
         */
        public function finalizeSlicedFindPathPartial(existing:Vector.<int>):int
        {
            var i:int;
            var offset:int = 0;

            var existing_ptr:int = _helperMem + offset;
            var existingSize:int = existing.length;
            for (i = 0; i < existingSize; ++i)
                CModule.write32(_helperMem + 4 * i, existing[i]);
            offset += 4 * existingSize;

            var pathCount_ptr:int = _helperMem + offset;
            offset += 4;

            var path_ptr:int = _helperMem + offset;
            var maxPath:int = (HELPER_MEM_SIZE - offset) / 4;

            var result:int = internal_dtNavMeshQuery_finalizeSlicedFindPathPartial(ptr, existing_ptr, existingSize,
                                                                                   path_ptr, pathCount_ptr, maxPath);
            if (dtStatusSucceed(result))
            {
                polys.length = CModule.read32(pathCount_ptr);
                for (i = polys.length - 1; i >= 0; --i)
                    polys[i] = CModule.read32(path_ptr + 4 * i);
            }
            return result;
        }

        public const polys:Vector.<int> = new Vector.<int>();

        /** Finds polygons that overlap the search box. */
        public function queryPolygons(centerX:Number, centerY:Number, centerZ:Number, extentsX:Number, extentsY:Number,
                                      extentsZ:Number, filter:DTQueryFilter):int
        {
            var offset:int = 0;

            var center_ptr:int = _helperMem + offset;
            offset += 12;
            CModule.writeFloat(center_ptr, centerX);
            CModule.writeFloat(center_ptr + 4, centerY);
            CModule.writeFloat(center_ptr + 8, centerZ);

            var extents_ptr:int = _helperMem + offset;
            offset += 12;
            CModule.writeFloat(extents_ptr, extentsX);
            CModule.writeFloat(extents_ptr + 4, extentsY);
            CModule.writeFloat(extents_ptr + 8, extentsZ);

            var polyCount_ptr:int = _helperMem + offset;
            offset += 4;

            var polys_ptr:int = _helperMem + offset;
            var maxPolys:int = (HELPER_MEM_SIZE - offset) / 4;

            var result:int = internal_dtNavMeshQuery_queryPolygons(ptr, center_ptr, extents_ptr, filter.ptr,
                                                                   polys_ptr, polyCount_ptr, maxPolys);
            if (dtStatusSucceed(result))
            {
                polys.length = CModule.read32(polyCount_ptr);
                for (var i:int = polys.length - 1; i >= 0; --i)
                    polys[i] = CModule.read32(polys_ptr + 4 * i);
            }
            return result;
        }

        /** Returns true if the polygon reference is in the closed list. */
        public function isInClosedList(ref:int):Boolean
        {
            return internal_dtNavMeshQuery_isInClosedList(ptr, ref);
        }

        public override function alloc():Boolean
        {
            ptr = internal_dtAllocNavMeshQuery();
            _helperMem = CModule.malloc(HELPER_MEM_SIZE);
            return ptr != 0;
        }

        public override function free():void
        {
            internal_dtFreeNavMeshQuery(ptr);
            ptr = 0;
            CModule.free(_helperMem);
        }
    }
}