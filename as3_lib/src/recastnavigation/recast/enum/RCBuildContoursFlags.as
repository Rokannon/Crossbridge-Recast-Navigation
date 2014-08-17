package recastnavigation.recast.enum
{
	/**
	 * Contour build flags.
	 */
	public class RCBuildContoursFlags
	{
		/** Tessellate solid (impassable) edges during contour simplification. */
		public static const RC_CONTOUR_TESS_WALL_EDGES:int = 0x01;

		/** Tessellate edges between areas during contour simplification. */
		public static const RC_CONTOUR_TESS_AREA_EDGES:int = 0x02;
	}
}