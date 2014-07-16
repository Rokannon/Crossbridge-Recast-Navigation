#include <stdlib.h>
#include <AS3\AS3.h>
#include <AS3\AS3++.h>

// Recast
#include <Recast.h>
#include <RecastAlloc.h>
#include <RecastAssert.h>

// Detour
#include <DetourAlloc.h>
#include <DetourAssert.h>
#include <DetourCommon.h>
#include <DetourMath.h>
#include <DetourNavMesh.h>
#include <DetourNavMeshBuilder.h>
#include <DetourNavMeshQuery.h>
#include <DetourNode.h>
#include <DetourStatus.h>

// Detour Crowd
#include <DetourCrowd.h>
#include <DetourLocalBoundary.h>
#include <DetourObstacleAvoidance.h>
#include <DetourPathCorridor.h>
#include <DetourPathQueue.h>
#include <DetourProximityGrid.h>

#define _SIZEOF(x) \
void _sizeof_ ## x() __attribute__((used,\
	annotate("as3sig:public function internal_sizeof_" #x "():int"),\
	annotate("as3package:recastnavigation.internal_api")));\
void _sizeof_ ## x()\
{\
	AS3_Return(sizeof(x));\
}

_SIZEOF(dtCrowdNeighbour);
_SIZEOF(dtCrowdAgentParams);
_SIZEOF(dtCrowdAgent);
_SIZEOF(dtPathCorridor);
_SIZEOF(dtLocalBoundary);