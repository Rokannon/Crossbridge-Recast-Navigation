package app.model.tool
{
    import app.model.tool.enum.TesterToolState;

    import flash.geom.Point;

    import recastnavigation.detour.status.dtStatusInProgress;
    import recastnavigation.detour.status.dtStatusSucceed;
    import recastnavigation.detour.status.enum.DTStatus;

    public class TesterTool extends MeshTool
    {
        public const startPoint:Point = new Point();
        public const endPoint:Point = new Point();

        private var _startRef:int;
        private var _endRef:int;
        private var _slicedStatus:int;

        public function TesterTool()
        {
            super();
        }

        public function get startRef():int
        {
            return _startRef;
        }

        public function get endRef():int
        {
            return _endRef;
        }

        public override function handleClick(x:Number, y:Number, shift:Boolean):void
        {
            if (shift)
                endPoint.setTo(x, y);
            else
                startPoint.setTo(x, y);
            recalc();
        }

        private function recalc():void
        {
            _soloMesh.query.findNearestPoly(startPoint.x, 0, startPoint.y, 2, 4, 2, _soloMesh.filter);
            _startRef = _soloMesh.query.nearestRef;
            _soloMesh.query.findNearestPoly(endPoint.x, 0, endPoint.y, 2, 4, 2, _soloMesh.filter);
            _endRef = _soloMesh.query.nearestRef;
            if (_toolState == TesterToolState.STRAIGHT)
            {
                _soloMesh.query.findPath(_startRef, _endRef, startPoint.x, 0, startPoint.y, endPoint.x, 0, endPoint.y,
                                         _soloMesh.filter);
                _soloMesh.query.findStraightPath(startPoint.x, 0, startPoint.y, endPoint.x, 0, endPoint.y,
                                                 _soloMesh.query.polys);
            }
            else
            {
                _slicedStatus = _soloMesh.query.initSlicedFindPath(_startRef, _endRef, startPoint.x, 0, startPoint.y,
                                                                   endPoint.x, 0, endPoint.y, _soloMesh.filter, 0);
            }
            dispatchEvent(new MeshToolEvent(MeshToolEvent.RENDER));
        }

        public override function wake():void
        {
            super.wake();
            recalc();
        }

        override public function handleUpdate(dt:Number):void
        {
            super.handleUpdate(dt);
            var renderPending:Boolean;
            if (_toolState == TesterToolState.SLICED)
            {
                if (dtStatusInProgress(_slicedStatus))
                {
                    _slicedStatus = _soloMesh.query.updateSlicedFindPath(1);
                    _soloMesh.query.straightPath.length = 0;
                    _soloMesh.query.polys.length = 0;
                    renderPending = true;
                }
                if (dtStatusSucceed(_slicedStatus))
                {
                    _soloMesh.query.finalizeSlicedFindPath();
                    _soloMesh.query.findStraightPath(startPoint.x, 0, startPoint.y, endPoint.x, 0, endPoint.y,
                                                     _soloMesh.query.polys);
                    _slicedStatus = DTStatus.DT_FAILURE;
                    renderPending = true;
                }
                if (renderPending)
                    dispatchEvent(new MeshToolEvent(MeshToolEvent.RENDER));
            }
        }

        override public function setToolState(toolState:int):void
        {
            super.setToolState(toolState);
            if (_isWake)
                recalc();
        }
    }
}