package recastnavigation.debugutils
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_duDebugDrawHeightfieldWalkable;
    import recastnavigation.recast.RCHeightfield;

    use namespace rn_internal;

    public function duDebugDrawHeightfieldWalkable(dd:DUDebugDraw, hf:RCHeightfield):void
    {
        internal_duDebugDrawHeightfieldWalkable(dd.ptr, hf.ptr);
    }
}