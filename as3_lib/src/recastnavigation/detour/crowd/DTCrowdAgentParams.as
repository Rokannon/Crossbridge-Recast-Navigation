package recastnavigation.detour.crowd
{
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.CModule;
	import recastnavigation.internal_api.internal_dtAlloc_dtCrowdAgentParams;
	import recastnavigation.internal_api.internal_dtFree;
	import recastnavigation.internal_api.internal_localvar_alloc;
	import recastnavigation.internal_api.internal_localvar_get;
	import recastnavigation.internal_api.internal_localvar_set;

	use namespace rn_internal;

	/**
	 * Configuration parameters for a crowd agent.
	 */
	public class DTCrowdAgentParams extends RNBase
	{
		rn_internal static var SIZE									:int = 0;
		rn_internal static const OFFSET_RADIUS						:int = offset(4);
		rn_internal static const OFFSET_HEIGHT						:int = offset(4);
		rn_internal static const OFFSET_MAX_ACCELERATION			:int = offset(4);
		rn_internal static const OFFSET_MAX_SPEED					:int = offset(4);
		rn_internal static const OFFSET_COLLISION_QUERY_RANGE		:int = offset(4);
		rn_internal static const OFFSET_PATH_OPTIMIZATION_RANGE		:int = offset(4);
		rn_internal static const OFFSET_SEPARATION_WEIGTH			:int = offset(4);
		rn_internal static const OFFSET_UPDATE_FLAGS				:int = offset(1);
		rn_internal static const OFFSET_OBSTACLE_AVOIDANCE_TYPE		:int = offset(1);
		rn_internal static const OFFSET_QUERY_FILTER_TYPE			:int = offset(2);
		rn_internal static const OFFSET_USER_DATA					:int = offset(4);

		private static function offset(size:int):int { return (SIZE += size) - size; }

		/** Agent radius. [Limit: >= 0] */
		public function get radius():Number { return CModule.readFloat(ptr + OFFSET_RADIUS); }
		public function set radius(value:Number):void { CModule.writeFloat(ptr + OFFSET_RADIUS, value); }

		/** Agent height. [Limit: > 0] */
		public function get height():Number { return CModule.readFloat(ptr + OFFSET_HEIGHT); }
		public function set height(value:Number):void { CModule.writeFloat(ptr + OFFSET_HEIGHT, value); }

		/** Maximum allowed acceleration. [Limit: >= 0] */
		public function get maxAcceleration():Number { return CModule.readFloat(ptr + OFFSET_MAX_ACCELERATION); }
		public function set maxAcceleration(value:Number):void { CModule.writeFloat(ptr + OFFSET_MAX_ACCELERATION, value); }

		/** Maximum allowed speed. [Limit: >= 0] */
		public function get maxSpeed():Number { return CModule.readFloat(ptr + OFFSET_MAX_SPEED); }
		public function set maxSpeed(value:Number):void { CModule.writeFloat(ptr + OFFSET_MAX_SPEED, value); }

		/** Defines how close a collision element must be before it is considered for steering behaviors. [Limits: > 0] */
		public function get collisionQueryRange():Number { return CModule.readFloat(ptr + OFFSET_COLLISION_QUERY_RANGE); }
		public function set collisionQueryRange(value:Number):void { CModule.writeFloat(ptr + OFFSET_COLLISION_QUERY_RANGE, value); }

		/** The path visibility optimization range. [Limit: > 0] */
		public function get pathOptimizationRange():Number { return CModule.readFloat(ptr + OFFSET_PATH_OPTIMIZATION_RANGE); }
		public function set pathOptimizationRange(value:Number):void { CModule.writeFloat(ptr + OFFSET_PATH_OPTIMIZATION_RANGE, value); }

		/** How aggresive the agent manager should be at avoiding collisions with this agent. [Limit: >= 0] */
		public function get separationWeight():Number { return CModule.readFloat(ptr + OFFSET_SEPARATION_WEIGTH); }
		public function set separationWeight(value:Number):void { CModule.writeFloat(ptr + OFFSET_SEPARATION_WEIGTH, value); }

		/** Flags that impact steering behavior. (See: #UpdateFlags) */
		public function get updateFlags():int { return CModule.read8(ptr + OFFSET_UPDATE_FLAGS); }
		public function set updateFlags(value:int):void { CModule.write8(ptr + OFFSET_UPDATE_FLAGS, value); }

		/**
		 * The index of the avoidance configuration to use for the agent.
		 * [Limits: 0 <= value <= #DT_CROWD_MAX_OBSTAVOIDANCE_PARAMS]
		 */
		public function get obstacleAvoidanceType():int { return CModule.read8(ptr + OFFSET_OBSTACLE_AVOIDANCE_TYPE); }
		public function set obstacleAvoidanceType(value:int):void { CModule.write8(ptr + OFFSET_OBSTACLE_AVOIDANCE_TYPE, value); }

		/** The index of the query filter used by this agent. */
		public function get queryFilterType():int { return CModule.read8(ptr + OFFSET_QUERY_FILTER_TYPE); }
		public function set queryFilterType(value:int):void { CModule.write8(ptr + OFFSET_QUERY_FILTER_TYPE, value); }

		/** User defined data attached to the agent. */
		public function get userData():Object { return internal_localvar_get(CModule.read32(ptr + OFFSET_USER_DATA)); }
		public function set userData(value:Object):void { internal_localvar_set(CModule.read32(ptr + OFFSET_USER_DATA), value); }

		public override function alloc():Boolean
		{
			ptr = internal_dtAlloc_dtCrowdAgentParams();
			CModule.write32(ptr + OFFSET_USER_DATA, internal_localvar_alloc());
			return ptr != 0;
		}

		public override function free():void
		{
			internal_dtFree(CModule.read32(ptr + OFFSET_USER_DATA));
			internal_dtFree(ptr);
			ptr = 0;
		}
	}
}