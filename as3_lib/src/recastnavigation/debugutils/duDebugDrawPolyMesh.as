package recastnavigation.debugutils {
	
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.internal_duDebugDrawPolyMesh;
	import recastnavigation.recast.mesh.RCPolyMesh;
	
	use namespace rn_internal;
	
	public function duDebugDrawPolyMesh(dd:DUDebugDraw, mesh:RCPolyMesh):void {
		
		internal_duDebugDrawPolyMesh(dd.ptr, mesh.ptr);
		
	}
	
}