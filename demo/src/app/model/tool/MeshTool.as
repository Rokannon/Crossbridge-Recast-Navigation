package app.model.tool
{
    import app.model.SoloMesh;

    import flash.events.EventDispatcher;

    public class MeshTool extends EventDispatcher
    {
        protected var _soloMesh:SoloMesh;
        protected var _toolState:int;
        protected var _isWake:Boolean;

        public function MeshTool()
        {
            super();
        }

        public function get soloMesh():SoloMesh
        {
            return _soloMesh;
        }

        public function get toolState():int
        {
            return _toolState;
        }

        public function connect(soloMesh:SoloMesh):void
        {
            _soloMesh = soloMesh;
        }

        public function setToolState(toolState:int):void
        {
            _toolState = toolState;
        }

        public function handleClick(x:Number, y:Number, shift:Boolean):void
        {
        }

        public function sleep():void
        {
            _isWake = false;
            dispatchEvent(new MeshToolEvent(MeshToolEvent.SLEEP));
        }

        public function wake():void
        {
            _isWake = true;
            dispatchEvent(new MeshToolEvent(MeshToolEvent.WAKE));
        }

        public function handleUpdate(dt:Number):void
        {
        }
    }
}