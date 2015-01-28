package recastnavigation.detour.crowd
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.offsetBytes;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_sizeof_dtCrowdAgentDebugInfo;

    use namespace rn_internal;

    public class DTCrowdAgentDebugInfo extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_IDX:int = offsetBytes(4, DTCrowdAgentDebugInfo);
        rn_internal static const OFFSET_OPT_START:int = offsetBytes(12, DTCrowdAgentDebugInfo);
        rn_internal static const OFFSET_OPT_END:int = offsetBytes(12, DTCrowdAgentDebugInfo);
        rn_internal static const OFFSET_VOD:int = offsetBytes(4, DTCrowdAgentDebugInfo);

        public function get idx():int
        {
            return CModule.read32(ptr + OFFSET_IDX);
        }

        public function set idx(value:int):void
        {
            CModule.write32(ptr + OFFSET_IDX, value);
        }

        public function get optStartX():Number
        {
            return CModule.readFloat(ptr + OFFSET_OPT_START);
        }

        public function set optStartX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_OPT_START, value);
        }

        public function get optStartY():Number
        {
            return CModule.readFloat(ptr + OFFSET_OPT_START + 4);
        }

        public function set optStartY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_OPT_START + 4, value);
        }

        public function get optStartZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_OPT_START + 8);
        }

        public function set optStartZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_OPT_START + 8, value);
        }

        public function get optEndX():Number
        {
            return CModule.readFloat(ptr + OFFSET_OPT_END);
        }

        public function set optEndX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_OPT_END, value);
        }

        public function get optEndY():Number
        {
            return CModule.readFloat(ptr + OFFSET_OPT_END + 4);
        }

        public function set optEndY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_OPT_END + 4, value);
        }

        public function get optEndZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_OPT_END + 8);
        }

        public function set optEndZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_OPT_END + 8, value);
        }

        override public function alloc():Boolean
        {
            ptr = CModule.malloc(internal_sizeof_dtCrowdAgentDebugInfo());
            return ptr != 0;
        }

        override public function free():void
        {
            CModule.free(ptr);
            ptr = 0;
        }
    }
}