package app.model
{
    import flash.events.EventDispatcher;

    public class GUIModel extends EventDispatcher
    {
        public static const BOUNDS_PADDING:Number = 1;

        private var _showLog:Boolean = false;

        public function GUIModel()
        {
        }

        public function get showLog():Boolean
        {
            return _showLog;
        }

        public function set showLog(value:Boolean):void
        {
            if (_showLog != value)
            {
                _showLog = value;
                dispatchEvent(new GUIModelEvent(GUIModelEvent.TOGGLE_SHOW_LOG));
            }
        }
    }
}