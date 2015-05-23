package app.view
{
    import app.data.MeshBounds;
    import app.model.SoloMesh;
    import app.model.SoloMeshEvent;

    import flash.events.KeyboardEvent;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.ui.Keyboard;

    import starling.core.Starling;
    import starling.events.Touch;
    import starling.events.TouchEvent;
    import starling.events.TouchPhase;

    public class SceneViewMediator
    {
        private static const HELPER_POINT_1:Point = new Point();
        private static const HELPER_POINT_2:Point = new Point();
        private static const HELPER_RECTANGLE:Rectangle = new Rectangle();
        private static const HELPER_BOUNDS_1:MeshBounds = new MeshBounds();
        private static const HELPER_BOUNDS_2:MeshBounds = new MeshBounds();
        private static const DRAG_TRESHOLD:Number = 3;

        private var _sceneView:SceneView;
        private var _soloMesh:SoloMesh;
        private var _isShiftDown:Boolean;
        private var _mouseDownX:Number;
        private var _mouseDownY:Number;
        private var _isMouseDown:Boolean;
        private var _mouseDownPosX:Number;
        private var _mouseDownPosY:Number;
        private var _dragStarted:Boolean;

        public function SceneViewMediator()
        {
            Starling.current.nativeStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
            Starling.current.nativeStage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        }

        public function connect(sceneView:SceneView, soloMesh:SoloMesh):void
        {
            _sceneView = sceneView;
            _soloMesh = soloMesh;
            _sceneView.addEventListener(TouchEvent.TOUCH, onTouch);
            _soloMesh.addEventListener(SoloMeshEvent.MESH_SELECTED, onMeshSelected);
        }

        private function onKeyDown(event:KeyboardEvent):void
        {
            if (event.keyCode == Keyboard.SHIFT)
                _isShiftDown = true;
        }

        private function onKeyUp(event:KeyboardEvent):void
        {
            if (event.keyCode == Keyboard.SHIFT)
                _isShiftDown = false;
        }

        private function onMeshSelected(event:SoloMeshEvent):void
        {
            _sceneView.getBounds(_sceneView.stage, HELPER_RECTANGLE);
            var scale:Number = Math.min(_sceneView.stage.stageWidth,
                                        _sceneView.stage.stageHeight) / Math.min(HELPER_RECTANGLE.width,
                                                                                 HELPER_RECTANGLE.height);
            _sceneView.scaleX = _sceneView.scaleY = scale;
            _sceneView.getBounds(_sceneView.stage, HELPER_RECTANGLE);
            _sceneView.x = 0.5 * (_sceneView.stage.stageWidth - HELPER_RECTANGLE.width);
            _sceneView.y = 0.5 * (_sceneView.stage.stageHeight - HELPER_RECTANGLE.height);
        }

        private function onTouch(event:TouchEvent):void
        {
            var touch:Touch = event.getTouch(_sceneView.stage);
            if (touch != null)
            {
                touch.getLocation(_sceneView.stage, HELPER_POINT_1);
                switch (touch.phase)
                {
                    case TouchPhase.BEGAN:
                        _mouseDownX = HELPER_POINT_1.x;
                        _mouseDownY = HELPER_POINT_1.y;
                        _mouseDownPosX = _sceneView.x;
                        _mouseDownPosY = _sceneView.y;
                        _isMouseDown = true;
                        break;
                    case TouchPhase.MOVED:
                        HELPER_POINT_2.setTo(_mouseDownX, _mouseDownY);
                        if (_isMouseDown && Point.distance(HELPER_POINT_1, HELPER_POINT_2) > DRAG_TRESHOLD)
                        {
                            _sceneView.x = _mouseDownPosX + (HELPER_POINT_1.x - _mouseDownX);
                            _sceneView.y = _mouseDownPosY + (HELPER_POINT_1.y - _mouseDownY);
                            _dragStarted = true;
                        }
                        break;
                    case TouchPhase.ENDED:
                        if (!_dragStarted)
                        {
                            touch.getLocation(_sceneView, HELPER_POINT_1);
                            if (_soloMesh.meshInfo != null)
                                _soloMesh.coordSpace.sceneToModel(HELPER_POINT_1, HELPER_POINT_2);
                            _soloMesh.handleClick(HELPER_POINT_2.x, HELPER_POINT_2.y, _isShiftDown);
                        }
                        _isMouseDown = false;
                        _dragStarted = false;
                        break;
                }
            }
        }
    }
}