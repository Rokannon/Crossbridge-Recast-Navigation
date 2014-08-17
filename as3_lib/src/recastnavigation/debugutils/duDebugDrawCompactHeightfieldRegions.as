package recastnavigation.debugutils
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_duDebugDrawCompactHeightfieldRegions;
    import recastnavigation.recast.RCCompactHeightfield;

    use namespace rn_internal;

    public function duDebugDrawCompactHeightfieldRegions(dd:DUDebugDraw, chf:RCCompactHeightfield):void
    {
        internal_duDebugDrawCompactHeightfieldRegions(dd.ptr, chf.ptr);
    }
}