package recastnavigation.recast {
	
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.CModule;
	import recastnavigation.internal_api.internal_rcAllocHeightfield;
	import recastnavigation.internal_api.internal_rcCreateHeightfield;
	import recastnavigation.internal_api.internal_rcFreeHeightField;
	
	use namespace rn_internal;
	
	/**
	 * A dynamic heightfield representing obstructed space.
	 */
	public class RCHeightfield extends RNBase {
		
		rn_internal static var SIZE									:int = 0;
		rn_internal static const OFFSET_WIDTH						:int = offset(4);
		rn_internal static const OFFSET_HEIGHT						:int = offset(4);
		rn_internal static const OFFSET_BMIN						:int = offset(12);
		rn_internal static const OFFSET_BMAX						:int = offset(12);
		rn_internal static const OFFSET_CS							:int = offset(4);
		rn_internal static const OFFSET_CH							:int = offset(4);
		rn_internal static const OFFSET_SPANS						:int = offset(4);
		rn_internal static const OFFSET_POOLS						:int = offset(4);
		rn_internal static const OFFSET_FREELIST					:int = offset(4);
		
		private static function offset(size:int):int {
			
			return (SIZE += size) - size;
			
		}
		
		/** The width of the heightfield. (Along the x-axis in cell units.) */
		public function get width():int { return CModule.read32(ptr + OFFSET_WIDTH); }
		public function set width(value:int):void { CModule.write32(ptr + OFFSET_WIDTH, value); }
		
		/** The height of the heightfield. (Along the z-axis in cell units.) */
		public function get height():int { return CModule.read32(ptr + OFFSET_HEIGHT); }
		public function set height(value:int):void { CModule.write32(ptr + OFFSET_HEIGHT, value); }
		
		/** The minimum bounds in world space. Component x. [(x, y, z)] */
		public function get bmin0():Number { return CModule.readFloat(ptr + OFFSET_BMIN); }
		public function set bmin0(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMIN, value); }
		
		/** The minimum bounds in world space. Component y. [(x, y, z)] */
		public function get bmin1():Number { return CModule.readFloat(ptr + OFFSET_BMIN + 4); }
		public function set bmin1(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMIN + 4, value); }
		
		/** The minimum bounds in world space. Component z. [(x, y, z)] */
		public function get bmin2():Number { return CModule.readFloat(ptr + OFFSET_BMIN + 8); }
		public function set bmin2(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMIN + 8, value); }
		
		/** The maximum bounds in world space. Component x. [(x, y, z)] */
		public function get bmax0():Number { return CModule.readFloat(ptr + OFFSET_BMAX); }
		public function set bmax0(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMAX, value); }
		
		/** The maximum bounds in world space. Component y. [(x, y, z)] */
		public function get bmax1():Number { return CModule.readFloat(ptr + OFFSET_BMAX + 4); }
		public function set bmax1(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMAX + 4, value); }
		
		/** The maximum bounds in world space. Component z. [(x, y, z)] */
		public function get bmax2():Number { return CModule.readFloat(ptr + OFFSET_BMAX + 8); }
		public function set bmax2(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMAX + 8, value); }
		
		/** The size of each cell. (On the xz-plane.) */
		public function get cs():Number { return CModule.readFloat(ptr + OFFSET_CS); }
		public function set cs(value:Number):void { CModule.writeFloat(ptr + OFFSET_CS, value); }
		
		/** The height of each cell. (The minimum increment along the y-axis.) */
		public function get ch():Number { return CModule.readFloat(ptr + OFFSET_CH); }
		public function set ch(value:Number):void { CModule.writeFloat(ptr + OFFSET_CH, value); }
		
		/** Heightfield of spans (width*height). Getter. */
		public function getSpan(index:int, resultSpan:RCSpan = null):RCSpan {
			
			if (resultSpan == null) resultSpan = new RCSpan();
			resultSpan.ptr = CModule.read32(CModule.read32(ptr + OFFSET_SPANS) + 4 * index);
			return resultSpan;
			
		}
		
		/** Heightfield of spans (width*height). Setter. */
		public function setSpan(index:int, value:RCSpan):void {
			
			CModule.write32(CModule.read32(ptr + OFFSET_SPANS) + 4 * index, value.ptr);
			
		}
		
		/** Linked list of span pools. Getter. */
		public function getPools(resultSpanPool:RCSpanPool = null):RCSpanPool {
			
			if (resultSpanPool == null) resultSpanPool = new RCSpanPool();
			resultSpanPool.ptr = CModule.read32(ptr + OFFSET_POOLS);
			return resultSpanPool;
			
		}
		
		/** Linked list of span pools. Setter. */
		public function setPools(value:RCSpanPool):void {
			
			CModule.write32(ptr + OFFSET_POOLS, value.ptr);
			
		}
		
		/** The next free span. Getter. */
		public function getFreelist(resultSpan:RCSpan = null):RCSpan {
			
			if (resultSpan == null) resultSpan = new RCSpan();
			resultSpan.ptr = CModule.read32(ptr + OFFSET_FREELIST);
			return resultSpan;
			
		}
		
		/** The next free span. Setter. */
		public function setFreelist(value:RCSpan):void {
			
			CModule.write32(ptr + OFFSET_FREELIST, value.ptr);
			
		}
		
		public override function alloc():void {
			
			ptr = internal_rcAllocHeightfield();
			
		}
		
		public override function free():void {
			
			internal_rcFreeHeightField(ptr);
			ptr = 0;
			
		}
		
		/**
		 * Initializes a new heightfield.
		 */
		public function rcCreateHeightfield(ctx:RCContext, cfg:RCConfig):Boolean {
			
			return internal_rcCreateHeightfield(
				ctx.ptr, 
				ptr, 
				CModule.read32(cfg.ptr + RCConfig.OFFSET_WIDTH),
				CModule.read32(cfg.ptr + RCConfig.OFFSET_HEIGHT),
				cfg.ptr + RCConfig.OFFSET_BMIN,
				cfg.ptr + RCConfig.OFFSET_BMAX,
				CModule.readFloat(cfg.ptr + RCConfig.OFFSET_CS),
				CModule.readFloat(cfg.ptr + RCConfig.OFFSET_CH)
			);
			
		}
		
	}
	
}