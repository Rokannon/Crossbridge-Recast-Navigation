package recastnavigation.recast {
	
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.CModule;
	
	use namespace rn_internal;
	
	/**
	 * A memory pool used for quick allocation of spans within a heightfield.
	 */
	public class RCSpanPool extends RNBase {
		
		public static const RC_SPANS_PER_POOL:int = 2048;
		
		rn_internal static var SIZE					:int = 0;
		rn_internal static const OFFSET_NEXT		:int = offset(4);
		rn_internal static const OFFSET_ITEMS		:int = offset(RCSpan.SIZE * RC_SPANS_PER_POOL);
		
		private static function offset(size:int):int {
			
			return (SIZE += size) - size;
			
		}
		
		/** The next span pool. Getter. */
		public function getNext(resultSpanPool:RCSpanPool = null):RCSpanPool {
			
			if (resultSpanPool == null) resultSpanPool = new RCSpanPool();
			resultSpanPool.ptr = CModule.read32(ptr + OFFSET_NEXT);
			return resultSpanPool;
			
		}
		
		/** The next span pool. Setter. */
		public function setNext(value:RCSpanPool):void {
			
			CModule.write32(ptr + OFFSET_NEXT, value.ptr);
			
		}
		
		/** Array of spans in the pool. Getter. */
		public function getItem(index:int, resultSpan:RCSpan = null):RCSpan {
			
			if (resultSpan == null) resultSpan = new RCSpan();
			resultSpan.ptr = CModule.read32(ptr + OFFSET_ITEMS + RCSpan.SIZE * index);
			return resultSpan;
			
		}
		
		/** Array of spans in the pool. Setter. */
		public function setItem(index:int, value:RCSpanPool):void {
			
			CModule.write32(ptr + OFFSET_ITEMS + RCSpan.SIZE * index, value.ptr);
			
		}
		
	}
	
}