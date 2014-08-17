package recastnavigation.recast.filter
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_rcFilterLedgeSpans;
    import recastnavigation.recast.RCContext;
    import recastnavigation.recast.RCHeightfield;

    use namespace rn_internal;

    /**
     * A ledge is a span with one or more neighbors whose maximum is further away
     * than "walkableClimb" from the current span's maximum. This method removes
     * the impact of the overestimation of conservative voxelization so the
     * resulting mesh will not have regions hanging in the air over ledges.
     */
    public function rcFilterLedgeSpans(ctx:RCContext, walkableHeight:int, walkableClimb:int, solid:RCHeightfield):void
    {
        internal_rcFilterLedgeSpans(ctx.ptr, walkableHeight, walkableClimb, solid.ptr);
    }
}