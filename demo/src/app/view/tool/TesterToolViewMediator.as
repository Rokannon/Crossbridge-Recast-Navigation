package app.view.tool
{
    import app.data.ColorData;
    import app.data.MeshBounds;
    import app.model.GUIModel;
    import app.model.SoloMesh;
    import app.model.enum.ToolType;
    import app.model.tool.MeshToolEvent;
    import app.model.tool.TesterTool;
    import app.view.*;
    import app.view.debugdraw.PolyViewDUDebugDraw;

    import flash.geom.Point;
    import flash.utils.Dictionary;

    import recastnavigation.debugutils.duDebugDrawNavMeshPoly;
    import recastnavigation.detour.navmesh.DTMeshHeader;
    import recastnavigation.detour.navmesh.DTMeshTile;

    import starling.display.Shape;
    import starling.display.Sprite;

    public class TesterToolViewMediator
    {
        private static const START_COL:ColorData = new ColorData(128, 25, 0, 192);
        private static const END_COL:ColorData = new ColorData(51, 102, 0, 129);
        private static const PATH_COL:ColorData = new ColorData(64, 16, 0, 220);
        private static const POLY_COL:ColorData = new ColorData(255, 196, 0, 64);
        private static const RADIUS:Number = 6;
        private static const HELPER_POINT:Point = new Point();
        private static const HELPER_BOUNDS_1:MeshBounds = new MeshBounds();
        private static const HELPER_BOUNDS_2:MeshBounds = new MeshBounds();
        private static const HELPER_HEADER:DTMeshHeader = new DTMeshHeader();
        private static const HELPER_COLOR:ColorData = new ColorData();

        private var _toolView:Sprite;
        private var _soloMesh:SoloMesh;
        private var _meshTool:TesterTool;

        private const _startPointView:Shape = new Shape();
        private const _endPointView:Shape = new Shape();
        private const _pathView:Shape = new Shape();
        private const _polyViewDebugDraw:PolyViewDUDebugDraw = new PolyViewDUDebugDraw(SoloMesh.TEXTURE_SIZE);
        private const _polyViewByRef:Dictionary = new Dictionary();
        private const _polyViews:Vector.<PolygonView> = new Vector.<PolygonView>();

        public function TesterToolViewMediator()
        {
            drawCircle(_startPointView, RADIUS, START_COL);
            drawCircle(_endPointView, RADIUS, END_COL);
            _polyViewDebugDraw.alloc();
        }

        public function connect(toolView:Sprite, soloMesh:SoloMesh):void
        {
            _toolView = toolView;
            _soloMesh = soloMesh;
            _meshTool = _soloMesh.meshTools[ToolType.TOOL_TESTER] as TesterTool;
            _meshTool.addEventListener(MeshToolEvent.WAKE, onWake);
            _meshTool.addEventListener(MeshToolEvent.SLEEP, onSleep);
            _meshTool.addEventListener(MeshToolEvent.RENDER, onRender);
        }

        private function onWake(event:MeshToolEvent):void
        {
            _toolView.addChild(_startPointView);
            _toolView.addChild(_endPointView);
            _toolView.addChild(_pathView);
            _soloMesh.meshInfo.getMeshBoundMin(HELPER_BOUNDS_1);
            _soloMesh.meshInfo.getMeshBoundMax(HELPER_BOUNDS_2);
            _polyViewDebugDraw.reset(HELPER_BOUNDS_1.x - GUIModel.BOUNDS_PADDING,
                                     HELPER_BOUNDS_1.z - GUIModel.BOUNDS_PADDING,
                                     HELPER_BOUNDS_2.x + GUIModel.BOUNDS_PADDING,
                                     HELPER_BOUNDS_2.z + GUIModel.BOUNDS_PADDING);
            render();
        }

        private function onSleep(event:MeshToolEvent):void
        {
            _toolView.removeChild(_startPointView);
            _toolView.removeChild(_endPointView);
            _toolView.removeChild(_pathView);
            for each (var polyView:PolygonView in _polyViews)
            {
                _toolView.removeChild(polyView);
                delete _polyViewByRef[polyView.polyRef];
                polyView.graphics.clear();
                polyView.dispose();
            }
            _polyViews.length = 0;
        }

        private function onRender(event:MeshToolEvent):void
        {
            render();
        }

        private function render():void
        {
            var i:int;

            // Points
            _soloMesh.coordSpace.modelToScene(_meshTool.startPoint, HELPER_POINT);
            _startPointView.x = HELPER_POINT.x;
            _startPointView.y = HELPER_POINT.y;
            _soloMesh.coordSpace.modelToScene(_meshTool.endPoint, HELPER_POINT);
            _endPointView.x = HELPER_POINT.x;
            _endPointView.y = HELPER_POINT.y;

            // Path
            _pathView.graphics.clear();
            if (_soloMesh.query.straightPath.length != 0)
            {
                _pathView.graphics.lineStyle(2, PATH_COL.getFlashColor(), PATH_COL.getFlashAlpha());
                _soloMesh.coordSpace.modelToScene(_meshTool.startPoint, HELPER_POINT);
                _pathView.graphics.moveTo(HELPER_POINT.x, HELPER_POINT.y);
                for (i = 0; i < _soloMesh.query.straightPath.length; i += 3)
                {
                    HELPER_POINT.setTo(_soloMesh.query.straightPath[i + 0], _soloMesh.query.straightPath[i + 2]);
                    _soloMesh.coordSpace.modelToScene(HELPER_POINT, HELPER_POINT);
                    _pathView.graphics.lineTo(HELPER_POINT.x, HELPER_POINT.y);
                }
                _soloMesh.coordSpace.modelToScene(_meshTool.endPoint, HELPER_POINT);
                _pathView.graphics.lineTo(HELPER_POINT.x, HELPER_POINT.y);
            }

            // All Polys
            var tile:DTMeshTile = _soloMesh.navMesh.getTileAt(0, 0, 0);
            var base:int = _soloMesh.navMesh.getPolyRefBase(tile);
            tile.getHeader(HELPER_HEADER);
            for (i = 0; i < HELPER_HEADER.polyCount; ++i)
            {
                var polyRef:int = base | i;
                var polyView:PolygonView;

                if (!(polyRef in _polyViewByRef))
                {
                    polyView = new PolygonView();
                    _polyViewDebugDraw.graphics = polyView.graphics;
                    _polyViewDebugDraw.material = polyView.material;
                    duDebugDrawNavMeshPoly(_polyViewDebugDraw, _soloMesh.navMesh, polyRef, 0);
                    _polyViews.push(polyView);
                    _polyViewByRef[polyRef] = polyView;
                    polyView.polyRef = polyRef;
                }
                polyView = _polyViewByRef[polyRef];

                if (_soloMesh.query.isInClosedList(polyRef))
                {
                    _toolView.addChild(polyView);
                    HELPER_COLOR.copyFrom(POLY_COL);
                    if (_soloMesh.query.polys.indexOf(polyRef) != -1)
                        HELPER_COLOR.mutliply(0.7);
                    polyView.material.color = HELPER_COLOR.getFlashColor();
                    polyView.material.alpha = HELPER_COLOR.getFlashAlpha();
                }
                else
                    _toolView.removeChild(polyView);
            }
        }

        private function drawCircle(shape:Shape, radius:Number, color:ColorData):void
        {
            shape.graphics.clear();
            shape.graphics.beginFill(color.getFlashColor(), color.getFlashAlpha());
            shape.graphics.drawCircle(0, 0, radius);
            shape.graphics.endFill();
        }
    }
}