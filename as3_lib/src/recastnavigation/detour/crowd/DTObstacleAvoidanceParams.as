package recastnavigation.detour.crowd
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.offsetBytes;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_dtAlloc_dtObstacleAvoidanceParams;
    import recastnavigation.internal_api.internal_dtFree;

    use namespace rn_internal;

    public class DTObstacleAvoidanceParams extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_VEL_BIAS:int = offsetBytes(4, DTObstacleAvoidanceParams);
        rn_internal static const OFFSET_WEIGHT_DES_VEL:int = offsetBytes(4, DTObstacleAvoidanceParams);
        rn_internal static const OFFSET_WEIGHT_CUR_VEL:int = offsetBytes(4, DTObstacleAvoidanceParams);
        rn_internal static const OFFSET_WEIGHT_SIDE:int = offsetBytes(4, DTObstacleAvoidanceParams);
        rn_internal static const OFFSET_WEIGHT_TOI:int = offsetBytes(4, DTObstacleAvoidanceParams);
        rn_internal static const OFFSET_HORIZ_TIME:int = offsetBytes(4, DTObstacleAvoidanceParams);
        rn_internal static const OFFSET_GRID_SIZE:int = offsetBytes(1, DTObstacleAvoidanceParams);
        rn_internal static const OFFSET_ADAPTIVE_DIVS:int = offsetBytes(1, DTObstacleAvoidanceParams);
        rn_internal static const OFFSET_ADAPTIVE_RINGS:int = offsetBytes(1, DTObstacleAvoidanceParams);
        rn_internal static const OFFSET_ADAPTIVE_DEPTH:int = offsetBytes(1, DTObstacleAvoidanceParams);

        public function get velBias():Number
        {
            return CModule.readFloat(ptr + OFFSET_VEL_BIAS);
        }

        public function set velBias(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_VEL_BIAS, value);
        }

        public function get weightDesVel():Number
        {
            return CModule.readFloat(ptr + OFFSET_WEIGHT_DES_VEL);
        }

        public function set weightDesVel(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_WEIGHT_DES_VEL, value);
        }

        public function get weightCurVel():Number
        {
            return CModule.readFloat(ptr + OFFSET_WEIGHT_CUR_VEL);
        }

        public function set weightCurVel(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_WEIGHT_CUR_VEL, value);
        }

        public function get weightSide():Number
        {
            return CModule.readFloat(ptr + OFFSET_WEIGHT_SIDE);
        }

        public function set weightSide(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_WEIGHT_SIDE, value);
        }

        public function get weightToi():Number
        {
            return CModule.readFloat(ptr + OFFSET_WEIGHT_TOI);
        }

        public function set weightToi(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_WEIGHT_TOI, value);
        }

        public function get horizTime():Number
        {
            return CModule.readFloat(ptr + OFFSET_HORIZ_TIME);
        }

        public function set horizTime(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_HORIZ_TIME, value);
        }

        public function get gridSize():int
        {
            return CModule.read8(ptr + OFFSET_GRID_SIZE);
        }

        public function set gridSize(value:int):void
        {
            CModule.write8(ptr + OFFSET_GRID_SIZE, value);
        }

        public function get adaptiveDivs():int
        {
            return CModule.read8(ptr + OFFSET_ADAPTIVE_DIVS);
        }

        public function set adaptiveDivs(value:int):void
        {
            CModule.write8(ptr + OFFSET_ADAPTIVE_DIVS, value);
        }

        public function get adaptiveRings():int
        {
            return CModule.read8(ptr + OFFSET_ADAPTIVE_RINGS);
        }

        public function set adaptiveRings(value:int):void
        {
            CModule.write8(ptr + OFFSET_ADAPTIVE_RINGS, value);
        }

        public function get adaptiveDepth():int
        {
            return CModule.read8(ptr + OFFSET_ADAPTIVE_DEPTH);
        }

        public function set adaptiveDepth(value:int):void
        {
            CModule.write8(ptr + OFFSET_ADAPTIVE_DEPTH, value);
        }

        public override function alloc():Boolean
        {
            ptr = internal_dtAlloc_dtObstacleAvoidanceParams();
            return ptr != 0;
        }

        public override function free():void
        {
            internal_dtFree(ptr);
            ptr = 0;
        }
    }
}