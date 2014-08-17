package recastnavigation.debugutils
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_duDebugDrawHeightfieldLayers;
    import recastnavigation.recast.RCHeightfieldLayerSet;

    use namespace rn_internal;

    public function duDebugDrawHeightfieldLayers(dd:DUDebugDraw, lset:RCHeightfieldLayerSet):void
    {
        internal_duDebugDrawHeightfieldLayers(dd.ptr, lset.ptr);
    }
}