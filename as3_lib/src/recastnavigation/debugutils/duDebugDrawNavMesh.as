package recastnavigation.debugutils
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.detour.navmesh.DTNavMesh;
    import recastnavigation.internal_api.internal_duDebugDrawNavMesh;

    use namespace rn_internal;

    public function duDebugDrawNavMesh(dd:DUDebugDraw, mesh:DTNavMesh, flags:int):void
    {
        internal_duDebugDrawNavMesh(dd.ptr, mesh.ptr, flags);
    }
}