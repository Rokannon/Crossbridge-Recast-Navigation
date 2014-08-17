package recastnavigation.recast.contour
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_rcBuildContours;
    import recastnavigation.recast.RCCompactHeightfield;
    import recastnavigation.recast.RCContext;
    import recastnavigation.recast.enum.RCBuildContoursFlags;

    use namespace rn_internal;

    /**
     * Builds a contour set from the region outlines in the provided compact heightfield.
     */
    public function rcBuildContours(ctx:RCContext, chf:RCCompactHeightfield, maxError:Number, maxEdgeLen:int,
                                    cset:RCContourSet,
                                    buildFlags:int = RCBuildContoursFlags.RC_CONTOUR_TESS_WALL_EDGES):Boolean
    {
        return internal_rcBuildContours(ctx.ptr, chf.ptr, maxError, maxEdgeLen, cset.ptr, buildFlags);
    }
}