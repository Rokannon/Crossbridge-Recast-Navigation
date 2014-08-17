package recastnavigation.recast
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.mallocInt32Vector;
    import recastnavigation.core.utils.mallocInt8Vector;
    import recastnavigation.core.utils.mallocNumberVector;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_rcRasterizeTriangles;

    use namespace rn_internal;

    /**
     * Rasterizes an indexed triangle mesh into the specified heightfield.
     */
    public function rcRasterizeTriangles(ctx:RCContext, verts:Vector.<Number>, tris:Vector.<int>, areas:Vector.<int>,
                                         solid:RCHeightfield, flagMergeThr:int = 1.0):void
    {
        var verts_ptr:int = mallocNumberVector(verts);
        var nv:int = verts.length / 3;
        var tris_ptr:int = mallocInt32Vector(tris);
        var areas_ptr:int = mallocInt8Vector(areas);
        var nt:int = tris.length / 3;
        internal_rcRasterizeTriangles(ctx.ptr, verts_ptr, nv, tris_ptr, areas_ptr, nt, solid.ptr, flagMergeThr);
        CModule.free(verts_ptr);
        CModule.free(tris_ptr);
        CModule.free(areas_ptr);
    }
}