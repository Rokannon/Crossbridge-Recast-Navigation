package recastnavigation.debugutils
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_duDebugDrawHeightfieldLayer;
    import recastnavigation.recast.RCHeightfieldLayer;

    use namespace rn_internal;

    public function duDebugDrawHeightfieldLayer(dd:DUDebugDraw, layer:RCHeightfieldLayer, idx:int):void
    {
        internal_duDebugDrawHeightfieldLayer(dd.ptr, layer.ptr, idx);
    }
}