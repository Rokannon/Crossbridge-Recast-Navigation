package recastnavigation.debugutils
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.detour.navmesh.DTNavMesh;
    import recastnavigation.internal_api.internal_duDebugDrawNavMeshPoly;

    use namespace rn_internal;

    public function duDebugDrawNavMeshPoly(dd:DUDebugDraw, mesh:DTNavMesh, ref:int, col:int):void
    {
        internal_duDebugDrawNavMeshPoly(dd.ptr, mesh.ptr, ref, col);
    }
}