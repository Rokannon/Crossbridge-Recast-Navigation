package recastnavigation.debugutils
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.detour.navmesh.DTNavMesh;
    import recastnavigation.detour.navmeshquery.DTNavMeshQuery;
    import recastnavigation.internal_api.internal_duDebugDrawNavMeshWithClosedList;

    use namespace rn_internal;

    public function duDebugDrawNavMeshWithClosedList(dd:DUDebugDraw, mesh:DTNavMesh, query:DTNavMeshQuery,
                                                     flags:int):void
    {
        internal_duDebugDrawNavMeshWithClosedList(dd.ptr, mesh.ptr, query.ptr, flags);
    }
}