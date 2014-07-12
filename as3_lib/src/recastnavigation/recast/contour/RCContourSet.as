package recastnavigation.recast.contour {
	
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.CModule;
	import recastnavigation.internal_api.rcAllocContourSet;
	import recastnavigation.internal_api.rcFree;
	
	use namespace rn_internal;
	
	/**
	 * Represents a group of related contours.
	 */
	public class RCContourSet extends RNBase {
		
		rn_internal static const OFFSET_CONTS				:int = 4 * 0;
		rn_internal static const OFFSET_NCONTS				:int = 4 * 1;
		rn_internal static const OFFSET_BMIN				:int = 4 * 2;
		rn_internal static const OFFSET_BMAX				:int = 4 * 5;
		rn_internal static const OFFSET_CS					:int = 4 * 8;
		rn_internal static const OFFSET_CH					:int = 4 * 9;
		rn_internal static const OFFSET_WIDTH				:int = 4 * 10;
		rn_internal static const OFFSET_HEIGHT				:int = 4 * 11;
		rn_internal static const OFFSET_BORDER_SIZE			:int = 4 * 12;
		
		/** An array of the contours in the set. Getter. */
		public function getCont(index:int, resultContour:RCContour = null):RCContour {
			
			if (resultContour == null) resultContour = new RCContour();
			resultContour.ptr = CModule.read32(ptr + OFFSET_CONTS) + RCContour.SIZE * index;
			return resultContour;
			
		}
		
		/** An array of the contours in the set. Setter. */
		public function setCont(index:int, value:RCContour):void {
			
			CModule.write32(CModule.read32(ptr + OFFSET_CONTS) + RCContour.SIZE * index, value.ptr);
			
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
		
		public function RCContourSet() {
			
			super();
			
		}
		
		public override function alloc():void {
			
			ptr = recastnavigation.internal_api.rcAllocContourSet();
			
		}
		
		public override function free():void {
			
			recastnavigation.internal_api.rcFree(ptr);
			ptr = 0;
			
		}
		
	}
}