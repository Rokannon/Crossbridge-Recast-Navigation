package recastnavigation.recast.meshdetail
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.offsetBytes;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_rcAllocPolyMeshDetail;
    import recastnavigation.internal_api.internal_rcFreePolyMeshDetail;

    use namespace rn_internal;

    /**
     * Contains triangle meshes that represent detailed height data associated
     * with the polygons in its associated polygon mesh object.
     */
    public class RCPolyMeshDetail extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_MESHES:int = offsetBytes(4, RCPolyMeshDetail);
        rn_internal static const OFFSET_VERTS:int = offsetBytes(4, RCPolyMeshDetail);
        rn_internal static const OFFSET_TRIS:int = offsetBytes(4, RCPolyMeshDetail);
        rn_internal static const OFFSET_NMESHES:int = offsetBytes(4, RCPolyMeshDetail);
        rn_internal static const OFFSET_NVERTS:int = offsetBytes(4, RCPolyMeshDetail);
        rn_internal static const OFFSET_NTRIS:int = offsetBytes(4, RCPolyMeshDetail);

        /** The sub-mesh data. Getter. [Size: 4*#nmeshes] */
        public function getMesh(index:int):int
        {
            return CModule.read32(CModule.read32(ptr + OFFSET_MESHES) + 4 * index);
        }

        /** The sub-mesh data. Setter. [Size: 4*#nmeshes] */
        public function setMesh(index:int, value:int):void
        {
            return CModule.write32(CModule.read32(ptr + OFFSET_MESHES) + 4 * index, value);
        }

        /** The mesh vertices. Getter. [Size: 3*#nverts] */
        public function getVert(index:int):Number
        {
            return CModule.readFloat(CModule.read32(ptr + OFFSET_VERTS) + 4 * index);
        }

        /** The mesh vertices. Setter. [Size: 3*#nverts] */
        public function setVert(index:int, value:Number):void
        {
            CModule.writeFloat(CModule.read32(ptr + OFFSET_VERTS) + 4 * index, value);
        }

        /** The mesh triangles. Getter. [Size: 4*#ntris] */
        public function getTri(index:int):int
        {
            return CModule.read8(CModule.read32(ptr + OFFSET_TRIS) + 1 * index);
        }

        /** The mesh triangles. Setter. [Size: 4*#ntris] */
        public function setTri(index:int, value:int):void
        {
            CModule.write8(CModule.read32(ptr + OFFSET_TRIS) + 1 * index, value);
        }

        /** The number of sub-meshes defined by #meshes. */
        public function get nmeshes():int
        {
            return CModule.read32(ptr + OFFSET_NMESHES);
        }

        public function set nmeshes(value:int):void
        {
            CModule.write32(ptr + OFFSET_NMESHES, value);
        }

        /** The number of vertices in #verts. */
        public function get nverts():int
        {
            return CModule.read32(ptr + OFFSET_NVERTS);
        }

        public function set nverts(value:int):void
        {
            CModule.write32(ptr + OFFSET_NVERTS, value);
        }

        /** The number of triangles in #tris. */
        public function get ntris():int
        {
            return CModule.read32(ptr + OFFSET_NTRIS);
        }

        public function set ntris(value:int):void
        {
            CModule.write32(ptr + OFFSET_NTRIS, value);
        }

        public override function alloc():Boolean
        {
            ptr = internal_rcAllocPolyMeshDetail();
            return ptr != 0;
        }

        public override function free():void
        {
            internal_rcFreePolyMeshDetail(ptr);
            ptr = 0;
        }
    }
}