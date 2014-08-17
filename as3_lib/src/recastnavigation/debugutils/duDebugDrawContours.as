package recastnavigation.debugutils
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_duDebugDrawContours;
    import recastnavigation.recast.contour.RCContourSet;

    use namespace rn_internal;

    public function duDebugDrawContours(dd:DUDebugDraw, cset:RCContourSet, alpha:Number = 1.0):void
    {
        internal_duDebugDrawContours(dd.ptr, cset.ptr, alpha);
    }
}