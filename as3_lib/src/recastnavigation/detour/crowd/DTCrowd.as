package recastnavigation.detour.crowd {
	
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.detour.navmesh.DTNavMesh;
	import recastnavigation.internal_api.CModule;
	import recastnavigation.internal_api.internal_dtAllocCrowd;
	import recastnavigation.internal_api.internal_dtCrowd_addAgent;
	import recastnavigation.internal_api.internal_dtCrowd_getActiveAgents;
	import recastnavigation.internal_api.internal_dtCrowd_getAgent;
	import recastnavigation.internal_api.internal_dtCrowd_getAgentCount;
	import recastnavigation.internal_api.internal_dtCrowd_getObstacleAvoidanceParams;
	import recastnavigation.internal_api.internal_dtCrowd_init;
	import recastnavigation.internal_api.internal_dtCrowd_removeAgent;
	import recastnavigation.internal_api.internal_dtCrowd_requestMoveTarget;
	import recastnavigation.internal_api.internal_dtCrowd_requestMoveVelocity;
	import recastnavigation.internal_api.internal_dtCrowd_resetMoveTarget;
	import recastnavigation.internal_api.internal_dtCrowd_setObstacleAvoidanceParams;
	import recastnavigation.internal_api.internal_dtCrowd_update;
	import recastnavigation.internal_api.internal_dtCrowd_updateAgentParameters;
	import recastnavigation.internal_api.internal_dtFreeCrowd;
	import recastnavigation.internal_api.internal_localvar_alloc;
	import recastnavigation.internal_api.internal_localvar_set;
	import recastnavigation.internal_api.internal_sizeof_dtPathQueue;
	import recastnavigation.internal_api.internal_sizeof_dtQueryFilter;
	
	use namespace rn_internal;
	
	/**
	 * Provides local steering behaviors for a group of agents. 
	 */
	public class DTCrowd extends RNBase {
		
		/**
		 * The maximum number of crowd avoidance configurations 
		 * supported by the crowd manager.
		 */
		public static const DT_CROWD_MAX_OBSTAVOIDANCE_PARAMS:int = 8;
		
		/** 
		 * The maximum number of query filter types supported 
		 * by the crowd manager. 
		 */
		public static const DT_CROWD_MAX_QUERY_FILTER_TYPE:int = 16;
		
		rn_internal static var SIZE									:int = 0;
		rn_internal static const OFFSET_M_MAX_AGENTS				:int = offset(4);
		rn_internal static const OFFSET_M_AGENTS					:int = offset(4);
		rn_internal static const OFFSET_M_ACTIVE_AGENTS				:int = offset(4);
		rn_internal static const OFFSET_M_AGENT_ANIMS				:int = offset(4);
		rn_internal static const OFFSET_M_PATHQ						:int = offset(internal_sizeof_dtPathQueue()); 
		rn_internal static const OFFSET_M_OBSTACLE_QUERY_PARAMS		:int = offset(DTObstacleAvoidanceParams.SIZE * DT_CROWD_MAX_OBSTAVOIDANCE_PARAMS);
		rn_internal static const OFFSET_M_OBSTACLE_QUERY			:int = offset(4);
		rn_internal static const OFFSET_M_GRID						:int = offset(4);
		rn_internal static const OFFSET_M_PATH_RESULT				:int = offset(4);
		rn_internal static const OFFSET_M_MAX_PATH_RESULT			:int = offset(4);
		rn_internal static const OFFSET_M_EXT						:int = offset(12); 
		rn_internal static const OFFSET_M_FILTERS					:int = offset(internal_sizeof_dtQueryFilter() * DT_CROWD_MAX_QUERY_FILTER_TYPE);
		rn_internal static const OFFSET_M_MAX_AGENT_RADIUS			:int = offset(4);
		rn_internal static const OFFSET_M_VELOCITY_SAMPLE_COUNT		:int = offset(4);
		rn_internal static const OFFSET_M_NAVQUERY					:int = offset(4);
		
		private static function offset(size:int):int { return (SIZE += size) - size; }
		
		private const _localvars:Vector.<int> = new Vector.<int>();
		private const _agents:Vector.<DTCrowdAgent> = new Vector.<DTCrowdAgent>();
		
		/** Initializes the crowd. */
		public function init(maxAgents:int, maxAgentRadius:Number, nav:DTNavMesh):Boolean {
			
			while (_localvars.length > 0) CModule.free(_localvars.pop());
			var result:Boolean = internal_dtCrowd_init(localvar_ptr, maxAgents, maxAgentRadius, nav.ptr);
			while (_agents.length < maxAgents) _agents.push(new DTCrowdAgent());
			if (_agents.length > maxAgents) _agents.length = maxAgents;
			for (var i:int = 0; i < maxAgents; ++i) {
				var agent_ptr:int = ptr + OFFSET_M_AGENTS + DTCrowdAgent.SIZE * i;
				_agents[i].ptr = agent_ptr;
				
				// Alloc new localvar to hold agent's userData.
				var localvar_ptr:int = internal_localvar_alloc();
				_localvars[i] = localvar_ptr;
				var userData_ptr:int = agent_ptr + DTCrowdAgent.OFFSET_PARAMS + DTCrowdAgentParams.OFFSET_USER_DATA;
				CModule.write32(userData_ptr, localvar_ptr);
			}
			
			return result;
			
		}
		
		/** Sets the shared avoidance configuration for the specified index. */
		public function setObstacleAvoidanceParams(idx:int, params:DTObstacleAvoidanceParams):void {
			
			internal_dtCrowd_setObstacleAvoidanceParams(ptr, idx, params.ptr);
			
		}
		
		/** Gets the shared avoidance configuration for the specified index. */
		public function getObstacleAvoidanceParams(idx:int, resultParams:DTObstacleAvoidanceParams = null):DTObstacleAvoidanceParams {
			
			if (resultParams == null) resultParams = new DTObstacleAvoidanceParams();
			resultParams.ptr = internal_dtCrowd_getObstacleAvoidanceParams(ptr, idx);
			return resultParams;
			
		}
		
		/** Gets the specified agent from the pool. */
		public function getAgent(idx:int):DTCrowdAgent {
			
//			if (resultAgent == null) resultAgent = new DTCrowdAgent();
//			resultAgent.ptr = internal_dtCrowd_getAgent(ptr, idx);
//			return resultAgent;
			
			return _agents[idx];
			
		}
		
		/** The maximum number of agents that can be managed by the object. */
		public function getAgentCount():int {
			
			return internal_dtCrowd_getAgentCount(ptr);
			
		}
		
		/** Adds a new agent to the crowd. */
		public function addAgent(posX:Number, posY:Number, posZ:Number, params:DTCrowdAgentParams):int {
			
			var pos_ptr:int = CModule.malloc(12);
			CModule.writeFloat(pos_ptr, posX);
			CModule.writeFloat(pos_ptr + 4, posY);
			CModule.writeFloat(pos_ptr + 8, posZ);
			var result:int = internal_dtCrowd_addAgent(ptr, pos_ptr, params.ptr);
			CModule.free(pos_ptr);
			handleUserData(result, params);
			return result;
			
		}
		
		/** Updates the specified agent's configuration. */
		public function updateAgentParameters(idx:int, params:DTCrowdAgentParams):void {
			
			internal_dtCrowd_updateAgentParameters(ptr, idx, params.ptr);
			handleUserData(idx, params);
			
		}
		
		/** Removes the agent from the crowd. */
		public function removeAgent(idx:int):void {
			
			internal_dtCrowd_removeAgent(ptr, idx);
			internal_localvar_set(_localvars[idx], null);
			
		}
		
		/** Submits a new move request for the specified agent. */
		public function requestMoveTarget(idx:int, polyRef:int, posX:Number, posY:Number, posZ:Number):Boolean {
			
			var pos_ptr:int = CModule.malloc(12);
			CModule.writeFloat(pos_ptr, posX);
			CModule.writeFloat(pos_ptr + 4, posY);
			CModule.writeFloat(pos_ptr + 8, posZ);
			var result:Boolean = internal_dtCrowd_requestMoveTarget(ptr, idx, polyRef, pos_ptr);
			CModule.free(pos_ptr);
			return result;
			
		}
		
		/** Submits a new move request for the specified agent. */
		public function requestMoveVelocity(idx:int, velX:Number, velY:Number, velZ:Number):Boolean {
			
			var vel_ptr:int = CModule.malloc(12);
			CModule.writeFloat(vel_ptr, velX);
			CModule.writeFloat(vel_ptr + 4, velY);
			CModule.writeFloat(vel_ptr + 8, velZ);
			var result:Boolean = internal_dtCrowd_requestMoveVelocity(ptr, idx, vel_ptr);
			CModule.free(vel_ptr);
			return result;
			
		}
		
		/** Resets any request for the specified agent. */
		public function resetMoveTarget(idx:int):Boolean {
			
			return internal_dtCrowd_resetMoveTarget(ptr, idx);
			
		}
		
		/** Gets the active agents int the agent pool. */
		public function getActiveAgents(resultAgents:Vector.<DTCrowdAgent> = null):Vector.<DTCrowdAgent> {
			
			if (resultAgents == null) resultAgents = new Vector.<DTCrowdAgent>();
			var maxAgents:int = CModule.read32(ptr + OFFSET_M_MAX_AGENTS);
			var agents_ptr_ptr:int = CModule.malloc(4 * maxAgents);
			var numActiveAgents:int = internal_dtCrowd_getActiveAgents(ptr, agents_ptr_ptr, maxAgents);
			resultAgents.length = 0;
			for (var i:int = 0; i < numActiveAgents; ++i) {
				var agent_ptr:int = CModule.read32(CModule.read32(agents_ptr_ptr) + 4 * i);
				var idx:int = (agent_ptr - CModule.read32(ptr + OFFSET_M_AGENTS)) / DTCrowdAgent.SIZE;
				resultAgents[i] = _agents[idx];
			}
			CModule.free(agents_ptr_ptr);
			return resultAgents;
			
		}
		
		/** Updates the steering and positions of all agents. */
		public function update(dt:Number, debug:DTCrowdAgentDebugInfo):void {
			
			internal_dtCrowd_update(ptr, dt, debug.ptr);
			
		}
		
		public override function alloc():void {
			
			ptr = internal_dtAllocCrowd();
			
		}
		
		public override function free():void {
			
			while (_localvars.length > 0) CModule.free(_localvars.pop());
			internal_dtFreeCrowd(ptr);
			ptr = 0;
			
		}
		
		[Inline]
		private function handleUserData(idx:int, params:DTCrowdAgentParams):void {
			
			// Restore agent params' userData localvar.
			var localvar_ptr:int = _localvars[idx];
			var userData_ptr:int = ptr + OFFSET_M_AGENTS + DTCrowdAgent.SIZE * idx + 
				DTCrowdAgent.OFFSET_PARAMS + DTCrowdAgentParams.OFFSET_USER_DATA;
			CModule.write32(userData_ptr, localvar_ptr);
			
			// Put userData from argument params to agent params.
			internal_localvar_set(localvar_ptr, params.userData);
			
		}
		
	}
	
}