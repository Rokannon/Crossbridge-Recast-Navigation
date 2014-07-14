package recastnavigation.recast {
	
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.CModule;
	import recastnavigation.internal_api.internal_rcAllocCompactHeightfield;
	import recastnavigation.internal_api.internal_rcBuildCompactHeightfield;
	import recastnavigation.internal_api.internal_rcFreeCompactHeightfield;
	
	use namespace rn_internal;
	
	public class RCCompactHeightfield extends RNBase {
		
		public function RCCompactHeightfield() {
			
			super();
			
		}
		
		public override function alloc():void {
			
			ptr = internal_rcAllocCompactHeightfield();
			
		}
		
		public override function free():void {
			
			internal_rcFreeCompactHeightfield(ptr);
			ptr = 0;
			
		}
		
		/**
		 * Builds a compact heightfield representing open space, 
		 * from a heightfield representing solid space.
		 */
		public function rcBuildCompactHeightfield(ctx:RCContext, cfg:RCConfig, hf:RCHeightfield):Boolean {
			
			return internal_rcBuildCompactHeightfield(
				ctx.ptr, 
				CModule.read32(cfg.ptr + RCConfig.OFFSET_WALKABLE_HEIGHT), 
				CModule.read32(cfg.ptr + RCConfig.OFFSET_WALKABLE_CLIMB),
				hf.ptr,
				ptr
			);
			
		}
		
	}
	
}