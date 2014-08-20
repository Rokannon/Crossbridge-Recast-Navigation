package recastnavigation.detour.crowd
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.copyBytes;
    import recastnavigation.core.utils.offsetBytes;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_sizeof_dtCrowdAgentParams;
    import recastnavigation.internal_api.internal_sizeof_dtCrowdNeighbour;
    import recastnavigation.internal_api.internal_sizeof_dtLocalBoundary;
    import recastnavigation.internal_api.internal_sizeof_dtPathCorridor;

    use namespace rn_internal;

    /**
     * Represents an agent managed by a #dtCrowd object.
     */
    public class DTCrowdAgent extends RNBase
    {
        /**
         * The maximum number of neighbors that a crowd agent can take into account
         * for steering decisions.
         */
        public static const DT_CROWDAGENT_MAX_NEIGHBOURS:int = 6;
        /**
         * The maximum number of corners a crowd agent will look ahead in the path.
         * This value is used for sizing the crowd agent corner buffers. Due to the
         * behavior of the crowd manager, the actual number of useful corners will
         * be one less than this number.
         */
        public static const DT_CROWDAGENT_MAX_CORNERS:int = 4;
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_ACTIVE:int = offsetBytes(1, DTCrowdAgent);
        rn_internal static const OFFSET_STATE:int = offsetBytes(1, DTCrowdAgent);
        rn_internal static const OFFSET_PARTIAL:int = offsetBytes(2, DTCrowdAgent);
        rn_internal static const OFFSET_CORRIDOR:int = offsetBytes(internal_sizeof_dtPathCorridor(), DTCrowdAgent);
        rn_internal static const OFFSET_BOUNDARY:int = offsetBytes(internal_sizeof_dtLocalBoundary(), DTCrowdAgent);
        rn_internal static const OFFSET_TOPOLOGY_OPT_TIME:int = offsetBytes(4, DTCrowdAgent);
        rn_internal static const OFFSET_NEIS:int = offsetBytes(internal_sizeof_dtCrowdNeighbour() * DT_CROWDAGENT_MAX_NEIGHBOURS,
                                                               DTCrowdAgent);
        rn_internal static const OFFSET_NNEIS:int = offsetBytes(4, DTCrowdAgent);
        rn_internal static const OFFSET_DESIRED_SPEED:int = offsetBytes(4, DTCrowdAgent);
        rn_internal static const OFFSET_NPOS:int = offsetBytes(12, DTCrowdAgent);
        rn_internal static const OFFSET_DISP:int = offsetBytes(12, DTCrowdAgent);
        rn_internal static const OFFSET_DVEL:int = offsetBytes(12, DTCrowdAgent);
        rn_internal static const OFFSET_NVEL:int = offsetBytes(12, DTCrowdAgent);
        rn_internal static const OFFSET_VEL:int = offsetBytes(12, DTCrowdAgent);
        rn_internal static const OFFSET_PARAMS:int = offsetBytes(internal_sizeof_dtCrowdAgentParams(), DTCrowdAgent);
        rn_internal static const OFFSET_CORNER_VERTS:int = offsetBytes(4 * 3 * DT_CROWDAGENT_MAX_CORNERS, DTCrowdAgent);
        rn_internal static const OFFSET_CORNER_FLAGS:int = offsetBytes(DT_CROWDAGENT_MAX_CORNERS, DTCrowdAgent);
        rn_internal static const OFFSET_CORNER_POLYS:int = offsetBytes(4 * DT_CROWDAGENT_MAX_CORNERS, DTCrowdAgent);
        rn_internal static const OFFSET_NCORNERS:int = offsetBytes(4, DTCrowdAgent);
        rn_internal static const OFFSET_TARGET_STATE:int = offsetBytes(4, DTCrowdAgent);
        rn_internal static const OFFSET_TARGET_REF:int = offsetBytes(4, DTCrowdAgent);
        rn_internal static const OFFSET_TARGET_POS:int = offsetBytes(12, DTCrowdAgent);
        rn_internal static const OFFSET_TARGET_PATHQ_REF:int = offsetBytes(4, DTCrowdAgent);
        rn_internal static const OFFSET_TARGET_REPLAN:int = offsetBytes(4, DTCrowdAgent);
        rn_internal static const OFFSET_TARGET_REPLAN_TIME:int = offsetBytes(4, DTCrowdAgent);

        /** True if the agent is active, false if the agent is in an unused slot in the agent pool. */
        public function get active():Boolean
        {
            return CModule.read8(ptr + OFFSET_ACTIVE) != 0;
        }

        public function set active(value:Boolean):void
        {
            CModule.write8(ptr + OFFSET_ACTIVE, value ? 1 : 0);
        }

        /** The type of mesh polygon the agent is traversing. (See: #CrowdAgentState) */
        public function get state():int
        {
            return CModule.read8(ptr + OFFSET_STATE);
        }

        public function set state(value:int):void
        {
            CModule.write8(ptr + OFFSET_STATE, value);
        }

        /**
         * True if the agent has valid path (targetState == DT_CROWDAGENT_TARGET_VALID)
         * and the path does not lead to the requested position, else false.
         */
        public function get partial():Boolean
        {
            return CModule.read8(ptr + OFFSET_PARTIAL) != 0;
        }

        public function set partial(value:Boolean):void
        {
            CModule.write8(ptr + OFFSET_PARTIAL, value ? 1 : 0);
        }

        /** Time since the agent's path corridor was optimized. */
        public function get topologyOptTime():Number
        {
            return CModule.readFloat(ptr + OFFSET_TOPOLOGY_OPT_TIME);
        }

        public function set topologyOptTime(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_TOPOLOGY_OPT_TIME, value);
        }

        /** The known neighbors of the agent. Getter. */
        public function getNei(index:int, resultNei:DTCrowdNeighbour = null):DTCrowdNeighbour
        {
            if (resultNei == null)
            {
                resultNei = new DTCrowdNeighbour();
            }
            resultNei.ptr = ptr + OFFSET_NEIS + DTCrowdNeighbour.SIZE * index;
            return resultNei;
        }

        /** The known neighbors of the agent. Setter. */
        public function setNei(index:int, value:DTCrowdNeighbour):void
        {
            copyBytes(value.ptr, ptr + OFFSET_NEIS + DTCrowdNeighbour.SIZE * index, DTCrowdNeighbour.SIZE);
        }

        /** The number of neighbors. */
        public function get nneis():int
        {
            return CModule.read32(ptr + OFFSET_NNEIS);
        }

        public function set nneis(value:int):void
        {
            CModule.write32(ptr + OFFSET_NNEIS, value);
        }

        /** The desired speed. */
        public function get desiredSpeed():Number
        {
            return CModule.readFloat(ptr + OFFSET_DESIRED_SPEED);
        }

        public function set desiredSpeed(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_DESIRED_SPEED, value);
        }

        /** The current agent position. Component x. [(x, y, z)] */
        public function get nposX():Number
        {
            return CModule.readFloat(ptr + OFFSET_NPOS);
        }

        public function set nposX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_NPOS, value);
        }

        /** The current agent position. Component y. [(x, y, z)] */
        public function get nposY():Number
        {
            return CModule.readFloat(ptr + OFFSET_NPOS + 4);
        }

        public function set nposY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_NPOS + 4, value);
        }

        /** The current agent position. Component z. [(x, y, z)] */
        public function get nposZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_NPOS + 8);
        }

        public function set nposZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_NPOS + 8, value);
        }

        public function get dispX():Number
        {
            return CModule.readFloat(ptr + OFFSET_DISP);
        }

        public function set dispX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_DISP, value);
        }

        public function get dispY():Number
        {
            return CModule.readFloat(ptr + OFFSET_DISP + 4);
        }

        public function set dispY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_DISP + 4, value);
        }

        public function get dispZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_DISP + 8);
        }

        public function set dispZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_DISP + 8, value);
        }

        /** The desired velocity of the agent. Component x. [(x, y, z)] */
        public function get dvelX():Number
        {
            return CModule.readFloat(ptr + OFFSET_DVEL);
        }

        public function set dvelX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_DVEL, value);
        }

        /** The desired velocity of the agent. Component y. [(x, y, z)] */
        public function get dvelY():Number
        {
            return CModule.readFloat(ptr + OFFSET_DVEL + 4);
        }

        public function set dvelY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_DVEL + 4, value);
        }

        /** The desired velocity of the agent. Component z. [(x, y, z)] */
        public function get dvelZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_DVEL + 8);
        }

        public function set dvelZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_DVEL + 8, value);
        }

        public function get nvelX():Number
        {
            return CModule.readFloat(ptr + OFFSET_NVEL);
        }

        public function set nvelX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_NVEL, value);
        }

        public function get nvelY():Number
        {
            return CModule.readFloat(ptr + OFFSET_NVEL + 4);
        }

        public function set nvelY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_NVEL + 4, value);
        }

        public function get nvelZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_NVEL + 8);
        }

        public function set nvelZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_NVEL + 8, value);
        }

        /** The actual velocity of the agent. Component x. [(x, y, z)] */
        public function get velX():Number
        {
            return CModule.readFloat(ptr + OFFSET_VEL);
        }

        public function set velX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_VEL, value);
        }

        /** The actual velocity of the agent. Component y. [(x, y, z)] */
        public function get velY():Number
        {
            return CModule.readFloat(ptr + OFFSET_VEL + 4);
        }

        public function set velY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_VEL + 4, value);
        }

        /** The actual velocity of the agent. Component z. [(x, y, z)] */
        public function get velZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_VEL + 8);
        }

        public function set velZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_VEL + 8, value);
        }

        /** The agent's configuration parameters. Getter. */
        public function getParams(resultParams:DTCrowdAgentParams = null):DTCrowdAgentParams
        {
            if (resultParams == null)
            {
                resultParams = new DTCrowdAgentParams();
            }
            resultParams.ptr = ptr + OFFSET_PARAMS;
            return resultParams;
        }

        /** The agent's configuration parameters. Setter. */
        public function setParams(value:DTCrowdAgentParams):void
        {
            copyBytes(value.ptr, ptr + OFFSET_PARAMS, DTCrowdAgentParams.SIZE);
        }

        /** The local path corridor corners for the agent. (Staight path.) Getter. [(x, y, z) * #ncorners] */
        public function getCornerVert(index:int):Number
        {
            return CModule.readFloat(ptr + OFFSET_CORNER_VERTS + 4 * index);
        }

        /** The local path corridor corners for the agent. (Staight path.) Setter. [(x, y, z) * #ncorners] */
        public function setCornerVert(index:int, value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_CORNER_VERTS + 4 * index, value);
        }

        /** The local path corridor corner flags. Getter. (See: #dtStraightPathFlags) [(flags) * #ncorners] */
        public function getCornerFlag(index:int):int
        {
            return CModule.read8(ptr + OFFSET_CORNER_FLAGS + 4 * index);
        }

        /** The local path corridor corner flags. Setter. (See: #dtStraightPathFlags) [(flags) * #ncorners] */
        public function setCornerFlag(index:int, value:int):void
        {
            CModule.write8(ptr + OFFSET_CORNER_FLAGS + 4 * index, value);
        }

        /** The reference id of the polygon being entered at the corner. Getter. [(polyRef) * #ncorners] */
        public function getCornerPoly(index:int):int
        {
            return CModule.read32(ptr + OFFSET_CORNER_POLYS + 4 * index);
        }

        /** The reference id of the polygon being entered at the corner. Setter. [(polyRef) * #ncorners] */
        public function setCornerPoly(index:int, value:int):void
        {
            CModule.write32(ptr + OFFSET_CORNER_POLYS + 4 * index, value);
        }

        /** The number of corners. */
        public function get ncorners():int
        {
            return CModule.read32(ptr + OFFSET_NCORNERS);
        }

        public function set ncorners(value:int):void
        {
            CModule.write32(ptr + OFFSET_NCORNERS, value);
        }

        /** State of the movement request. */
        public function get targetState():int
        {
            return CModule.read8(ptr + OFFSET_TARGET_STATE);
        }

        public function set targetState(value:int):void
        {
            CModule.write8(ptr + OFFSET_TARGET_STATE, value);
        }

        /** Target polyref of the movement request. */
        public function get targetRef():int
        {
            return CModule.read32(ptr + OFFSET_TARGET_REF);
        }

        public function set targetRef(value:int):void
        {
            CModule.write32(ptr + OFFSET_TARGET_REF, value);
        }

        /** Target position of the movement request (or velocity in case of DT_CROWDAGENT_TARGET_VELOCITY). Component x. */
        public function get targetPosX():Number
        {
            return CModule.readFloat(ptr + OFFSET_TARGET_POS);
        }

        public function set targetPosX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_TARGET_POS, value);
        }

        /** Target position of the movement request (or velocity in case of DT_CROWDAGENT_TARGET_VELOCITY). Component y. */
        public function get targetPosY():Number
        {
            return CModule.readFloat(ptr + OFFSET_TARGET_POS + 4);
        }

        public function set targetPosY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_TARGET_POS + 4, value);
        }

        /** Target position of the movement request (or velocity in case of DT_CROWDAGENT_TARGET_VELOCITY). Component z. */
        public function get targetPosZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_TARGET_POS + 8);
        }

        public function set targetPosZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_TARGET_POS + 8, value);
        }

        /** Path finder ref. */
        public function get targetPathqRef():int
        {
            return CModule.read32(ptr + OFFSET_TARGET_PATHQ_REF);
        }

        public function set targetPathqRef(value:int):void
        {
            CModule.write32(ptr + OFFSET_TARGET_PATHQ_REF, value);
        }

        /** Flag indicating that the current path is being replanned. */
        public function get targetReplan():Boolean
        {
            return CModule.read8(ptr + OFFSET_TARGET_REPLAN) != 0;
        }

        public function set targetReplan(value:Boolean):void
        {
            CModule.write8(ptr + OFFSET_TARGET_REPLAN, value ? 1 : 0);
        }

        /** Time since the agent's target was replanned. */
        public function get targetReplanTime():Number
        {
            return CModule.readFloat(ptr + OFFSET_TARGET_REPLAN_TIME);
        }

        public function set targetReplanTime(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_TARGET_REPLAN_TIME, value);
        }
    }
}