#include <stdlib.h>
#include <AS3\AS3.h>
#include <AS3\AS3++.h>
#include <DetourAlloc.h>
#include <DetourAssert.h>
#include <DetourCommon.h>
#include <DetourMath.h>
#include <DetourNavMesh.h>
#include <DetourNavMeshBuilder.h>
#include <DetourNavMeshQuery.h>
#include <DetourNode.h>
#include <DetourStatus.h>

void _dtFree() __attribute__((used,
	annotate("as3sig:public function internal_dtFree(ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtFree()
{
	void * ptr;
	AS3_GetScalarFromVar(ptr, ptr);

	dtFree(ptr);
}

// ////
// DetourNavMeshBuilder
// ////

void _dtAlloc_dtNavMeshCreateParams() __attribute__((used,
	annotate("as3sig:public function internal_dtAlloc_dtNavMeshCreateParams():int"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtAlloc_dtNavMeshCreateParams()
{
	AS3_Return((dtNavMeshCreateParams *)dtAlloc(sizeof(dtNavMeshCreateParams), DT_ALLOC_PERM));
}

void _dtCreateNavMeshData() __attribute__((used,
	annotate("as3sig:public function internal_dtCreateNavMeshData(params_ptr:int, outData_ptr_ptr:int, outDataSize_ptr:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtCreateNavMeshData()
{
	dtNavMeshCreateParams * params;
	AS3_GetScalarFromVar(params, params_ptr);

	unsigned char * * outData;
	AS3_GetScalarFromVar(outData, outData_ptr_ptr);

	int * outDataSize;
	AS3_GetScalarFromVar(outDataSize, outDataSize_ptr);

	AS3_Return(dtCreateNavMeshData(params, outData, outDataSize));
}

void _dtNavMeshHeaderSwapEndian() __attribute__((used,
	annotate("as3sig:public function internal_dtNavMeshHeaderSwapEndian(data_ptr:int, dataSize:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtNavMeshHeaderSwapEndian()
{
	unsigned char * data;
	AS3_GetScalarFromVar(data, data_ptr);

	int dataSize;
	AS3_GetScalarFromVar(dataSize, dataSize);

	AS3_Return(dtNavMeshHeaderSwapEndian(data, dataSize));
}

void _dtNavMeshDataSwapEndian() __attribute__((used,
	annotate("as3sig:public function internal_dtNavMeshDataSwapEndian(data_ptr:int, dataSize:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtNavMeshDataSwapEndian()
{
	unsigned char * data;
	AS3_GetScalarFromVar(data, data_ptr);

	int dataSize;
	AS3_GetScalarFromVar(dataSize, dataSize);

	AS3_Return(dtNavMeshDataSwapEndian(data, dataSize));
}

// ////
// DetourNavMesh
// ////

void _dtPoly_setArea() __attribute__((used,
	annotate("as3sig:public function internal_dtPoly_setArea(poly_ptr:int, a:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtPoly_setArea()
{
	dtPoly * poly;
	AS3_GetScalarFromVar(poly, poly_ptr);

	unsigned char a;
	AS3_GetScalarFromVar(a, a);
	
	poly->setArea(a);
}

void _dtPoly_setType() __attribute__((used,
	annotate("as3sig:public function internal_dtPoly_setType(poly_ptr:int, t:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtPoly_setType()
{
	dtPoly * poly;
	AS3_GetScalarFromVar(poly, poly_ptr);

	unsigned char t;
	AS3_GetScalarFromVar(t, t);

	poly->setType(t);
}

void _dtPoly_getArea() __attribute__((used,
	annotate("as3sig:public function internal_dtPoly_getArea(poly_ptr:int):int"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtPoly_getArea()
{
	dtPoly * poly;
	AS3_GetScalarFromVar(poly, poly_ptr);

	AS3_Return(poly->getArea());
}

void _dtPoly_getType() __attribute__((used,
	annotate("as3sig:public function internal_dtPoly_getType(poly_ptr:int):int"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtPoly_getType()
{
	dtPoly * poly;
	AS3_GetScalarFromVar(poly, poly_ptr);

	AS3_Return(poly->getType());
}

void _dtAllocNavMesh() __attribute__((used,
	annotate("as3sig:public function internal_dtAllocNavMesh():int"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtAllocNavMesh()
{
	AS3_Return(dtAllocNavMesh());
}

void _dtFreeNavMesh() __attribute__((used,
	annotate("as3sig:public function internal_dtFreeNavMesh(ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtFreeNavMesh()
{
	dtNavMesh * ptr;
	AS3_GetScalarFromVar(ptr, ptr);

	dtFreeNavMesh(ptr);
}

void _dtNavMesh_init() __attribute__((used,
	annotate("as3sig:public function internal_dtNavMesh_init(nav_ptr:int, data_ptr:int, dataSize:int, flags:int):int"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtNavMesh_init()
{
	dtNavMesh * nav;
	AS3_GetScalarFromVar(nav, nav_ptr);

	unsigned char * data;
	AS3_GetScalarFromVar(data, data_ptr);

	int dataSize;
	AS3_GetScalarFromVar(dataSize, dataSize);

	int flags;
	AS3_GetScalarFromVar(flags, flags);

	AS3_Return(nav->init(data, dataSize, flags));
}

// ////
// DetourNavMeshQuery
// ////

void _dtAllocNavMeshQuery() __attribute__((used,
	annotate("as3sig:public function internal_dtAllocNavMeshQuery():int"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtAllocNavMeshQuery()
{
	AS3_Return(dtAllocNavMeshQuery());
}

void _dtFreeNavMeshQuery() __attribute__((used,
	annotate("as3sig:public function internal_dtFreeNavMeshQuery(ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtFreeNavMeshQuery()
{
	dtNavMeshQuery * ptr;
	AS3_GetScalarFromVar(ptr, ptr);

	dtFreeNavMeshQuery(ptr);
}

void _dtNavMeshQuery_init() __attribute__((used,
	annotate("as3sig:public function internal_dtNavMeshQuery_init(query_ptr:int, nav_ptr:int, maxNodes:int):int"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtNavMeshQuery_init()
{
	dtNavMeshQuery * query;
	AS3_GetScalarFromVar(query, query_ptr);
	
	dtNavMesh * nav;
	AS3_GetScalarFromVar(nav, nav_ptr);

	int maxNodes;
	AS3_GetScalarFromVar(maxNodes, maxNodes);

	AS3_Return(query->init(nav, maxNodes));
}