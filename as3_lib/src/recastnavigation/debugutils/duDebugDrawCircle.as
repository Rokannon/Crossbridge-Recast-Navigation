package recastnavigation.debugutils {
	
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.internal_duDebugDrawCircle;
	
	use namespace rn_internal;
	
	public function duDebugDrawCircle(dd:DUDebugDraw, x:Number, y:Number, z:Number, r:Number, col:int, lineWidth:Number):void {
		
		internal_duDebugDrawCircle(dd.ptr, x, y, z, r, col, lineWidth);
		
	}
	
}