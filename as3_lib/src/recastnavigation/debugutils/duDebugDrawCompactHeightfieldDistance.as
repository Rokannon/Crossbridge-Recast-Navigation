package recastnavigation.debugutils
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_duDebugDrawCompactHeightfieldDistance;
    import recastnavigation.recast.RCCompactHeightfield;

    use namespace rn_internal;

    public function duDebugDrawCompactHeightfieldDistance(dd:DUDebugDraw, chf:RCCompactHeightfield):void
    {
        internal_duDebugDrawCompactHeightfieldDistance(dd.ptr, chf.ptr);
    }
}