package recastnavigation.detour.status.enum
{
    public class DTStatus
    {
        /** Operation failed. */
        public static const DT_FAILURE:int = 1 << 31;
        /** Operation succeed. */
        public static const DT_SUCCESS:int = 1 << 30;
        /** Operation still in progress. */
        public static const DT_IN_PROGRESS:int = 1 << 29;
        /** Input data is not recognized. */
        public static const DT_WRONG_MAGIC:int = 1 << 0;
        /** Input data is in wrong version. */
        public static const DT_WRONG_VERSION:int = 1 << 1;
        /** Operation ran out of memory. */
        public static const DT_OUT_OF_MEMORY:int = 1 << 2;
        /** An input parameter was invalid. */
        public static const DT_INVALID_PARAM:int = 1 << 3;
        /** Result buffer for the query was too small to store all results. */
        public static const DT_BUFFER_TOO_SMALL:int = 1 << 4;
        /** Query ran out of nodes during search. */
        public static const DT_OUT_OF_NODES:int = 1 << 5;
        /** Query did not reach the end location, returning best guess. */
        public static const DT_PARTIAL_RESULT:int = 1 << 6;
    }
}