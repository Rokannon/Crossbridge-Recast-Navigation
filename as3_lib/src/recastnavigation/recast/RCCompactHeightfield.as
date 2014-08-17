package recastnavigation.recast
{
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.core.utils.copyBytes;
	import recastnavigation.internal_api.CModule;
	import recastnavigation.internal_api.internal_rcAllocCompactHeightfield;
	import recastnavigation.internal_api.internal_rcBuildCompactHeightfield;
	import recastnavigation.internal_api.internal_rcFreeCompactHeightfield;

	use namespace rn_internal;

	public class RCCompactHeightfield extends RNBase
	{
		rn_internal static var SIZE									:int = 0;
		rn_internal static const OFFSET_WIDTH						:int = offset(4);
		rn_internal static const OFFSET_HEIGHT						:int = offset(4);
		rn_internal static const OFFSET_SPAN_COUNT					:int = offset(4);
		rn_internal static const OFFSET_WALKABLE_HEIGHT				:int = offset(4);
		rn_internal static const OFFSET_WALKABLE_CLIMB				:int = offset(4);
		rn_internal static const OFFSET_BORDER_SIZE					:int = offset(4);
		rn_internal static const OFFSET_MAX_DISTANCE				:int = offset(2);
		rn_internal static const OFFSET_MAX_REGIONS					:int = offset(2);
		rn_internal static const OFFSET_BMIN						:int = offset(12);
		rn_internal static const OFFSET_BMAX						:int = offset(12);
		rn_internal static const OFFSET_CS							:int = offset(4);
		rn_internal static const OFFSET_CH							:int = offset(4);
		rn_internal static const OFFSET_CELLS						:int = offset(4);
		rn_internal static const OFFSET_SPANS						:int = offset(4);
		rn_internal static const OFFSET_DIST						:int = offset(4);
		rn_internal static const OFFSET_AREAS						:int = offset(4);

		private static function offset(size:int):int { return (SIZE += size) - size; }

		/** The width of the heightfield. (Along the x-axis in cell units.) */
		public function get width():int { return CModule.read32(ptr + OFFSET_WIDTH); }
		public function set width(value:int):void { CModule.write32(ptr + OFFSET_WIDTH, value); }

		/** The height of the heightfield. (Along the z-axis in cell units.) */
		public function get height():int { return CModule.read32(ptr + OFFSET_HEIGHT); }
		public function set height(value:int):void { CModule.write32(ptr + OFFSET_HEIGHT, value); }

		/** The number of spans in the heightfield. */
		public function get spanCount():int { return CModule.read32(ptr + OFFSET_SPAN_COUNT); }
		public function set spanCount(value:int):void { CModule.write32(ptr + OFFSET_SPAN_COUNT, value); }

		/** The walkable height used during the build of the field.  (See: rcConfig::walkableHeight) */
		public function get walkableHeight():int { return CModule.read32(ptr + OFFSET_WALKABLE_HEIGHT); }
		public function set walkableHeight(value:int):void { CModule.write32(ptr + OFFSET_WALKABLE_HEIGHT, value); }

		/** The walkable climb used during the build of the field. (See: rcConfig::walkableClimb) */
		public function get walkableClimb():int { return CModule.read32(ptr + OFFSET_WALKABLE_CLIMB); }
		public function set walkableClimb(value:int):void { CModule.write32(ptr + OFFSET_WALKABLE_CLIMB, value); }

		/** The AABB border size used during the build of the field. (See: rcConfig::borderSize) */
		public function get borderSize():int { return CModule.read32(ptr + OFFSET_BORDER_SIZE); }
		public function set borderSize(value:int):void { CModule.write32(ptr + OFFSET_BORDER_SIZE, value); }

		/** The maximum distance value of any span within the field. */
		public function get maxDistance():int { return CModule.read32(ptr + OFFSET_MAX_DISTANCE); }
		public function set maxDistance(value:int):void { CModule.write32(ptr + OFFSET_MAX_DISTANCE, value); }

		/** The maximum region id of any span within the field. */
		public function get maxRegions():int { return CModule.read32(ptr + OFFSET_MAX_REGIONS); }
		public function set maxRegions(value:int):void { CModule.write32(ptr + OFFSET_MAX_REGIONS, value); }

		/** The minimum bounds in world space. Component x. [(x, y, z)] */
		public function get bminX():Number { return CModule.readFloat(ptr + OFFSET_BMIN); }
		public function set bminX(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMIN, value); }

		/** The minimum bounds in world space. Component y. [(x, y, z)] */
		public function get bminY():Number { return CModule.readFloat(ptr + OFFSET_BMIN + 4); }
		public function set bminY(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMIN + 4, value); }

		/** The minimum bounds in world space. Component z. [(x, y, z)] */
		public function get bminZ():Number { return CModule.readFloat(ptr + OFFSET_BMIN + 8); }
		public function set bminZ(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMIN + 8, value); }

		/** The maximum bounds in world space. Component x. [(x, y, z)] */
		public function get bmaxX():Number { return CModule.readFloat(ptr + OFFSET_BMAX); }
		public function set bmaxX(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMAX, value); }

		/** The maximum bounds in world space. Component y. [(x, y, z)] */
		public function get bmaxY():Number { return CModule.readFloat(ptr + OFFSET_BMAX + 4); }
		public function set bmaxY(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMAX + 4, value); }

		/** The maximum bounds in world space. Component z. [(x, y, z)] */
		public function get bmaxZ():Number { return CModule.readFloat(ptr + OFFSET_BMAX + 8); }
		public function set bmaxZ(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMAX + 8, value); }

		/** The size of each cell. (On the xz-plane.) */
		public function get cs():Number { return CModule.readFloat(ptr + OFFSET_CS); }
		public function set cs(value:Number):void { CModule.writeFloat(ptr + OFFSET_CS, value); }

		/** The height of each cell. (The minimum increment along the y-axis.) */
		public function get ch():Number { return CModule.readFloat(ptr + OFFSET_CH); }
		public function set ch(value:Number):void { CModule.writeFloat(ptr + OFFSET_CH, value); }

		/** Array of cells. Getter. [Size: #width*#height] */
		public function getCell(index:int, resultCompactCell:RCCompactCell = null):RCCompactCell
		{
			if (resultCompactCell == null) resultCompactCell = new RCCompactCell();
			resultCompactCell.ptr = CModule.read32(ptr + OFFSET_CELLS) + RCCompactCell.SIZE * index;
			return resultCompactCell;
		}

		/** Array of cells. Setter. [Size: #width*#height] */
		public function setCell(index:int, value:RCCompactCell):void
		{
			copyBytes(value.ptr, CModule.read32(ptr + OFFSET_CELLS) + RCCompactCell.SIZE * index, RCCompactCell.SIZE);
		}

		/** Array of spans. Getter. [Size: #spanCount] */
		public function getSpan(index:int, resultCompactSpan:RCCompactSpan = null):RCCompactSpan
		{
			if (resultCompactSpan == null) resultCompactSpan = new RCCompactSpan();
			resultCompactSpan.ptr = CModule.read32(ptr + OFFSET_SPANS) + RCCompactSpan.SIZE * index;
			return resultCompactSpan;
		}

		/** Array of spans. Setter. [Size: #spanCount] */
		public function setSpan(index:int, value:RCCompactSpan):void
		{
			copyBytes(value.ptr, CModule.read32(ptr + OFFSET_SPANS) + RCCompactSpan.SIZE * index, RCCompactSpan.SIZE);
		}

		/** Array containing border distance data. Getter. [Size: #spanCount] */
		public function getDist(index:int):int { return CModule.read16(CModule.read32(ptr + OFFSET_DIST) + 2 * index); }

		/** Array containing border distance data. Setter. [Size: #spanCount] */
		public function setDist(index:int, value:int):void { CModule.write16(CModule.read32(ptr + OFFSET_DIST) + 2 * index, value); }

		/** Array containing area id data. Getter. [Size: #spanCount] */
		public function getArea(index:int):int { return CModule.read8(CModule.read32(ptr + OFFSET_AREAS) + 1 * index); }

		/** Array containing area id data. Setter. [Size: #spanCount] */
		public function setArea(index:int, value:int):void { CModule.write8(CModule.read32(ptr + OFFSET_AREAS) + 1 * index, value); }

		public override function alloc():Boolean
		{
			ptr = internal_rcAllocCompactHeightfield();
			return ptr != 0;
		}

		public override function free():void
		{
			internal_rcFreeCompactHeightfield(ptr);
			ptr = 0;
		}
	}
}