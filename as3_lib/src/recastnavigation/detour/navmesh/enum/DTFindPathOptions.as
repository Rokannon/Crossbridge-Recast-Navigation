package recastnavigation.detour.navmesh.enum
{
	/**
	 * Options for dtNavMeshQuery::findPath
	 */
	public class DTFindPathOptions
	{
		/** [provisional] trade quality for performance far from the origin. The idea is that by then a new query will be issued */
		public static const DT_FINDPATH_LOW_QUALITY_FAR:int = 0x01;

		/** use raycasts during pathfind to "shortcut" (raycast still consider costs) */
		public static const DT_FINDPATH_ANY_ANGLE:int = 0x02;
	}
}