package recastnavigation.recast.mesh
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.offsetBytes;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_rcAllocPolyMesh;
    import recastnavigation.internal_api.internal_rcFreePolyMesh;

    use namespace rn_internal;

    /**
     * Represents a polygon mesh suitable for use in building a navigation mesh.
     */
    public class RCPolyMesh extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_VERTS:int = offsetBytes(4, RCPolyMesh);
        rn_internal static const OFFSET_POLYS:int = offsetBytes(4, RCPolyMesh);
        rn_internal static const OFFSET_REGS:int = offsetBytes(4, RCPolyMesh);
        rn_internal static const OFFSET_FLAGS:int = offsetBytes(4, RCPolyMesh);
        rn_internal static const OFFSET_AREAS:int = offsetBytes(4, RCPolyMesh);
        rn_internal static const OFFSET_NVERTS:int = offsetBytes(4, RCPolyMesh);
        rn_internal static const OFFSET_NPOLYS:int = offsetBytes(4, RCPolyMesh);
        rn_internal static const OFFSET_MAXPOLYS:int = offsetBytes(4, RCPolyMesh);
        rn_internal static const OFFSET_NVP:int = offsetBytes(4, RCPolyMesh);
        rn_internal static const OFFSET_BMIN:int = offsetBytes(12, RCPolyMesh);
        rn_internal static const OFFSET_BMAX:int = offsetBytes(12, RCPolyMesh);
        rn_internal static const OFFSET_CS:int = offsetBytes(4, RCPolyMesh);
        rn_internal static const OFFSET_CH:int = offsetBytes(4, RCPolyMesh);
        rn_internal static const OFFSET_BORDER_SIZE:int = offsetBytes(4, RCPolyMesh);

        /** The mesh vertices. Getter. [Form: (x, y, z) * #nverts] */
        public function getVert(index:int):int
        {
            return CModule.read16(CModule.read32(ptr + OFFSET_VERTS) + 2 * index);
        }

        /** The mesh vertices. Setter. [Form: (x, y, z) * #nverts] */
        public function setVert(index:int, value:int):void
        {
            CModule.write16(CModule.read32(ptr + OFFSET_VERTS) + 2 * index, value);
        }

        /** Polygon and neighbor data. Getter. [Length: #maxpolys * 2 * #nvp] */
        public function getPoly(index:int):int
        {
            return CModule.read16(CModule.read32(ptr + OFFSET_POLYS) + 2 * index);
        }

        /** Polygon and neighbor data. Setter. [Length: #maxpolys * 2 * #nvp] */
        public function setPoly(index:int, value:int):void
        {
            CModule.write16(CModule.read32(ptr + OFFSET_POLYS) + 2 * index, value);
        }

        /** The region id assigned to each polygon. Getter. [Length: #maxpolys] */
        public function getReg(index:int):int
        {
            return CModule.read16(CModule.read32(ptr + OFFSET_REGS) + 2 * index);
        }

        /** The region id assigned to each polygon. Setter. [Length: #maxpolys] */
        public function setReg(index:int, value:int):void
        {
            CModule.write16(CModule.read32(ptr + OFFSET_REGS) + 2 * index, value);
        }

        /** The user defined flags for each polygon. Getter. [Length: #maxpolys] */
        public function getFlag(index:int):int
        {
            return CModule.read16(CModule.read32(ptr + OFFSET_FLAGS) + 2 * index);
        }

        /** The user defined flags for each polygon. Setter. [Length: #maxpolys] */
        public function setFlag(index:int, value:int):void
        {
            CModule.write16(CModule.read32(ptr + OFFSET_FLAGS) + 2 * index, value);
        }

        /** The area id assigned to each polygon. Getter. [Length: #maxpolys] */
        public function getArea(index:int):int
        {
            return CModule.read8(CModule.read32(ptr + OFFSET_AREAS) + 1 * index);
        }

        /** The area id assigned to each polygon. Setter. [Length: #maxpolys] */
        public function setArea(index:int, value:int):void
        {
            CModule.write8(CModule.read32(ptr + OFFSET_AREAS) + 1 * index, value);
        }

        /** The number of vertices. */
        public function get nverts():int
        {
            return CModule.read32(ptr + OFFSET_NVERTS);
        }

        public function set nverts(value:int):void
        {
            CModule.write32(ptr + OFFSET_NVERTS, value);
        }

        /** The number of polygons. */
        public function get npolys():int
        {
            return CModule.read32(ptr + OFFSET_NPOLYS);
        }

        public function set npolys(value:int):void
        {
            CModule.write32(ptr + OFFSET_NPOLYS, value);
        }

        /** The number of allocated polygons. */
        public function get maxpolys():int
        {
            return CModule.read32(ptr + OFFSET_MAXPOLYS);
        }

        public function set maxpolys(value:int):void
        {
            CModule.write32(ptr + OFFSET_MAXPOLYS, value);
        }

        /** The maximum number of vertices per polygon. */
        public function get nvp():int
        {
            return CModule.read32(ptr + OFFSET_NVP);
        }

        public function set nvp(value:int):void
        {
            CModule.write32(ptr + OFFSET_NVP, value);
        }

        /** The minimum bounds in world space. Component x. [(x, y, z)] */
        public function get bminX():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMIN);
        }

        public function set bminX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMIN, value);
        }

        /** The minimum bounds in world space. Component y. [(x, y, z)] */
        public function get bminY():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMIN + 4);
        }

        public function set bminY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMIN + 4, value);
        }

        /** The minimum bounds in world space. Component z. [(x, y, z)] */
        public function get bminZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMIN + 8);
        }

        public function set bminZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMIN + 8, value);
        }

        /** The maximum bounds in world space. Component x. [(x, y, z)] */
        public function get bmaxX():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMAX);
        }

        public function set bmaxX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMAX, value);
        }

        /** The maximum bounds in world space. Component y. [(x, y, z)] */
        public function get bmaxY():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMAX + 4);
        }

        public function set bmaxY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMAX + 4, value);
        }

        /** The maximum bounds in world space. Component z. [(x, y, z)] */
        public function get bmaxZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMAX + 8);
        }

        public function set bmaxZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMAX + 8, value);
        }

        /** The size of each cell. (On the xz-plane.) */
        public function get cs():Number
        {
            return CModule.readFloat(ptr + OFFSET_CS);
        }

        public function set cs(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_CS, value);
        }

        /** The height of each cell. (The minimum increment along the y-axis.) */
        public function get ch():Number
        {
            return CModule.readFloat(ptr + OFFSET_CH);
        }

        public function set ch(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_CH, value);
        }

        /** The AABB border size used to generate the source data from which the mesh was derived. */
        public function get borderSize():int
        {
            return CModule.read32(ptr + OFFSET_BORDER_SIZE);
        }

        public function set borderSize(value:int):void
        {
            CModule.write32(ptr + OFFSET_BORDER_SIZE, value);
        }

        public override function alloc():Boolean
        {
            ptr = internal_rcAllocPolyMesh();
            return ptr != 0;
        }

        public override function free():void
        {
            internal_rcFreePolyMesh(ptr);
            ptr = 0;
        }
    }
}