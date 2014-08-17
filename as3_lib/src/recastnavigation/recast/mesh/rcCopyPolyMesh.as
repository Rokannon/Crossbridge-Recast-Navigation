package recastnavigation.recast.mesh
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_rcCopyPolyMesh;
    import recastnavigation.recast.RCContext;

    use namespace rn_internal;

    /**
     * Copies the poly mesh data from src to dst.
     */
    public function rcCopyPolyMesh(ctx:RCContext, src:RCPolyMesh, dst:RCPolyMesh):Boolean
    {
        return internal_rcCopyPolyMesh(ctx.ptr, src.ptr, dst.ptr);
    }
}