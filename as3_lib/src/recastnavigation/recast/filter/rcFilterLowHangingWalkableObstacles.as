package recastnavigation.recast.filter
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_rcFilterLowHangingWalkableObstacles;
    import recastnavigation.recast.RCContext;
    import recastnavigation.recast.RCHeightfield;

    use namespace rn_internal;

    /**
     * Allows the formation of walkable regions that will flow over low lying
     * objects such as curbs, and up structures such as stairways.
     */
    public function rcFilterLowHangingWalkableObstacles(ctx:RCContext, walkableClimb:int, solid:RCHeightfield):void
    {
        internal_rcFilterLowHangingWalkableObstacles(ctx.ptr, walkableClimb, solid.ptr);
    }
}