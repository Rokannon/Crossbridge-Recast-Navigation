package recastnavigation.debugutils
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_duDebugDrawBoxWire;

    use namespace rn_internal;

    public function duDebugDrawBoxWire(dd:DUDebugDraw, minx:Number, miny:Number, minz:Number, maxx:Number, maxy:Number,
                                       maxz:Number, col:int, lineWidth:Number):void
    {
        internal_duDebugDrawBoxWire(dd.ptr, minx, miny, minz, maxx, maxy, maxz, col, lineWidth);
    }
}