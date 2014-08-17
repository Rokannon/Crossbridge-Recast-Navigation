package recastnavigation.detour.navmeshquery
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.detour.navmesh.DTMeshTile;
    import recastnavigation.detour.navmesh.DTPoly;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_dtFree;
    import recastnavigation.internal_api.internal_dtQueryFilter_alloc;
    import recastnavigation.internal_api.internal_dtQueryFilter_getAreaCost;
    import recastnavigation.internal_api.internal_dtQueryFilter_getCost;
    import recastnavigation.internal_api.internal_dtQueryFilter_getExcludeFlags;
    import recastnavigation.internal_api.internal_dtQueryFilter_getIncludeFlags;
    import recastnavigation.internal_api.internal_dtQueryFilter_passFilter;
    import recastnavigation.internal_api.internal_dtQueryFilter_setAreaCost;
    import recastnavigation.internal_api.internal_dtQueryFilter_setExcludeFlags;
    import recastnavigation.internal_api.internal_dtQueryFilter_setIncludeFlags;

    use namespace rn_internal;

    /**
     * Defines polygon filtering and traversal costs for navigation mesh query operations.
     */
    public class DTQueryFilter extends RNBase
    {
        /** Returns true if the polygon can be visited.  (I.e. Is traversable.) */
        public function passFilter(polyRef:int, tile:DTMeshTile, poly:DTPoly):Boolean
        {
            return internal_dtQueryFilter_passFilter(ptr, polyRef, tile.ptr, poly.ptr);
        }

        /**
         * Returns cost to move from the beginning to the end of a line segment
         * that is fully contained within a polygon.
         */
        public function getCost(paX:Number, paY:Number, paZ:Number, pbX:Number, pbY:Number, pbZ:Number, prevRef:int,
                                prevTile:DTMeshTile, prevPoly:DTPoly, curRef:int, curTile:DTMeshTile, curPoly:DTPoly,
                                nextRef:int, nextTile:DTMeshTile, nextPoly:DTPoly):Number
        {
            var pa_ptr:int = CModule.malloc(12);
            CModule.writeFloat(pa_ptr, paX);
            CModule.writeFloat(pa_ptr + 4, paY);
            CModule.writeFloat(pa_ptr + 8, paZ);
            var pb_ptr:int = CModule.malloc(12);
            CModule.writeFloat(pb_ptr, pbX);
            CModule.writeFloat(pb_ptr + 4, pbY);
            CModule.writeFloat(pb_ptr + 8, pbZ);
            var result:Number = internal_dtQueryFilter_getCost(ptr, pa_ptr, pb_ptr, prevRef, prevTile.ptr, prevPoly.ptr,
                                                               curRef, curTile.ptr, curPoly.ptr, nextRef, nextTile.ptr,
                                                               nextPoly.ptr);
            CModule.free(pa_ptr);
            CModule.free(pb_ptr);
            return result;
        }

        /** Returns the traversal cost of the area. */
        public function getAreaCost(index:int):Number
        {
            return internal_dtQueryFilter_getAreaCost(ptr, index);
        }

        /** Sets the traversal cost of the area. */
        public function setAreaCost(index:int, value:Number):void
        {
            internal_dtQueryFilter_setAreaCost(ptr, index, value);
        }

        /**
         * Returns the include flags for the filter.
         * Any polygons that include one or more of
         * these flags will be included in the operation.
         */
        public function getIncludeFlags():int
        {
            return internal_dtQueryFilter_getIncludeFlags(ptr);
        }

        /** Sets the include flags for the filter. */
        public function setIncludeFlags(value:int):void
        {
            internal_dtQueryFilter_setIncludeFlags(ptr, value);
        }

        /**
         * Returns the exclude flags for the filter.
         * Any polygons that include one ore more of
         * these flags will be excluded from the operation.
         */
        public function getExcludeFlags():int
        {
            return internal_dtQueryFilter_getExcludeFlags(ptr);
        }

        /** Sets the exclude flags for the filter. */
        public function setExcludeFlags(value:int):void
        {
            internal_dtQueryFilter_setExcludeFlags(ptr, value);
        }

        public override function alloc():Boolean
        {
            ptr = internal_dtQueryFilter_alloc();
            return ptr != 0;
        }

        public override function free():void
        {
            internal_dtFree(ptr);
            ptr = 0;
        }
    }
}