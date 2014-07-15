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