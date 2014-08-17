package recastnavigation.recast.mesh
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_rcBuildPolyMesh;
    import recastnavigation.recast.RCContext;
    import recastnavigation.recast.contour.RCContourSet;

    use namespace rn_internal;

    /**
     * Builds a polygon mesh from the provided contours.
     */
    public function rcBuildPolyMesh(ctx:RCContext, cset:RCContourSet, nvp:int, mesh:RCPolyMesh):Boolean
    {
        return internal_rcBuildPolyMesh(ctx.ptr, cset.ptr, nvp, mesh.ptr);
    }
}