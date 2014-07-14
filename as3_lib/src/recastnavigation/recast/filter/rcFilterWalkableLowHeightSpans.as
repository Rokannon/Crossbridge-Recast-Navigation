package recastnavigation.recast.filter {
	
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.internal_rcFilterWalkableLowHeightSpans;
	import recastnavigation.recast.RCContext;
	import recastnavigation.recast.RCHeightfield;
	
	use namespace rn_internal;
	
	/**
	 * Marks walkable spans as not walkable if the clearence 
	 * above the span is less than the specified height. 
	 */
	public function rcFilterWalkableLowHeightSpans(ctx:RCContext, walkableHeight:int, solid:RCHeightfield):void {
		
		internal_rcFilterWalkableLowHeightSpans(ctx.ptr, walkableHeight, solid.ptr);
		
	}
	
}