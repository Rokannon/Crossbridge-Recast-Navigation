package recastnavigation.detour.navmeshquery
{
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.CModule;

	use namespace rn_internal;

	/**
	 * Provides information about raycast hit filled by dtNavMeshQuery::raycast.
	 */
	public class DTRaycastHit extends RNBase
	{
		rn_internal static var SIZE						:int = 0;
		rn_internal static const OFFSET_T				:int = offset(4);
		rn_internal static const OFFSET_HIT_NORMAL		:int = offset(12);
		rn_internal static const OFFSET_PATH			:int = offset(4);
		rn_internal static const OFFSET_PATH_COUNT		:int = offset(4);
		rn_internal static const OFFSET_MAX_PATH		:int = offset(4);
		rn_internal static const OFFSET_PATH_COST		:int = offset(4);

		private static function offset(size:int):int { return (SIZE += size) - size; }

		/** The hit parameter. (FLT_MAX if no wall hit.) */
		public function get t():Number { return CModule.readFloat(ptr + OFFSET_T); }
		public function set t(value:Number):void { CModule.writeFloat(ptr + OFFSET_T, value); }

		/** hitNormal	The normal of the nearest wall hit. Component x. [(x, y, z)] */
		public function get hitNormalX():Number { return CModule.readFloat(ptr + OFFSET_HIT_NORMAL); }
		public function set hitNormalX(value:Number):void { CModule.writeFloat(ptr + OFFSET_HIT_NORMAL, value); }

		/** hitNormal	The normal of the nearest wall hit. Component y. [(x, y, z)] */
		public function get hitNormalY():Number { return CModule.readFloat(ptr + OFFSET_HIT_NORMAL + 4); }
		public function set hitNormalY(value:Number):void { CModule.writeFloat(ptr + OFFSET_HIT_NORMAL + 4, value); }

		/** hitNormal	The normal of the nearest wall hit. Component z. [(x, y, z)] */
		public function get hitNormalZ():Number { return CModule.readFloat(ptr + OFFSET_HIT_NORMAL + 8); }
		public function set hitNormalZ(value:Number):void { CModule.writeFloat(ptr + OFFSET_HIT_NORMAL + 8, value); }

		/** Pointer to an array of reference ids of the visited polygons. Getter. [opt] */
		public function getPath(index:int):int { return CModule.read32(CModule.read32(ptr + OFFSET_PATH) + 4 * index); }

		/** Pointer to an array of reference ids of the visited polygons. Setter. [opt] */
		public function setPath(index:int, value:int):void { CModule.write32(CModule.read32(ptr + OFFSET_PATH) + 4 * index, value); }

		/** The number of visited polygons. [opt] */
		public function get pathCount():int { return CModule.read32(ptr + OFFSET_PATH_COUNT); }
		public function set pathCount(value:int):void { CModule.write32(ptr + OFFSET_PATH_COUNT, value); }

		/** The maximum number of polygons the @p path array can hold. */
		public function get maxPath():int { return CModule.read32(ptr + OFFSET_MAX_PATH); }
		public function set maxPath(value:int):void { CModule.write32(ptr + OFFSET_MAX_PATH, value); }

		/** The cost of the path until hit. */
		public function get pathCost():Number { return CModule.readFloat(ptr + OFFSET_PATH_COST); }
		public function set pathCost(value:Number):void { CModule.writeFloat(ptr + OFFSET_PATH_COST, value); }
	}
}