package app.view
{
    import app.model.SoloMesh;
    import app.view.basic.SimpleToggleGroup;

    import feathers.events.FeathersEventType;

    import flash.utils.Dictionary;

    import starling.events.Event;

    public class ToolsViewMediator
    {
        private var _toolsView:ToolsView;
        private var _soloMesh:SoloMesh;

        private const _toolStateByToggleGroup:Dictionary = new Dictionary();

        public function ToolsViewMediator()
        {
        }

        public function connect(toolsView:ToolsView, soloMesh:SoloMesh):void
        {
            _toolsView = toolsView;
            _soloMesh = soloMesh;
            _toolsView.toolSelectToggleGroup.toggleGroup.selectedIndex = _soloMesh.currentToolType;
            _toolsView.toolSelectToggleGroup.toggleGroup.addEventListener(Event.CHANGE, onToolChanged);
            for (var i:int = 0; i < _toolsView.toolStateToggleGroups.length; ++i)
            {
                if (_toolsView.toolStateToggleGroups[i].isInitialized)
                    initToolStateToggleGroup(_toolsView.toolStateToggleGroups[i]);
                else
                {
                    _toolsView.toolStateToggleGroups[i].addEventListener(FeathersEventType.INITIALIZE,
                                                                         toolStateToggleGroups_initializeHandler);
                }
                _toolsView.toolStateToggleGroups[i].toggleGroup.addEventListener(Event.CHANGE,
                                                                                 toolStateToggleGroups_changeHandler);
                _toolStateByToggleGroup[_toolsView.toolStateToggleGroups[i].toggleGroup] = _toolsView.toolStateToggleGroups[i];
            }
        }

        private function toolStateToggleGroups_changeHandler(event:Event):void
        {
            var toolStateToggleGroup:SimpleToggleGroup = _toolStateByToggleGroup[event.target];
            var index:int = _toolsView.toolStateToggleGroups.indexOf(toolStateToggleGroup);
            var toolState:int = _toolsView.toolStateToggleGroups[index].toggleGroup.selectedIndex;
            _soloMesh.meshTools[index].setToolState(toolState);
        }

        private function toolStateToggleGroups_initializeHandler(event:Event):void
        {
            initToolStateToggleGroup(event.target as SimpleToggleGroup);
        }

        private function onToolChanged(event:Event):void
        {
            _soloMesh.setCurrentToolType(_toolsView.toolSelectToggleGroup.toggleGroup.selectedIndex);
        }

        private function initToolStateToggleGroup(toolStateToggleGroup:SimpleToggleGroup):void
        {
            var index:int = _toolsView.toolStateToggleGroups.indexOf(toolStateToggleGroup);
            toolStateToggleGroup.toggleGroup.selectedIndex = _soloMesh.meshTools[index].toolState;
        }
    }
}