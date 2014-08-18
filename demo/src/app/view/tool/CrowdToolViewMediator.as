package app.view.tool
{
    import app.data.ColorData;
    import app.model.SoloMesh;
    import app.model.enum.ToolType;
    import app.model.tool.CrowdTool;
    import app.model.tool.MeshToolEvent;

    import flash.geom.Point;
    import flash.utils.Dictionary;

    import recastnavigation.detour.crowd.DTCrowdAgent;
    import recastnavigation.detour.crowd.DTCrowdAgentParams;

    import starling.display.Shape;
    import starling.display.Sprite;

    public class CrowdToolViewMediator
    {
        private static const TARGET_POINT_RADIUS:Number = 7;
        private static const TARGET_POINT_COLOR:ColorData = new ColorData(0xFF, 0, 0, 0xFF);
        private static const HELPER_POINT:Point = new Point();
        private static const AGENT_RADIUS:Number = 7;
        private static const AGENT_COLOR:ColorData = new ColorData(0, 0xFF, 0, 0xFF);
        private static const HELPER_PARAMS:DTCrowdAgentParams = new DTCrowdAgentParams();

        private const _targetPointView:Shape = new Shape();
        private const _agentViewByIdx:Dictionary = new Dictionary();

        private var _toolView:Sprite;
        private var _soloMesh:SoloMesh;
        private var _meshTool:CrowdTool;

        public function CrowdToolViewMediator()
        {
            drawCircle(_targetPointView, TARGET_POINT_RADIUS, TARGET_POINT_COLOR);
        }

        public function connect(toolView:Sprite, soloMesh:SoloMesh):void
        {
            _toolView = toolView;
            _soloMesh = soloMesh;
            _meshTool = _soloMesh.meshTools[ToolType.TOOL_CROWD] as CrowdTool;
            _meshTool.addEventListener(MeshToolEvent.WAKE, onWake);
            _meshTool.addEventListener(MeshToolEvent.SLEEP, onSleep);
            _meshTool.addEventListener(MeshToolEvent.RENDER, onRender);
        }

        private function onRender(event:MeshToolEvent):void
        {
            render();
        }

        private function onSleep(event:MeshToolEvent):void
        {
            _toolView.removeChild(_targetPointView);
            for (var i:int = _meshTool.crowd.getAgentCount() - 1; i >= 0; --i)
            {
                if (i in _agentViewByIdx)
                {
                    var agentShape:Shape = _agentViewByIdx[i];
                    agentShape.graphics.clear();
                    _toolView.removeChild(agentShape);
                    delete _agentViewByIdx[i];
                }
            }
        }

        private function onWake(event:MeshToolEvent):void
        {
            _toolView.addChild(_targetPointView);
            render();
        }

        private function render():void
        {
            var i:int;
            var agentView:Shape;

            _soloMesh.coordSpace.modelToScene(_meshTool.targetPoint, HELPER_POINT);
            _targetPointView.x = HELPER_POINT.x;
            _targetPointView.y = HELPER_POINT.y;

            for (i = 0; i < _meshTool.crowd.getAgentCount(); ++i)
            {
                var agent:DTCrowdAgent = _meshTool.crowd.getAgent(i);
                if (agent.active)
                {
                    if (!(i in _agentViewByIdx))
                    {
                        agentView = new Shape();
                        drawCircle(agentView, AGENT_RADIUS, AGENT_COLOR);
                        _toolView.addChild(agentView);
                        _agentViewByIdx[i] = agentView;
                    }
                    agentView = _agentViewByIdx[i];
                    HELPER_POINT.setTo(agent.nposX, agent.nposZ);
                    _soloMesh.coordSpace.modelToScene(HELPER_POINT, HELPER_POINT);
                    agentView.x = HELPER_POINT.x;
                    agentView.y = HELPER_POINT.y;
                    agent.getParams(HELPER_PARAMS);
                    !1;
                }
                else
                {
                    if (i in _agentViewByIdx)
                    {
                        agentView = _agentViewByIdx[i];
                        agentView.graphics.clear();
                        delete _agentViewByIdx[i];
                        _toolView.removeChild(agentView);
                    }
                }
            }
        }

        private function drawCircle(shape:Shape, radius:Number, color:ColorData):void
        {
            shape.graphics.clear();
            shape.graphics.beginFill(color.getFlashColor(), color.getFlashAlpha());
            shape.graphics.drawCircle(0, 0, radius);
            shape.graphics.endFill();
        }
    }
}
