package recastnavigation.recast.enum
{
    public class RCAreaType
    {
        /**
         * Represents the null area. When a data element is given
         * this value it is considered to no longer be assigned
         * to a usable area.  (E.g. It is unwalkable.)
         */
        public static const RC_NULL_AREA:int = 0;
        /**
         * The default area id used to indicate a walkable polygon.
         * This is also the maximum allowed area id, and the only
         * non-null area id recognized by some steps in the build process.
         */
        public static const RC_WALKABLE_AREA:int = 63;
    }
}