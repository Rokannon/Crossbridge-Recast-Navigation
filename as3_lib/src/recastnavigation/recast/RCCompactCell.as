package recastnavigation.recast {
	
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.core.utils.readBits;
	import recastnavigation.core.utils.writeBits;
	import recastnavigation.internal_api.CModule;
	
	use namespace rn_internal;
	
	/**
	 * Provides information on the content of a cell column in a compact heightfield. 
	 */
	public class RCCompactCell extends RNBase {
		
		rn_internal static var SIZE					:int = 0;
		rn_internal static const OFFSET_MIXED		:int = offset(4);
		
		private static function offset(size:int):int {
			
			return (SIZE += size) - size;
			
		}
		
		/** Index to the first span in the column. */
		public function get index():int { return readBits(CModule.read32(ptr + OFFSET_MIXED), 0, 24); }
		public function set index(value:int):void { CModule.write32(ptr + OFFSET_MIXED, writeBits(CModule.read32(ptr + OFFSET_MIXED), 0, 24, value)); }
		
		/** Number of spans in the column. */
		public function get count():int { return readBits(CModule.read32(ptr + OFFSET_MIXED), 24, 8); }
		public function set count(value:int):void { CModule.write32(ptr + OFFSET_MIXED, writeBits(CModule.read32(ptr + OFFSET_MIXED), 24, 8, value)); }
		
	}
	
}