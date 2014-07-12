#include <stdlib.h>
#include <AS3\AS3.h>
#include <AS3\AS3++.h>
#include <Recast.h>
#include <RecastAlloc.h>
#include <RecastAssert.h>

// Used to avoid '"__asm__" is undefined' error in Visual Studio.
#ifdef _MSC_VER
#define __asm__
#define __attribute__(x)
#endif

void _rcFree() __attribute__((used,
	annotate("as3sig:public function rcFree(ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcFree()
{
	void * _ptr;
	AS3_GetScalarFromVar(_ptr, ptr);
	rcFree(_ptr);
}

void _rcAlloc_rcConfig() __attribute__((used,
	annotate("as3sig:public function rcAlloc_rcConfig():int"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcAlloc_rcConfig()
{
	AS3_Return((rcConfig *) rcAlloc(sizeof(rcConfig), RC_ALLOC_PERM));
}

void _rcCalcGridSize() __attribute__((used,
	annotate("as3sig:public function rcCalcGridSize(bmin_ptr:int, bmax_ptr:int, cs:Number, w_ptr:int, h_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcCalcGridSize()
{
	float * bmin;
	AS3_GetScalarFromVar(bmin, bmin_ptr);

	float * bmax;
	AS3_GetScalarFromVar(bmax, bmax_ptr);

	float _cs;
	AS3_GetScalarFromVar(_cs, cs);

	int * w;
	AS3_GetScalarFromVar(w, w_ptr);

	int * h;
	AS3_GetScalarFromVar(h, h_ptr);

	rcCalcGridSize(bmin, bmax, _cs, w, h);
}

void _rcCalcBounds() __attribute__((used,
	annotate("as3sig:public function rcCalcBounds(verts_ptr:int, nv:int, bmin_ptr:int, bmax_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcCalcBounds()
{
	float * verts;
	AS3_GetScalarFromVar(verts, verts_ptr);

	float _nv;
	AS3_GetScalarFromVar(_nv, nv);

	float * bmin;
	AS3_GetScalarFromVar(bmin, bmin_ptr);

	float * bmax;
	AS3_GetScalarFromVar(bmax, bmax_ptr);

	rcCalcBounds(verts, _nv, bmin, bmax);
}

void _rcAllocHeightfield() __attribute__((used,
	annotate("as3sig:public function rcAllocHeightfield():int"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcAllocHeightfield()
{
	AS3_Return(rcAllocHeightfield());
}

void _rcFreeHeightField() __attribute__((used,
	annotate("as3sig:public function rcFreeHeightField(ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcFreeHeightField()
{
	rcHeightfield * _ptr;
	AS3_GetScalarFromVar(_ptr, ptr);
	rcFreeHeightField(_ptr);
}

void _rcCreateHeightfield() __attribute__((used,
	annotate("as3sig:public function rcCreateHeightfield(ctx_ptr:int, hf_ptr:int, width:int, height:int, bmin_ptr:int, bmax_ptr:int, cs:Number, ch:Number):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcCreateHeightfield()
{
	rcContext* ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcHeightfield * hf;
	AS3_GetScalarFromVar(hf, hf_ptr);

	int _width;
	AS3_GetScalarFromVar(_width, width);

	int _height;
	AS3_GetScalarFromVar(_height, height);

	float * bmin;
	AS3_GetScalarFromVar(bmin, bmin_ptr);

	float * bmax;
	AS3_GetScalarFromVar(bmax, bmax_ptr);

	float _cs;
	AS3_GetScalarFromVar(_cs, cs);

	float _ch;
	AS3_GetScalarFromVar(_ch, ch);

	AS3_Return(rcCreateHeightfield(ctx, *hf, _width, _height, bmin, bmax, _cs, _ch));
}

void _rcMarkWalkableTriangles() __attribute__((used,
	annotate("as3sig:public function rcMarkWalkableTriangles(ctx_ptr:int, walkableSlopeAngle:Number, verts_ptr:int, tris_ptr:int, nt:int, areas_ptr:int):void"),
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

	int _nt;
	AS3_GetScalarFromVar(_nt, nt);

	unsigned char* areas;
	AS3_GetScalarFromVar(areas, areas_ptr);

	rcMarkWalkableTriangles(ctx, _walkableSlopeAngle, verts, 0, tris, _nt, areas);
}

void _rcRasterizeTriangles() __attribute__((used,
	annotate("as3sig:public function rcRasterizeTriangles(ctx_ptr:int, verts_ptr:int, tris_ptr:int, areas_ptr:int, nt:int, solid_ptr:int, flagMergeThr:int):void"),
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

	int _nt;
	AS3_GetScalarFromVar(_nt, nt);

	rcHeightfield * solid;
	AS3_GetScalarFromVar(solid, solid_ptr);

	int _flagMergeThr;
	AS3_GetScalarFromVar(_flagMergeThr, flagMergeThr);

	rcRasterizeTriangles(ctx, verts, 0, tris, areas, _nt, *solid, _flagMergeThr);
}

void _rcFilterLowHangingWalkableObstacles() __attribute__((used,
	annotate("as3sig:public function rcFilterLowHangingWalkableObstacles(ctx_ptr:int, walkableClimb:int, solid_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcFilterLowHangingWalkableObstacles()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	int _walkableClimb;
	AS3_GetScalarFromVar(_walkableClimb, walkableClimb);

	rcHeightfield * solid;
	AS3_GetScalarFromVar(solid, solid_ptr);

	rcFilterLowHangingWalkableObstacles(ctx, _walkableClimb, *solid);
}

void _rcFilterLedgeSpans() __attribute__((used,
	annotate("as3sig:public function rcFilterLedgeSpans(ctx_ptr:int, walkableHeight:int, walkableClimb:int, solid_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcFilterLedgeSpans()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	int _walkableHeight;
	AS3_GetScalarFromVar(_walkableHeight, walkableHeight);

	int _walkableClimb;
	AS3_GetScalarFromVar(_walkableClimb, walkableClimb);

	rcHeightfield * solid;
	AS3_GetScalarFromVar(solid, solid_ptr);

	rcFilterLedgeSpans(ctx, _walkableHeight, _walkableClimb, *solid);
}

void _rcFilterWalkableLowHeightSpans() __attribute__((used,
	annotate("as3sig:public function rcFilterWalkableLowHeightSpans(ctx_ptr:int, walkableHeight:int, solid_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcFilterWalkableLowHeightSpans()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	int _walkableHeight;
	AS3_GetScalarFromVar(_walkableHeight, walkableHeight);

	rcHeightfield * solid;
	AS3_GetScalarFromVar(solid, solid_ptr);

	rcFilterWalkableLowHeightSpans(ctx, _walkableHeight, *solid);
}

void _rcAllocCompactHeightfield() __attribute__((used,
	annotate("as3sig:public function rcAllocCompactHeightfield():int"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcAllocCompactHeightfield()
{
	AS3_Return(rcAllocCompactHeightfield());
}

void _rcFreeCompactHeightfield() __attribute__((used,
	annotate("as3sig:public function rcFreeCompactHeightfield(chf_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcFreeCompactHeightfield()
{
	rcCompactHeightfield * chf;
	AS3_GetScalarFromVar(chf, chf_ptr);

	rcFreeCompactHeightfield(chf);
}

void _rcBuildCompactHeightfield() __attribute__((used,
	annotate("as3sig:public function rcBuildCompactHeightfield(ctx_ptr:int, walkableHeight:int, walkableClimb:int, hf_ptr:int, chf_ptr:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcBuildCompactHeightfield()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	int _walkableHeight;
	AS3_GetScalarFromVar(_walkableHeight, walkableHeight);

	int _walkableClimb;
	AS3_GetScalarFromVar(_walkableClimb, walkableClimb);

	rcHeightfield * hf;
	AS3_GetScalarFromVar(hf, hf_ptr);

	rcCompactHeightfield * chf;
	AS3_GetScalarFromVar(chf, chf_ptr);

	AS3_Return(rcBuildCompactHeightfield(ctx, _walkableHeight, _walkableClimb, *hf, *chf));
}

void _rcErodeWalkableArea() __attribute__((used,
	annotate("as3sig:public function rcErodeWalkableArea(ctx_ptr:int, radius:int, chf_ptr:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcErodeWalkableArea()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	int _radius;
	AS3_GetScalarFromVar(_radius, radius);

	rcCompactHeightfield * chf;
	AS3_GetScalarFromVar(chf, chf_ptr);

	AS3_Return(rcErodeWalkableArea(ctx, _radius, *chf));
}