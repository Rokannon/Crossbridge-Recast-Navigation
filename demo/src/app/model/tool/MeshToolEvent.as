package app.model.tool
{
    import flash.events.Event;

    public class MeshToolEvent extends Event
    {
        public static const RENDER:String = "render";
        public static const WAKE:String = "wake";
        public static const SLEEP:String = "sleep";

        public function MeshToolEvent(type:String)
        {
            super(type);
        }
    }
}