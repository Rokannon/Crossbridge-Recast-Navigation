package recastnavigation.recast.mesh
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.copyBytes;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_rcMergePolyMeshes;
    import recastnavigation.recast.RCContext;

    use namespace rn_internal;

    /**
     * Merges multiple polygon meshes into a single mesh.
     */
    public function rcMergePolyMeshes(ctx:RCContext, meshes:Vector.<RCPolyMesh>, mesh:RCPolyMesh):Boolean
    {
        var nmeshes:int = meshes.length;
        var meshes_ptr:int = CModule.malloc(nmeshes * RCPolyMesh.SIZE);
        for (var i:int = 0; i < nmeshes; ++i)
        {
            copyBytes(meshes[i].ptr, meshes_ptr + RCPolyMesh.SIZE * i, RCPolyMesh.SIZE);
        }
        var res:Boolean = internal_rcMergePolyMeshes(ctx.ptr, meshes_ptr, nmeshes, mesh.ptr);
        CModule.free(meshes_ptr);
        return res;
    }
}