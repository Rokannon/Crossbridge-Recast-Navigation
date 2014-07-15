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
	void * _ptr;
	AS3_GetScalarFromVar(_ptr, ptr);

	dtFree(_ptr);
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

	int _dataSize;
	AS3_GetScalarFromVar(_dataSize, dataSize);

	AS3_Return(dtNavMeshHeaderSwapEndian(data, _dataSize));
}

void _dtNavMeshDataSwapEndian() __attribute__((used,
	annotate("as3sig:public function internal_dtNavMeshDataSwapEndian(data_ptr:int, dataSize:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtNavMeshDataSwapEndian()
{
	unsigned char * data;
	AS3_GetScalarFromVar(data, data_ptr);

	int _dataSize;
	AS3_GetScalarFromVar(_dataSize, dataSize);

	AS3_Return(dtNavMeshDataSwapEndian(data, _dataSize));
}

// ////
// DetourNavMesh
// ////

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
	dtNavMesh * _ptr;
	AS3_GetScalarFromVar(_ptr, ptr);

	dtFreeNavMesh(_ptr);
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

	int _dataSize;
	AS3_GetScalarFromVar(_dataSize, dataSize);

	int _flags;
	AS3_GetScalarFromVar(_flags, flags);

	AS3_Return(nav->init(data, _dataSize, _flags));
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
	dtNavMeshQuery * _ptr;
	AS3_GetScalarFromVar(_ptr, ptr);

	dtFreeNavMeshQuery(_ptr);
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

	int _maxNodes;
	AS3_GetScalarFromVar(_maxNodes, maxNodes);

	AS3_Return(query->init(nav, _maxNodes));
}