package app.view
{
    import app.view.basic.SimpleToggleGroup;

    import feathers.controls.Panel;
    import feathers.controls.ScrollContainer;
    import feathers.layout.VerticalLayout;

    import starling.events.Event;

    public class ToolsView extends Panel
    {
        public const toolSelectToggleGroup:SimpleToggleGroup = new SimpleToggleGroup(new <String>["Test NavMesh", "Create Crowds"]);
        public const toolStateToggleGroups:Vector.<SimpleToggleGroup> = new <SimpleToggleGroup>[
            new SimpleToggleGroup(new <String>["Pathfind Straight", "Pathfind Sliced"],
                                  "Tool States"), new SimpleToggleGroup(new <String>["Create Agents", "Move Target"],
                                                                        "Tool States")
        ];

        private const _scrollContainer:ScrollContainer = new ScrollContainer();

        public function ToolsView()
        {
            super();
        }

        protected override function initialize():void
        {
            super.initialize();
            width = GUIView.SIDEBAR_WIDTH;
            headerProperties.title = "Tools";
            var vl:VerticalLayout = new VerticalLayout();
            vl.gap = GUIView.SIDEBAR_GAP;
            vl.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_LEFT;
            _scrollContainer.layout = vl;
            addChild(_scrollContainer);

            _scrollContainer.addChild(toolSelectToggleGroup);
            toolSelectToggleGroup.toggleGroup.selectedIndex = -1;
            updateToolStatesToggleGroup();
            toolSelectToggleGroup.toggleGroup.addEventListener(Event.CHANGE, toolSelectToggleGroup_changeHandler);
        }

        private function toolSelectToggleGroup_changeHandler(event:Event):void
        {
            updateToolStatesToggleGroup();
        }

        private function updateToolStatesToggleGroup():void
        {
            for (var i:int = 0; i < toolStateToggleGroups.length; ++i)
            {
                if (i == toolSelectToggleGroup.toggleGroup.selectedIndex)
                {
                    _scrollContainer.addChild(toolStateToggleGroups[i]);
                    toolStateToggleGroups[i].toggleGroup.addEventListener(Event.CHANGE,
                                                                          toolStateToggleGroup_changeHandler);
                }
                else
                {
                    _scrollContainer.removeChild(toolStateToggleGroups[i]);
                    toolStateToggleGroups[i].toggleGroup.removeEventListener(Event.CHANGE,
                                                                             toolStateToggleGroup_changeHandler);
                }
            }
        }

        private function toolStateToggleGroup_changeHandler(event:Event):void
        {
            dispatchEventWith(Event.CHANGE);
        }
    }
}