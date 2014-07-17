package recastnavigation.recast.contour {
	
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.core.utils.copyBytes;
	import recastnavigation.internal_api.CModule;
	import recastnavigation.internal_api.internal_rcAllocContourSet;
	import recastnavigation.internal_api.internal_rcFreeContourSet;
	
	use namespace rn_internal;
	
	/**
	 * Represents a group of related contours.
	 */
	public class RCContourSet extends RNBase {
		
		rn_internal static var SIZE							:int = 0;
		rn_internal static const OFFSET_CONTS				:int = offset(4);
		rn_internal static const OFFSET_NCONTS				:int = offset(4);
		rn_internal static const OFFSET_BMIN				:int = offset(12);
		rn_internal static const OFFSET_BMAX				:int = offset(12);
		rn_internal static const OFFSET_CS					:int = offset(4);
		rn_internal static const OFFSET_CH					:int = offset(4);
		rn_internal static const OFFSET_WIDTH				:int = offset(4);
		rn_internal static const OFFSET_HEIGHT				:int = offset(4);
		rn_internal static const OFFSET_BORDER_SIZE			:int = offset(4);
		
		private static function offset(size:int):int { return (SIZE += size) - size; }
		
		/** An array of the contours in the set. Getter. */
		public function getCont(index:int, resultContour:RCContour = null):RCContour {
			
			if (resultContour == null) resultContour = new RCContour();
			resultContour.ptr = CModule.read32(ptr + OFFSET_CONTS) + RCContour.SIZE * index;
			return resultContour;
			
		}
		
		/** An array of the contours in the set. Setter. */
		public function setCont(index:int, value:RCContour):void {
			
			copyBytes(value.ptr, CModule.read32(ptr + OFFSET_CONTS) + RCContour.SIZE * index, RCContour.SIZE);
			
		}
		
		/** The number of contours in the set. */
		public function get nconts():int { return CModule.read32(ptr + OFFSET_NCONTS); }
		public function set nconts(value:int):void { CModule.write32(ptr + OFFSET_NCONTS, value); }
		
		/** The minimum bounds in world space. Component x. [(x, y, z)] [Units: wu] */
		public function get bmin0():Number { return CModule.readFloat(ptr + OFFSET_BMIN); }
		public function set bmin0(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMIN, value); }
		
		/** The minimum bounds in world space. Component y. [(x, y, z)] [Units: wu] */
		public function get bmin1():Number { return CModule.readFloat(ptr + OFFSET_BMIN + 4); }
		public function set bmin1(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMIN + 4, value); }
		
		/** The minimum bounds in world space. Component z. [(x, y, z)] [Units: wu] */
		public function get bmin2():Number { return CModule.readFloat(ptr + OFFSET_BMIN + 8); }
		public function set bmin2(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMIN + 8, value); }
		
		/** The maximum bounds in world space. Component x. [(x, y, z)] [Units: wu] */
		public function get bmax0():Number { return CModule.readFloat(ptr + OFFSET_BMAX); }
		public function set bmax0(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMAX, value); }
		
		/** The maximum bounds in world space. Component y. [(x, y, z)] [Units: wu] */
		public function get bmax1():Number { return CModule.readFloat(ptr + OFFSET_BMAX + 4); }
		public function set bmax1(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMAX + 4, value); }
		
		/** The maximum bounds in world space. Component z. [(x, y, z)] [Units: wu] */
		public function get bmax2():Number { return CModule.readFloat(ptr + OFFSET_BMAX + 8); }
		public function set bmax2(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMAX + 8, value); }
		
		/** The size of each cell. (On the xz-plane.) */
		public function get cs():Number { return CModule.readFloat(ptr + OFFSET_CS); }
		public function set cs(value:Number):void { CModule.writeFloat(ptr + OFFSET_CS, value); }
		
		/** The height of each cell. (The minimum increment along the y-axis.) */
		public function get ch():Number { return CModule.readFloat(ptr + OFFSET_CH); }
		public function set ch(value:Number):void { CModule.writeFloat(ptr + OFFSET_CH, value); }
		
		/** The width of the set. (Along the x-axis in cell units.) */
		public function get width():int { return CModule.read32(ptr + OFFSET_WIDTH); }
		public function set width(value:int):void { CModule.write32(ptr + OFFSET_WIDTH, value); }
		
		/** The height of the set. (Along the z-axis in cell units.) */
		public function get height():int { return CModule.read32(ptr + OFFSET_HEIGHT); }
		public function set height(value:int):void { CModule.write32(ptr + OFFSET_HEIGHT, value); }
		
		/** The AABB border size used to generate the source data from which the contours were derived. */
		public function get borderSize():int { return CModule.read32(ptr + OFFSET_BORDER_SIZE); }
		public function set borderSize(value:int):void { CModule.write32(ptr + OFFSET_BORDER_SIZE, value); }
		
		public override function alloc():void {
			
			ptr = internal_rcAllocContourSet();
			
		}
		
		public override function free():void {
			
			internal_rcFreeContourSet(ptr);
			ptr = 0;
			
		}
		
	}
	
}