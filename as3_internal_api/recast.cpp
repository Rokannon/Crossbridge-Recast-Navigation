#include <stdlib.h>
#include <AS3\AS3.h>
#include <AS3\AS3++.h>
#include <Recast.h>
#include <RecastAlloc.h>
#include <RecastAssert.h>

void _rcFree() __attribute__((used,
	annotate("as3sig:public function internal_rcFree(ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcFree()
{
	void * ptr;
	AS3_GetScalarFromVar(ptr, ptr);

	rcFree(ptr);
}

void _rcAlloc_rcConfig() __attribute__((used,
	annotate("as3sig:public function internal_rcAlloc_rcConfig():int"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcAlloc_rcConfig()
{
	AS3_Return((rcConfig *) rcAlloc(sizeof(rcConfig), RC_ALLOC_PERM));
}

void _rcCalcGridSize() __attribute__((used,
	annotate("as3sig:public function internal_rcCalcGridSize(bmin_ptr:int, bmax_ptr:int, cs:Number, w_ptr:int, h_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcCalcGridSize()
{
	float * bmin;
	AS3_GetScalarFromVar(bmin, bmin_ptr);

	float * bmax;
	AS3_GetScalarFromVar(bmax, bmax_ptr);

	float cs;
	AS3_GetScalarFromVar(cs, cs);

	int * w;
	AS3_GetScalarFromVar(w, w_ptr);

	int * h;
	AS3_GetScalarFromVar(h, h_ptr);

	rcCalcGridSize(bmin, bmax, cs, w, h);
}

void _rcCalcBounds() __attribute__((used,
	annotate("as3sig:public function internal_rcCalcBounds(verts_ptr:int, nv:int, bmin_ptr:int, bmax_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcCalcBounds()
{
	float * verts;
	AS3_GetScalarFromVar(verts, verts_ptr);

	float nv;
	AS3_GetScalarFromVar(nv, nv);

	float * bmin;
	AS3_GetScalarFromVar(bmin, bmin_ptr);

	float * bmax;
	AS3_GetScalarFromVar(bmax, bmax_ptr);

	rcCalcBounds(verts, nv, bmin, bmax);
}

void _rcAllocHeightfield() __attribute__((used,
	annotate("as3sig:public function internal_rcAllocHeightfield():int"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcAllocHeightfield()
{
	AS3_Return(rcAllocHeightfield());
}

void _rcFreeHeightField() __attribute__((used,
	annotate("as3sig:public function internal_rcFreeHeightField(ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcFreeHeightField()
{
	rcHeightfield * ptr;
	AS3_GetScalarFromVar(ptr, ptr);

	rcFreeHeightField(ptr);
}

void _rcCreateHeightfield() __attribute__((used,
	annotate("as3sig:public function internal_rcCreateHeightfield(ctx_ptr:int, hf_ptr:int, width:int, height:int, bmin_ptr:int, bmax_ptr:int, cs:Number, ch:Number):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcCreateHeightfield()
{
	rcContext* ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcHeightfield * hf;
	AS3_GetScalarFromVar(hf, hf_ptr);

	int width;
	AS3_GetScalarFromVar(width, width);

	int height;
	AS3_GetScalarFromVar(height, height);

	float * bmin;
	AS3_GetScalarFromVar(bmin, bmin_ptr);

	float * bmax;
	AS3_GetScalarFromVar(bmax, bmax_ptr);

	float cs;
	AS3_GetScalarFromVar(cs, cs);

	float ch;
	AS3_GetScalarFromVar(ch, ch);

	AS3_Return(rcCreateHeightfield(ctx, *hf, width, height, bmin, bmax, cs, ch));
}

void _rcMarkWalkableTriangles() __attribute__((used,
	annotate("as3sig:public function internal_rcMarkWalkableTriangles(ctx_ptr:int, walkableSlopeAngle:Number, verts_ptr:int, tris_ptr:int, nt:int, areas_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcMarkWalkableTriangles()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	float _walkableSlopeAngle;
	AS3_GetScalarFromVar(_walkableSlopeAngle, walkableSlopeAngle);

	float * verts;
	AS3_GetScalarFromVar(verts, verts_ptr);

	int * tris;
	AS3_GetScalarFromVar(tris, tris_ptr);

	int nt;
	AS3_GetScalarFromVar(nt, nt);

	unsigned char* areas;
	AS3_GetScalarFromVar(areas, areas_ptr);

	rcMarkWalkableTriangles(ctx, _walkableSlopeAngle, verts, 0, tris, nt, areas);
}

void _rcRasterizeTriangles() __attribute__((used,
	annotate("as3sig:public function internal_rcRasterizeTriangles(ctx_ptr:int, verts_ptr:int, tris_ptr:int, areas_ptr:int, nt:int, solid_ptr:int, flagMergeThr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcRasterizeTriangles()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	float * verts;
	AS3_GetScalarFromVar(verts, verts_ptr);

	int * tris;
	AS3_GetScalarFromVar(tris, tris_ptr);

	unsigned char* areas;
	AS3_GetScalarFromVar(areas, areas_ptr);

	int nt;
	AS3_GetScalarFromVar(nt, nt);

	rcHeightfield * solid;
	AS3_GetScalarFromVar(solid, solid_ptr);

	int flagMergeThr;
	AS3_GetScalarFromVar(flagMergeThr, flagMergeThr);

	rcRasterizeTriangles(ctx, verts, 0, tris, areas, nt, *solid, flagMergeThr);
}

void _rcFilterLowHangingWalkableObstacles() __attribute__((used,
	annotate("as3sig:public function internal_rcFilterLowHangingWalkableObstacles(ctx_ptr:int, walkableClimb:int, solid_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcFilterLowHangingWalkableObstacles()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	int walkableClimb;
	AS3_GetScalarFromVar(walkableClimb, walkableClimb);

	rcHeightfield * solid;
	AS3_GetScalarFromVar(solid, solid_ptr);

	rcFilterLowHangingWalkableObstacles(ctx, walkableClimb, *solid);
}

void _rcFilterLedgeSpans() __attribute__((used,
	annotate("as3sig:public function internal_rcFilterLedgeSpans(ctx_ptr:int, walkableHeight:int, walkableClimb:int, solid_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcFilterLedgeSpans()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	int walkableHeight;
	AS3_GetScalarFromVar(walkableHeight, walkableHeight);

	int walkableClimb;
	AS3_GetScalarFromVar(walkableClimb, walkableClimb);

	rcHeightfield * solid;
	AS3_GetScalarFromVar(solid, solid_ptr);

	rcFilterLedgeSpans(ctx, walkableHeight, walkableClimb, *solid);
}

void _rcFilterWalkableLowHeightSpans() __attribute__((used,
	annotate("as3sig:public function internal_rcFilterWalkableLowHeightSpans(ctx_ptr:int, walkableHeight:int, solid_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcFilterWalkableLowHeightSpans()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	int walkableHeight;
	AS3_GetScalarFromVar(walkableHeight, walkableHeight);

	rcHeightfield * solid;
	AS3_GetScalarFromVar(solid, solid_ptr);

	rcFilterWalkableLowHeightSpans(ctx, walkableHeight, *solid);
}

void _rcAllocCompactHeightfield() __attribute__((used,
	annotate("as3sig:public function internal_rcAllocCompactHeightfield():int"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcAllocCompactHeightfield()
{
	AS3_Return(rcAllocCompactHeightfield());
}

void _rcFreeCompactHeightfield() __attribute__((used,
	annotate("as3sig:public function internal_rcFreeCompactHeightfield(chf_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcFreeCompactHeightfield()
{
	rcCompactHeightfield * chf;
	AS3_GetScalarFromVar(chf, chf_ptr);

	rcFreeCompactHeightfield(chf);
}

void _rcBuildCompactHeightfield() __attribute__((used,
	annotate("as3sig:public function internal_rcBuildCompactHeightfield(ctx_ptr:int, walkableHeight:int, walkableClimb:int, hf_ptr:int, chf_ptr:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcBuildCompactHeightfield()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	int walkableHeight;
	AS3_GetScalarFromVar(walkableHeight, walkableHeight);

	int walkableClimb;
	AS3_GetScalarFromVar(walkableClimb, walkableClimb);

	rcHeightfield * hf;
	AS3_GetScalarFromVar(hf, hf_ptr);

	rcCompactHeightfield * chf;
	AS3_GetScalarFromVar(chf, chf_ptr);

	AS3_Return(rcBuildCompactHeightfield(ctx, walkableHeight, walkableClimb, *hf, *chf));
}

void _rcErodeWalkableArea() __attribute__((used,
	annotate("as3sig:public function internal_rcErodeWalkableArea(ctx_ptr:int, radius:int, chf_ptr:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcErodeWalkableArea()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	int radius;
	AS3_GetScalarFromVar(radius, radius);

	rcCompactHeightfield * chf;
	AS3_GetScalarFromVar(chf, chf_ptr);

	AS3_Return(rcErodeWalkableArea(ctx, radius, *chf));
}

void _rcBuildDistanceField() __attribute__((used,
	annotate("as3sig:public function internal_rcBuildDistanceField(ctx_ptr:int, chf_ptr:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcBuildDistanceField()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcCompactHeightfield * chf;
	AS3_GetScalarFromVar(chf, chf_ptr);

	AS3_Return(rcBuildDistanceField(ctx, *chf));
}

void _rcBuildRegions() __attribute__((used,
	annotate("as3sig:public function internal_rcBuildRegions(ctx_ptr:int, chf_ptr:int, borderSize:int, minRegionArea:int, mergeRegionArea:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcBuildRegions()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcCompactHeightfield * chf;
	AS3_GetScalarFromVar(chf, chf_ptr);

	int borderSize;
	AS3_GetScalarFromVar(borderSize, borderSize);

	int minRegionArea;
	AS3_GetScalarFromVar(minRegionArea, minRegionArea);

	int mergeRegionArea;
	AS3_GetScalarFromVar(mergeRegionArea, mergeRegionArea);

	AS3_Return(rcBuildRegions(ctx, *chf, borderSize, minRegionArea, mergeRegionArea));
}

void _rcBuildRegionsMonotone() __attribute__((used,
	annotate("as3sig:public function internal_rcBuildRegionsMonotone(ctx_ptr:int, chf_ptr:int, borderSize:int, minRegionArea:int, mergeRegionArea:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcBuildRegionsMonotone()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcCompactHeightfield * chf;
	AS3_GetScalarFromVar(chf, chf_ptr);

	int borderSize;
	AS3_GetScalarFromVar(borderSize, borderSize);

	int minRegionArea;
	AS3_GetScalarFromVar(minRegionArea, minRegionArea);

	int mergeRegionArea;
	AS3_GetScalarFromVar(mergeRegionArea, mergeRegionArea);

	AS3_Return(rcBuildRegionsMonotone(ctx, *chf, borderSize, minRegionArea, mergeRegionArea));
}

void _rcBuildLayerRegions() __attribute__((used,
	annotate("as3sig:public function internal_rcBuildLayerRegions(ctx_ptr:int, chf_ptr:int, borderSize:int, minRegionArea:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcBuildLayerRegions()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcCompactHeightfield * chf;
	AS3_GetScalarFromVar(chf, chf_ptr);

	int borderSize;
	AS3_GetScalarFromVar(borderSize, borderSize);

	int minRegionArea;
	AS3_GetScalarFromVar(minRegionArea, minRegionArea);

	AS3_Return(rcBuildLayerRegions(ctx, *chf, borderSize, minRegionArea));
}

void _rcAllocContourSet() __attribute__((used,
	annotate("as3sig:public function internal_rcAllocContourSet():int"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcAllocContourSet()
{
	AS3_Return(rcAllocContourSet());
}

void _rcFreeContourSet() __attribute__((used,
	annotate("as3sig:public function internal_rcFreeContourSet(ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcFreeContourSet()
{
	rcContourSet * ptr;
	AS3_GetScalarFromVar(ptr, ptr);

	rcFreeContourSet(ptr);
}

void _rcBuildContours() __attribute__((used,
	annotate("as3sig:public function internal_rcBuildContours(ctx_ptr:int, chf_ptr:int, maxError:Number, maxEdgeLen:int, cset_ptr:int, buildFlags:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcBuildContours()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcCompactHeightfield * chf;
	AS3_GetScalarFromVar(chf, chf_ptr);

	float maxError;
	AS3_GetScalarFromVar(maxError, maxError);

	int maxEdgeLen;
	AS3_GetScalarFromVar(maxEdgeLen, maxEdgeLen);

	rcContourSet * cset;
	AS3_GetScalarFromVar(cset, cset_ptr);

	int buildFlags;
	AS3_GetScalarFromVar(buildFlags, buildFlags);

	rcBuildContours(ctx, *chf, maxError, maxEdgeLen, *cset, buildFlags);
}

void _rcAllocPolyMesh() __attribute__((used,
	annotate("as3sig:public function internal_rcAllocPolyMesh():int"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcAllocPolyMesh()
{
	AS3_Return(rcAllocPolyMesh());
}

void _rcFreePolyMesh() __attribute__((used,
	annotate("as3sig:public function internal_rcFreePolyMesh(ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcFreePolyMesh()
{
	rcPolyMesh * ptr;
	AS3_GetScalarFromVar(ptr, ptr);

	rcFreePolyMesh(ptr);
}

void _rcBuildPolyMesh() __attribute__((used,
	annotate("as3sig:public function internal_rcBuildPolyMesh(ctx_ptr:int, cset_ptr:int, nvp:int, mesh_ptr:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcBuildPolyMesh()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcContourSet * cset;
	AS3_GetScalarFromVar(cset, cset_ptr);

	int nvp;
	AS3_GetScalarFromVar(nvp, nvp);

	rcPolyMesh * mesh;
	AS3_GetScalarFromVar(mesh, mesh_ptr);

	AS3_Return(rcBuildPolyMesh(ctx, *cset, nvp, *mesh));
}

void _rcMergePolyMeshes() __attribute__((used,
	annotate("as3sig:public function internal_rcMergePolyMeshes(ctx_ptr:int, meshes_ptr:int, nmeshes:int, mesh_ptr:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcMergePolyMeshes()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcPolyMesh * * meshes;
	AS3_GetScalarFromVar(meshes, meshes_ptr);

	int nmeshes;
	AS3_GetScalarFromVar(nmeshes, nmeshes);

	rcPolyMesh * mesh;
	AS3_GetScalarFromVar(mesh, mesh_ptr);

	AS3_Return(rcMergePolyMeshes(ctx, meshes, nmeshes, *mesh));
}

void _rcCopyPolyMesh() __attribute__((used,
	annotate("as3sig:public function internal_rcCopyPolyMesh(ctx_ptr:int, src_ptr:int, dst_ptr:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcCopyPolyMesh()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcPolyMesh * src;
	AS3_GetScalarFromVar(src, src_ptr);

	rcPolyMesh * dst;
	AS3_GetScalarFromVar(dst, dst_ptr);

	AS3_Return(rcCopyPolyMesh(ctx, *src, *dst));
}

void _rcAllocPolyMeshDetail() __attribute__((used,
	annotate("as3sig:public function internal_rcAllocPolyMeshDetail():int"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcAllocPolyMeshDetail()
{
	AS3_Return(rcAllocPolyMeshDetail());
}

void _rcFreePolyMeshDetail() __attribute__((used,
	annotate("as3sig:public function internal_rcFreePolyMeshDetail(ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcFreePolyMeshDetail()
{
	rcPolyMeshDetail * ptr;
	AS3_GetScalarFromVar(ptr, ptr);

	rcFreePolyMeshDetail(ptr);
}

void _rcBuildPolyMeshDetail() __attribute__((used,
	annotate("as3sig:public function internal_rcBuildPolyMeshDetail(ctx_ptr:int, mesh_ptr:int, chf_ptr:int, sampleDist:Number, sampleMaxError:Number, dmesh_ptr:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcBuildPolyMeshDetail()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcPolyMesh * mesh;
	AS3_GetScalarFromVar(mesh, mesh_ptr);

	rcCompactHeightfield * chf;
	AS3_GetScalarFromVar(chf, chf_ptr);

	int sampleDist;
	AS3_GetScalarFromVar(sampleDist, sampleDist);

	int sampleMaxError;
	AS3_GetScalarFromVar(sampleMaxError, sampleMaxError);

	rcPolyMeshDetail * dmesh;
	AS3_GetScalarFromVar(dmesh, dmesh_ptr);

	AS3_Return(rcBuildPolyMeshDetail(ctx, *mesh, *chf, sampleDist, sampleMaxError, *dmesh));
}

void _rcMergePolyMeshDetails() __attribute__((used,
	annotate("as3sig:public function internal_rcMergePolyMeshDetails(ctx_ptr:int, dmeshes_ptr:int, nmeshes:int, dmesh_ptr:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcMergePolyMeshDetails()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcPolyMeshDetail * * dmeshes;
	AS3_GetScalarFromVar(dmeshes, dmeshes_ptr);

	int nmeshes;
	AS3_GetScalarFromVar(nmeshes, nmeshes);

	rcPolyMeshDetail * dmesh;
	AS3_GetScalarFromVar(dmesh, dmesh_ptr);

	AS3_Return(rcMergePolyMeshDetails(ctx, dmeshes, nmeshes, *dmesh));
}