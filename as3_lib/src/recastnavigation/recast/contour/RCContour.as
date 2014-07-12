package recastnavigation.recast.contour {
	
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.CModule;
	
	use namespace rn_internal;
	
	/**
	 * Represents a simple, non-overlapping contour in field space.
	 */
	public class RCContour extends RNBase {
		
		rn_internal static const OFFSET_VERTS		:int = 4 * 0;
		rn_internal static const OFFSET_NVERTS		:int = 4 * 1;
		rn_internal static const OFFSET_RVERTS		:int = 4 * 2;
		rn_internal static const OFFSET_NRVERTS		:int = 4 * 3;
		rn_internal static const OFFSET_REG			:int = 4 * 4;
		rn_internal static const OFFSET_AREA		:int = 4 * 4 + 2 * 1;
		rn_internal static const SIZE				:int = 4 * 4 + 2 * 1 + 1;
		
		/** Simplified contour vertex and connection data. */
		public function getVert(index:int):int { return CModule.read32(CModule.read32(ptr + OFFSET_VERTS) + 4 * index); }
		public function setVert(index:int, value):void { CModule.write32(CModule.read32(ptr + OFFSET_VERTS) + 4 * index, value); }
		
		/** The number of vertices in the simplified contour. */
		public function get nverts():int { return CModule.read32(ptr + OFFSET_NVERTS); }
		public function set nverts(value:int):void { CModule.write32(ptr + OFFSET_NVERTS, value); }
		
		/** Raw contour vertex and connection data. */
		public function getRVert(index:int):int { return CModule.read32(CModule.read32(ptr + OFFSET_RVERTS) + 4 * index); }
		public function setRVert(index:int, value):void { CModule.write32(CModule.read32(ptr + OFFSET_RVERTS) + 4 * index, value); }
		
		/** The number of vertices in the raw contour.  */
		public function get nrverts():int { return CModule.read32(ptr + OFFSET_NRVERTS); }
		public function set nrverts(value:int):void { CModule.write32(ptr + OFFSET_NRVERTS, value); }
		
		/** The region id of the contour. */
		public function get reg():int { return CModule.read16(ptr + OFFSET_REG); }
		public function set reg(value:int):void { CModule.write16(ptr + OFFSET_REG, value); }
		
		/** The area id of the contour. */
		public function get area():int { return CModule.read8(ptr + OFFSET_AREA); }
		public function set area(value:int):void { CModule.write8(ptr + OFFSET_AREA, value); }
		
		public function RCContour() {
			
			super();
			
		}
		
	}
	
}