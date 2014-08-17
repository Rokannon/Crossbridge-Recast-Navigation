package recastnavigation.debugutils
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.detour.navmesh.DTNavMesh;
    import recastnavigation.internal_api.internal_duDebugDrawNavMeshPolysWithFlags;

    use namespace rn_internal;

    public function duDebugDrawNavMeshPolysWithFlags(dd:DUDebugDraw, mesh:DTNavMesh, polyFlags:int, col:int):void
    {
        internal_duDebugDrawNavMeshPolysWithFlags(dd.ptr, mesh.ptr, polyFlags, col);
    }
}