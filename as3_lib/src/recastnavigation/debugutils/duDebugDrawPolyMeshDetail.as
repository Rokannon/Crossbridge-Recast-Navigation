package recastnavigation.debugutils
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_duDebugDrawPolyMeshDetail;
    import recastnavigation.recast.meshdetail.RCPolyMeshDetail;

    use namespace rn_internal;

    public function duDebugDrawPolyMeshDetail(dd:DUDebugDraw, dmesh:RCPolyMeshDetail):void
    {
        internal_duDebugDrawPolyMeshDetail(dd.ptr, dmesh.ptr);
    }
}