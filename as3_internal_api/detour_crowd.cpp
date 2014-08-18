#include <stdlib.h>
#include <AS3\AS3.h>
#include <AS3\AS3++.h>
#include <DetourCrowd.h>
#include <DetourLocalBoundary.h>
#include <DetourObstacleAvoidance.h>
#include <DetourPathCorridor.h>
#include <DetourPathQueue.h>
#include <DetourProximityGrid.h>

void _dtAlloc_dtCrowdAgentParams() __attribute__((used,
	annotate("as3sig:public function internal_dtAlloc_dtCrowdAgentParams():int"),
	annotate("as3package:recastnavigation.internal_api")));


void _dtAlloc_dtCrowdAgentParams()
{
	AS3_Return((dtCrowdAgentParams *)dtAlloc(sizeof(dtCrowdAgentParams), DT_ALLOC_PERM));
}

void _dtAlloc_dtObstacleAvoidanceParams() __attribute__((used,
	annotate("as3sig:public function internal_dtAlloc_dtObstacleAvoidanceParams():int"),
	annotate("as3package:recastnavigation.internal_api")));


void _dtAlloc_dtObstacleAvoidanceParams()
{
	AS3_Return((dtObstacleAvoidanceParams *)dtAlloc(sizeof(dtObstacleAvoidanceParams), DT_ALLOC_PERM));
}

// ////
// dtCrowd
// ////

void _dtAllocCrowd() __attribute__((used,
	annotate("as3sig:public function internal_dtAllocCrowd():int"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtAllocCrowd()
{
	AS3_Return(dtAllocCrowd());
}

void _dtFreeCrowd() __attribute__((used,
	annotate("as3sig:public function internal_dtFreeCrowd(ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtFreeCrowd() {
	dtCrowd * ptr;
	AS3_GetScalarFromVar(ptr, ptr);

	dtFreeCrowd(ptr);
}

void _dtCrowd_init() __attribute__((used,
	annotate("as3sig:public function internal_dtCrowd_init(crowd_ptr:int, maxAgents:int, maxAgentRadius:Number, nav_ptr:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtCrowd_init()
{
	dtCrowd * crowd;
	AS3_GetScalarFromVar(crowd, crowd_ptr);

	int maxAgents;
	AS3_GetScalarFromVar(maxAgents, maxAgents);

	float maxAgentRadius;
	AS3_GetScalarFromVar(maxAgentRadius, maxAgentRadius);

	dtNavMesh * nav;
	AS3_GetScalarFromVar(nav, nav_ptr);

	AS3_Return(crowd->init(maxAgents, maxAgentRadius, nav));
}

void _dtCrowd_setObstacleAvoidanceParams() __attribute__((used,
	annotate("as3sig:public function internal_dtCrowd_setObstacleAvoidanceParams(crowd_ptr:int, idx:int, params_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtCrowd_setObstacleAvoidanceParams()
{
	dtCrowd * crowd;
	AS3_GetScalarFromVar(crowd, crowd_ptr);

	int idx;
	AS3_GetScalarFromVar(idx, idx);

	dtObstacleAvoidanceParams * params;
	AS3_GetScalarFromVar(params, params_ptr);

	crowd->setObstacleAvoidanceParams(idx, params);
}

void _dtCrowd_getObstacleAvoidanceParams() __attribute__((used,
	annotate("as3sig:public function internal_dtCrowd_getObstacleAvoidanceParams(crowd_ptr:int, idx:int):int"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtCrowd_getObstacleAvoidanceParams()
{
	dtCrowd * crowd;
	AS3_GetScalarFromVar(crowd, crowd_ptr);

	int idx;
	AS3_GetScalarFromVar(idx, idx);

	AS3_Return(crowd->getObstacleAvoidanceParams(idx));
}

void _dtCrowd_getAgent() __attribute__((used,
	annotate("as3sig:public function internal_dtCrowd_getAgent(crowd_ptr:int, idx:int):int"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtCrowd_getAgent()
{
	dtCrowd * crowd;
	AS3_GetScalarFromVar(crowd, crowd_ptr);

	int idx;
	AS3_GetScalarFromVar(idx, idx);

	AS3_Return(crowd->getAgent(idx));
}

void _dtCrowd_getAgentCount() __attribute__((used,
	annotate("as3sig:public function internal_dtCrowd_getAgentCount(crowd_ptr:int):int"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtCrowd_getAgentCount()
{
	dtCrowd * crowd;
	AS3_GetScalarFromVar(crowd, crowd_ptr);

	AS3_Return(crowd->getAgentCount());
}

void _dtCrowd_addAgent() __attribute__((used,
	annotate("as3sig:public function internal_dtCrowd_addAgent(crowd_ptr:int, pos_ptr:int, params_ptr:int):int"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtCrowd_addAgent()
{
	dtCrowd * crowd;
	AS3_GetScalarFromVar(crowd, crowd_ptr);

	float * pos;
	AS3_GetScalarFromVar(pos, pos_ptr);

	dtCrowdAgentParams * params;
	AS3_GetScalarFromVar(params, params_ptr);

	AS3_Return(crowd->addAgent(pos, params));
}

void _dtCrowd_updateAgentParameters() __attribute__((used,
	annotate("as3sig:public function internal_dtCrowd_updateAgentParameters(crowd_ptr:int, idx:int, params_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtCrowd_updateAgentParameters()
{
	dtCrowd * crowd;
	AS3_GetScalarFromVar(crowd, crowd_ptr);

	int idx;
	AS3_GetScalarFromVar(idx, idx);

	dtCrowdAgentParams * params;
	AS3_GetScalarFromVar(params, params_ptr);

	crowd->updateAgentParameters(idx, params);
}

void _dtCrowd_removeAgent() __attribute__((used,
	annotate("as3sig:public function internal_dtCrowd_removeAgent(crowd_ptr:int, idx:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtCrowd_removeAgent()
{
	dtCrowd * crowd;
	AS3_GetScalarFromVar(crowd, crowd_ptr);

	int idx;
	AS3_GetScalarFromVar(idx, idx);

	crowd->removeAgent(idx);
}

void _dtCrowd_requestMoveTarget() __attribute__((used,
	annotate("as3sig:public function internal_dtCrowd_requestMoveTarget(crowd_ptr:int, idx:int, ref:int, pos_ptr:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtCrowd_requestMoveTarget()
{
	dtCrowd * crowd;
	AS3_GetScalarFromVar(crowd, crowd_ptr);

	int idx;
	AS3_GetScalarFromVar(idx, idx);

	int ref;
	AS3_GetScalarFromVar(ref, ref);

	float * pos;
	AS3_GetScalarFromVar(pos, pos_ptr);

	AS3_Return(crowd->requestMoveTarget(idx, ref, pos));
}

void _dtCrowd_requestMoveVelocity() __attribute__((used,
	annotate("as3sig:public function internal_dtCrowd_requestMoveVelocity(crowd_ptr:int, idx:int, vel_ptr:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtCrowd_requestMoveVelocity()
{
	dtCrowd * crowd;
	AS3_GetScalarFromVar(crowd, crowd_ptr);

	int idx;
	AS3_GetScalarFromVar(idx, idx);

	float * vel;
	AS3_GetScalarFromVar(vel, vel_ptr);

	AS3_Return(crowd->requestMoveVelocity(idx, vel));
}

void _dtCrowd_resetMoveTarget() __attribute__((used,
	annotate("as3sig:public function internal_dtCrowd_resetMoveTarget(crowd_ptr:int, idx:int):Boolean"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtCrowd_resetMoveTarget()
{
	dtCrowd * crowd;
	AS3_GetScalarFromVar(crowd, crowd_ptr);

	int idx;
	AS3_GetScalarFromVar(idx, idx);

	AS3_Return(crowd->resetMoveTarget(idx));
}

void _dtCrowd_getActiveAgents() __attribute__((used,
	annotate("as3sig:public function internal_dtCrowd_getActiveAgents(crowd_ptr:int, agents_ptr_ptr:int, maxAgents:int):int"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtCrowd_getActiveAgents()
{
	dtCrowd * crowd;
	AS3_GetScalarFromVar(crowd, crowd_ptr);

	dtCrowdAgent * * agents;
	AS3_GetScalarFromVar(agents, agents_ptr_ptr);

	int maxAgents;
	AS3_GetScalarFromVar(maxAgents, maxAgents);

	AS3_Return(crowd->getActiveAgents(agents, maxAgents));
}

void _dtCrowd_update() __attribute__((used,
	annotate("as3sig:public function internal_dtCrowd_update(crowd_ptr:int, dt:Number, debug_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _dtCrowd_update()
{
	dtCrowd * crowd;
	AS3_GetScalarFromVar(crowd, crowd_ptr);

	float dt;
	AS3_GetScalarFromVar(dt, dt);

	dtCrowdAgentDebugInfo * debug;
	AS3_GetScalarFromVar(debug, debug_ptr);

	crowd->update(dt, debug);
}