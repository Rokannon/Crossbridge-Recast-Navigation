package recastnavigation.recast
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_rcErodeWalkableArea;

    use namespace rn_internal;

    /**
     * Basically, any spans that are closer to a boundary or obstruction
     * than the specified radius are marked as unwalkable. This method
     * is usually called immediately after the heightfield has been built.
     */
    public function rcErodeWalkableArea(ctx:RCContext, radius:int, chf:RCCompactHeightfield):Boolean
    {
        return internal_rcErodeWalkableArea(ctx.ptr, radius, chf.ptr);
    }
}