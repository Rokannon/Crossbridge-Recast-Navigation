package app.rccontext
{
    import flash.events.Event;

    public class CustomRCContextEvent extends Event
    {
        public static const MESSAGE:String = "message";
        public static const RESET:String = "reset";

        private var _logCategory:int;
        private var _message:String;

        public function CustomRCContextEvent(type:String, logCategory:int = 0, message:String = null)
        {
            super(type);
            _logCategory = logCategory;
            _message = message;
        }

        public function get logCategory():int
        {
            return _logCategory;
        }

        public function get message():String
        {
            return _message;
        }
    }
}