package app.model
{
    import flash.events.Event;

    public class GUIModelEvent extends Event
    {
        public static const TOGGLE_SHOW_LOG:String = "toggleShowLog";

        public function GUIModelEvent(type:String)
        {
            super(type);
        }
    }
}