package recastnavigation.debugutils
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.mallocInt32Vector;
    import recastnavigation.core.utils.mallocInt8Vector;
    import recastnavigation.core.utils.mallocNumberVector;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_duDebugDrawTriMesh;

    use namespace rn_internal;

    public function duDebugDrawTriMesh(dd:DUDebugDraw, verts:Vector.<Number>, tris:Vector.<int>,
                                       normals:Vector.<Number>, flags:Vector.<int>, texScale:Number):void
    {
        var verts_ptr:int = mallocNumberVector(verts);
        var nverts:int = verts.length / 3;
        var tris_ptr:int = mallocInt32Vector(tris);
        var normals_ptr:int = mallocNumberVector(normals);
        var ntris:int = tris.length / 3;
        var flags_ptr:int = mallocInt8Vector(flags);
        internal_duDebugDrawTriMesh(dd.ptr, verts_ptr, nverts, tris_ptr, normals_ptr, ntris, flags_ptr, texScale);
        CModule.free(verts_ptr);
        CModule.free(tris_ptr);
        CModule.free(normals_ptr);
        CModule.free(flags_ptr);
    }
}