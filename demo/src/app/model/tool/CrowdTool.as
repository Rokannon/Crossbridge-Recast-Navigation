package app.model.tool
{
    import app.model.tool.enum.CrowdToolState;

    import flash.geom.Point;

    import recastnavigation.detour.crowd.DTCrowd;
    import recastnavigation.detour.crowd.DTCrowdAgent;
    import recastnavigation.detour.crowd.DTCrowdAgentDebugInfo;
    import recastnavigation.detour.crowd.DTCrowdAgentParams;
    import recastnavigation.detour.crowd.DTObstacleAvoidanceParams;

    public class CrowdTool extends MeshTool
    {
        public const crowd:DTCrowd = new DTCrowd();
        public const targetPoint:Point = new Point();

        private var _targetRef:int;

        private const _debug:DTCrowdAgentDebugInfo = new DTCrowdAgentDebugInfo();

        public function CrowdTool()
        {
            super();
            _toolState = CrowdToolState.CREATE;
            crowd.alloc();
            _debug.alloc();
        }

        override public function wake():void
        {
            super.wake();
            crowd.init(128, _soloMesh.agentRadius, _soloMesh.navMesh);
            var params:DTObstacleAvoidanceParams = new DTObstacleAvoidanceParams();

            // Low (11)
            crowd.getObstacleAvoidanceParams(0, params);
            params.velBias = 0.5;
            params.adaptiveDivs = 5;
            params.adaptiveRings = 2;
            params.adaptiveDepth = 1;

            // Medium (22)
            crowd.getObstacleAvoidanceParams(1, params);
            params.velBias = 0.5;
            params.adaptiveDivs = 5;
            params.adaptiveRings = 2;
            params.adaptiveDepth = 2;

            // Good (45)
            crowd.getObstacleAvoidanceParams(2, params);
            params.velBias = 0.5;
            params.adaptiveDivs = 7;
            params.adaptiveRings = 2;
            params.adaptiveDepth = 3;

            // High (66)
            crowd.getObstacleAvoidanceParams(3, params);
            params.velBias = 0.5;
            params.adaptiveDivs = 7;
            params.adaptiveRings = 3;
            params.adaptiveDepth = 3;

            updateTarget();
        }

        private function updateTarget():void
        {
            _soloMesh.query.findNearestPoly(targetPoint.x, 0, targetPoint.y, 2, 4, 2, _soloMesh.filter);
            targetPoint.setTo(_soloMesh.query.nearestPtX, _soloMesh.query.nearestPtZ);
            _targetRef = _soloMesh.query.nearestRef;
            for (var i:int = crowd.getAgentCount() - 1; i >= 0; --i)
            {
                var agent:DTCrowdAgent = crowd.getAgent(i);
                if (agent.active)
                    crowd.requestMoveTarget(i, _targetRef, targetPoint.x, 0, targetPoint.y);
            }
        }

        override public function handleClick(x:Number, y:Number, shift:Boolean):void
        {
            super.handleClick(x, y, shift);
            if (_toolState == CrowdToolState.CREATE)
            {
                var ap:DTCrowdAgentParams = new DTCrowdAgentParams();
                ap.alloc();
                ap.radius = _soloMesh.agentRadius;
                ap.height = _soloMesh.agentHeight;
                ap.maxAcceleration = 8.0;
                ap.maxSpeed = 3.5;
                ap.collisionQueryRange = ap.radius * 12.0;
                ap.pathOptimizationRange = ap.radius * 30.0;
//                ap.updateFlags = DTCrowdUpdateFlags.DT_CROWD_ANTICIPATE_TURNS;
                ap.updateFlags = ~0;
                ap.obstacleAvoidanceType = 3;
                ap.separationWeight = 2.0;

                var idx:int = crowd.addAgent(x, 0.1, y, ap);
                if (idx == -1)
                    trace("Add Agent Error");
                else
//                    crowd.requestMoveTarget(idx, _targetRef, targetPoint.x, 0, targetPoint.y);

                updateTarget();
                ap.free();
            }
            else if (_toolState == CrowdToolState.MOVE)
            {
                targetPoint.setTo(x, y);
                updateTarget();
            }
        }

        override public function handleUpdate(dt:Number):void
        {
            dt *= 5;
            super.handleUpdate(dt);
            crowd.update(dt, _debug);
            dispatchEvent(new MeshToolEvent(MeshToolEvent.RENDER));
        }
    }
}