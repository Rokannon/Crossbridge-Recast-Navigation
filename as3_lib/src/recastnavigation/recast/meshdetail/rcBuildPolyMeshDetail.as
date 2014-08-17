package recastnavigation.recast.meshdetail
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_rcBuildPolyMeshDetail;
    import recastnavigation.recast.RCCompactHeightfield;
    import recastnavigation.recast.RCContext;
    import recastnavigation.recast.mesh.RCPolyMesh;

    use namespace rn_internal;

    /**
     * Builds a detail mesh from the provided polygon mesh.
     */
    public function rcBuildPolyMeshDetail(ctx:RCContext, mesh:RCPolyMesh, chf:RCCompactHeightfield, sampleDist:Number,
                                          sampleMaxError:Number, dmesh:RCPolyMeshDetail):Boolean
    {
        return internal_rcBuildPolyMeshDetail(ctx.ptr, mesh.ptr, chf.ptr, sampleDist, sampleMaxError, dmesh.ptr);
    }
}