package recastnavigation.recast.enum {
	
	/**
	 * Recast performance timer categories.
	 */
	public class RCTimerLabel {
		
		/** The user defined total time of the build. */
		public static const RC_TIMER_TOTAL:uint = 0;
		
		/** A user defined build time. */
		public static const RC_TIMER_TEMP:uint = 1;
		
		/** The time to rasterize the triangles. (See: #rcRasterizeTriangle) */
		public static const RC_TIMER_RASTERIZE_TRIANGLES:uint = 2;
		
		/** The time to build the compact heightfield. (See: #rcBuildCompactHeightfield) */
		public static const RC_TIMER_BUILD_COMPACTHEIGHTFIELD:uint = 3;
		
		/** The total time to build the contours. (See: #rcBuildContours) */
		public static const RC_TIMER_BUILD_CONTOURS:uint = 4;
		
		/** The time to trace the boundaries of the contours. (See: #rcBuildContours) */
		public static const RC_TIMER_BUILD_CONTOURS_TRACE:uint = 5;
		
		/** The time to simplify the contours. (See: #rcBuildContours) */
		public static const RC_TIMER_BUILD_CONTOURS_SIMPLIFY:uint = 6;
		
		/** The time to filter ledge spans. (See: #rcFilterLedgeSpans) */
		public static const RC_TIMER_FILTER_BORDER:uint = 7;
		
		/** The time to filter low height spans. (See: #rcFilterWalkableLowHeightSpans) */
		public static const RC_TIMER_FILTER_WALKABLE:uint = 8;
		
		/** The time to apply the median filter. (See: #rcMedianFilterWalkableArea) */
		public static const RC_TIMER_MEDIAN_AREA:uint = 9;
		
		/** The time to filter low obstacles. (See: #rcFilterLowHangingWalkableObstacles) */
		public static const RC_TIMER_FILTER_LOW_OBSTACLES:uint = 10;
		
		/** The time to build the polygon mesh. (See: #rcBuildPolyMesh) */
		public static const RC_TIMER_BUILD_POLYMESH:uint = 11;
		
		/** The time to merge polygon meshes. (See: #rcMergePolyMeshes) */
		public static const RC_TIMER_MERGE_POLYMESH:uint = 12;
		
		/** The time to erode the walkable area. (See: #rcErodeWalkableArea) */
		public static const RC_TIMER_ERODE_AREA:uint = 13;
		
		/** The time to mark a box area. (See: #rcMarkBoxArea) */
		public static const RC_TIMER_MARK_BOX_AREA:uint = 14;
		
		/** The time to mark a cylinder area. (See: #rcMarkCylinderArea) */
		public static const RC_TIMER_MARK_CYLINDER_AREA:uint = 15;
		
		/** The time to mark a convex polygon area. (See: #rcMarkConvexPolyArea) */
		public static const RC_TIMER_MARK_CONVEXPOLY_AREA:uint = 16;
		
		/** The total time to build the distance field. (See: #rcBuildDistanceField) */
		public static const RC_TIMER_BUILD_DISTANCEFIELD:uint = 17;
		
		/** The time to build the distances of the distance field. (See: #rcBuildDistanceField) */
		public static const RC_TIMER_BUILD_DISTANCEFIELD_DIST:uint = 18;
		
		/** The time to blur the distance field. (See: #rcBuildDistanceField) */
		public static const RC_TIMER_BUILD_DISTANCEFIELD_BLUR:uint = 19;
		
		/** The total time to build the regions. (See: #rcBuildRegions, #rcBuildRegionsMonotone) */
		public static const RC_TIMER_BUILD_REGIONS:uint = 20;
		
		/** The total time to apply the watershed algorithm. (See: #rcBuildRegions) */
		public static const RC_TIMER_BUILD_REGIONS_WATERSHED:uint = 21;
		
		/** The time to expand regions while applying the watershed algorithm. (See: #rcBuildRegions) */
		public static const RC_TIMER_BUILD_REGIONS_EXPAND:uint = 22;
		
		/** The time to flood regions while applying the watershed algorithm. (See: #rcBuildRegions) */
		public static const RC_TIMER_BUILD_REGIONS_FLOOD:uint = 23;
		
		/** The time to filter out small regions. (See: #rcBuildRegions, #rcBuildRegionsMonotone) */
		public static const RC_TIMER_BUILD_REGIONS_FILTER:uint = 24;
		
		/** The time to build heightfield layers. (See: #rcBuildHeightfieldLayers) */
		public static const RC_TIMER_BUILD_LAYERS:uint = 25;
		
		/** The time to build the polygon mesh detail. (See: #rcBuildPolyMeshDetail) */
		public static const RC_TIMER_BUILD_POLYMESHDETAIL:uint = 26;
		
		/** The time to merge polygon mesh details. (See: #rcMergePolyMeshDetails) */
		public static const RC_TIMER_MERGE_POLYMESHDETAIL:uint = 27;
		
		/** The maximum number of timers.  (Used for iterating timers.) */
		public static const RC_TIMER_:uint = 28;
		
	}
	
}