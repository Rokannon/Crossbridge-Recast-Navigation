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

// ////
// Recast
// ////

_SIZEOF(rcContour);
_SIZEOF(rcContourSet);
_SIZEOF(rcPolyMesh);
_SIZEOF(rcPolyMeshDetail);
_SIZEOF(rcCompactCell);
_SIZEOF(rcCompactHeightfield);
_SIZEOF(rcCompactSpan);
_SIZEOF(rcConfig);
_SIZEOF(rcContext);
_SIZEOF(rcHeightfield);
_SIZEOF(rcHeightfieldLayer);
_SIZEOF(rcHeightfieldLayerSet);
_SIZEOF(rcSpan);
_SIZEOF(rcSpanPool);

// ////
// Detour
// ////

_SIZEOF(dtBVNode);
_SIZEOF(dtLink);
_SIZEOF(dtMeshHeader);
_SIZEOF(dtMeshTile);
_SIZEOF(dtNavMesh);
_SIZEOF(dtNavMeshParams);
_SIZEOF(dtOffMeshConnection);
_SIZEOF(dtPoly);
_SIZEOF(dtPolyDetail);
_SIZEOF(dtNavMeshCreateParams);
_SIZEOF(dtNavMeshQuery);
_SIZEOF(dtQueryFilter);
_SIZEOF(dtRaycastHit);

// ////
// Detour Crowd
// ////

_SIZEOF(dtCrowd);
_SIZEOF(dtCrowdAgent);
_SIZEOF(dtCrowdAgentDebugInfo);
_SIZEOF(dtCrowdAgentParams);
_SIZEOF(dtCrowdNeighbour);
_SIZEOF(dtObstacleAvoidanceParams);

_SIZEOF(dtPathCorridor);
_SIZEOF(dtLocalBoundary);
_SIZEOF(dtPathQueue);
_SIZEOF(dtObstacleAvoidanceDebugData);