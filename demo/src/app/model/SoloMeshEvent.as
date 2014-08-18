package app.model
{
    import flash.events.Event;

    public class SoloMeshEvent extends Event
    {
        public static const BUILD_COMPLETE:String = "buildComplete";
        public static const MESH_SELECTED:String = "meshSelected";
        public static const TOOL_CHANGED:String = "toolChanged";
        public static const NO_TOOL_SELECTED:String = "noToolSelected";
        public static const NO_MESH_SELECTED:String = "noMeshSelected";
        public static const MESH_IS_NOT_BUILT:String = "meshIsNotBuilt";

        public function SoloMeshEvent(type:String)
        {
            super(type);
        }
    }
}