package recastnavigation.recast.meshdetail
{
	import recastnavigation.core.rn_internal;
	import recastnavigation.core.utils.copyBytes;
	import recastnavigation.internal_api.CModule;
	import recastnavigation.internal_api.internal_rcMergePolyMeshDetails;
	import recastnavigation.recast.RCContext;

	use namespace rn_internal;

	/**
	 * Merges multiple detail meshes into a single detail mesh.
	 */
	public function rcMergePolyMeshDetails(ctx:RCContext, dmeshes:Vector.<RCPolyMeshDetail>, dmesh:RCPolyMeshDetail):Boolean
	{
		var nmeshes:int = dmeshes.length;
		var dmeshes_ptr:int = CModule.malloc(RCPolyMeshDetail.SIZE * nmeshes);
		for (var i:int = 0; i < nmeshes; ++i)
		{
			copyBytes(dmeshes[i].ptr, dmeshes_ptr + RCPolyMeshDetail.SIZE * i, RCPolyMeshDetail.SIZE);
		}
		var res:Boolean = internal_rcMergePolyMeshDetails(ctx.ptr, dmeshes_ptr, nmeshes, dmesh.ptr);
		CModule.free(dmeshes_ptr);
		return res;
	}
}