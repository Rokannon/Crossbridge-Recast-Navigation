package recastnavigation.detour.navmesh.enum {
	
	/**
	 * Options for dtNavMeshQuery::findStraightPath.
	 */
	public class DTStraightPathOptions {
		
		/** Add a vertex at every polygon edge crossing where area changes. */
		public static const DT_STRAIGHTPATH_AREA_CROSSINGS:int = 0x01;
		
		/** Add a vertex at every polygon edge crossing. */
		public static const DT_STRAIGHTPATH_ALL_CROSSINGS:int = 0x02;
		
	}
	
}