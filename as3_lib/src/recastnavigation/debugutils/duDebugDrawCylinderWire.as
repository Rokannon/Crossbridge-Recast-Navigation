package recastnavigation.debugutils
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.internal_duDebugDrawCylinderWire;

    use namespace rn_internal;

    public function duDebugDrawCylinderWire(dd:DUDebugDraw, minx:Number, miny:Number, minz:Number, maxx:Number,
                                            maxy:Number, maxz:Number, col:int, lineWidth:Number):void
    {
        internal_duDebugDrawCylinderWire(dd.ptr, minx, miny, minz, maxx, maxy, maxz, col, lineWidth);
    }
}