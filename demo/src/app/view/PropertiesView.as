package app.view
{
    import app.data.mesh.MeshInfoLibrary;
    import app.view.basic.LabeledSlider;

    import feathers.controls.Button;
    import feathers.controls.Check;
    import feathers.controls.Label;
    import feathers.controls.LayoutGroup;
    import feathers.controls.List;
    import feathers.controls.Panel;
    import feathers.controls.PickerList;
    import feathers.controls.Radio;
    import feathers.controls.ScrollContainer;
    import feathers.controls.renderers.DefaultListItemRenderer;
    import feathers.controls.renderers.IListItemRenderer;
    import feathers.core.ToggleGroup;
    import feathers.data.ListCollection;
    import feathers.layout.VerticalLayout;

    public class PropertiesView extends Panel
    {
        private static const SLIDER_ADD_WIDTH:int = 40;

        public const showLogCheck:Check = new Check();
        public const meshPickerList:PickerList = new PickerList();
        public const cellSizeSlider:LabeledSlider = new LabeledSlider();
        public const cellHeightSlider:LabeledSlider = new LabeledSlider();
        public const voxelsLabel:Label = new Label();
        public const agentHeightSlider:LabeledSlider = new LabeledSlider();
        public const agentRadiusSlider:LabeledSlider = new LabeledSlider();
        public const agentMaxClimbSlider:LabeledSlider = new LabeledSlider();
        public const agentMaxSlopeSlider:LabeledSlider = new LabeledSlider();
        public const partitioningToggleGroup:ToggleGroup = new ToggleGroup();
        public const maxEdgeLengthSlider:LabeledSlider = new LabeledSlider();
        public const maxEdgeErrorSlider:LabeledSlider = new LabeledSlider();
        public const vertsPerPolySlider:LabeledSlider = new LabeledSlider();
        public const detailSampleDistSlider:LabeledSlider = new LabeledSlider();
        public const detailSampleMaxErrorSlider:LabeledSlider = new LabeledSlider();
        public const buildTimeLabel:Label = new Label();
        public const buildButton:Button = new Button();

        public function PropertiesView()
        {
            super();
        }

        protected override function initialize():void
        {
            super.initialize();

            var vl:VerticalLayout;
            var label:Label;
            var radio:Radio;
            var layoutGroup:LayoutGroup;

            width = GUIView.SIDEBAR_WIDTH;
            headerProperties.title = "Properties";
            var scrollContainer:ScrollContainer = new ScrollContainer();
            vl = new VerticalLayout();
            vl.gap = GUIView.SIDEBAR_GAP;
            vl.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_LEFT;
            scrollContainer.layout = vl;
            addChild(scrollContainer);

            showLogCheck.label = "Show Log";
            scrollContainer.addChild(showLogCheck);

            // Input Mesh
            layoutGroup = new LayoutGroup();
            layoutGroup.layout = new VerticalLayout();
            scrollContainer.addChild(layoutGroup);

            label = new Label();
            label.text = "Input Mesh";
            layoutGroup.addChild(label);

            var items:Array = new Array();
            var length:int = MeshInfoLibrary.instance.meshes.length;
            for (var i:int = 0; i < length; ++i)
            {
                items.push({
                               text: MeshInfoLibrary.instance.meshes[i].name
                           });
            }

            meshPickerList.dataProvider = new ListCollection(items);
            meshPickerList.labelField = "text";
            meshPickerList.prompt = "Choose Mesh...";
            meshPickerList.selectedIndex = -1;
            meshPickerList.typicalItem = "Choose Mesh...";
            meshPickerList.listFactory = function ():List
            {
                var list:List = new List();
                list.typicalItem = { text: "dungeon.obj" };
                list.itemRendererFactory = function ():IListItemRenderer
                {
                    var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
                    renderer.labelField = "text";
                    return renderer;
                };
                return list;
            }
            layoutGroup.addChild(meshPickerList);

            // Rasterization
            layoutGroup = new LayoutGroup();
            layoutGroup.layout = new VerticalLayout();
            scrollContainer.addChild(layoutGroup);

            label = new Label();
            label.text = "Rasterization";
            layoutGroup.addChild(label);

            cellSizeSlider.title.text = "Cell Size";
            cellSizeSlider.slider.minimum = 0.1;
            cellSizeSlider.slider.maximum = 1.0;
            cellSizeSlider.slider.step = 0.01;
            cellSizeSlider.slider.validate();
            cellSizeSlider.slider.width += SLIDER_ADD_WIDTH;
            layoutGroup.addChild(cellSizeSlider);

            cellHeightSlider.title.text = "Cell Height";
            cellHeightSlider.slider.minimum = 0.1;
            cellHeightSlider.slider.maximum = 1.0;
            cellHeightSlider.slider.step = 0.01;
            cellHeightSlider.slider.validate();
            cellHeightSlider.slider.width += SLIDER_ADD_WIDTH;
            layoutGroup.addChild(cellHeightSlider);

            layoutGroup.addChild(voxelsLabel);

            // Agent
            layoutGroup = new LayoutGroup();
            layoutGroup.layout = new VerticalLayout();
            scrollContainer.addChild(layoutGroup);

            label = new Label();
            label.text = "Agent";
            layoutGroup.addChild(label);

            agentHeightSlider.title.text = "Height";
            agentHeightSlider.slider.minimum = 0.1;
            agentHeightSlider.slider.maximum = 5.0;
            agentHeightSlider.slider.step = 0.1;
            agentHeightSlider.slider.validate();
            agentHeightSlider.slider.width += SLIDER_ADD_WIDTH;
            layoutGroup.addChild(agentHeightSlider);

            agentRadiusSlider.title.text = "Radius";
            agentRadiusSlider.slider.minimum = 0.0;
            agentRadiusSlider.slider.maximum = 5.0;
            agentRadiusSlider.slider.step = 0.1;
            agentRadiusSlider.slider.validate();
            agentRadiusSlider.slider.width += SLIDER_ADD_WIDTH;
            layoutGroup.addChild(agentRadiusSlider);

            agentMaxClimbSlider.title.text = "Max Climb";
            agentMaxClimbSlider.slider.minimum = 0.1;
            agentMaxClimbSlider.slider.maximum = 5.0;
            agentMaxClimbSlider.slider.step = 0.1;
            agentMaxClimbSlider.slider.validate();
            agentMaxClimbSlider.slider.width += SLIDER_ADD_WIDTH;
            layoutGroup.addChild(agentMaxClimbSlider);

            agentMaxSlopeSlider.title.text = "Max Slope";
            agentMaxSlopeSlider.slider.minimum = 0.0
            agentMaxSlopeSlider.slider.maximum = 90.0;
            agentMaxSlopeSlider.slider.step = 1.0;
            agentMaxSlopeSlider.slider.validate();
            agentMaxSlopeSlider.slider.width += SLIDER_ADD_WIDTH;
            layoutGroup.addChild(agentMaxSlopeSlider);

            // Partitioning
            layoutGroup = new LayoutGroup();
            vl = new VerticalLayout();
            vl.gap = GUIView.TOGGLE_GROUP_GAP;
            layoutGroup.layout = vl;
            scrollContainer.addChild(layoutGroup);

            label = new Label();
            label.text = "Partitioning";
            layoutGroup.addChild(label);

            radio = new Radio();
            radio.label = "Watershed";
            partitioningToggleGroup.addItem(radio);
            layoutGroup.addChild(radio);
            radio = new Radio();
            radio.label = "Monotone";
            partitioningToggleGroup.addItem(radio);
            layoutGroup.addChild(radio);
            radio = new Radio();
            radio.label = "Layers";
            partitioningToggleGroup.addItem(radio);
            layoutGroup.addChild(radio);

            // Polygonization
            layoutGroup = new LayoutGroup();
            layoutGroup.layout = new VerticalLayout();
            scrollContainer.addChild(layoutGroup);

            label = new Label();
            label.text = "Polygonization";
            layoutGroup.addChild(label);

            maxEdgeLengthSlider.title.text = "Max Edge Length";
            maxEdgeLengthSlider.slider.minimum = 0.0
            maxEdgeLengthSlider.slider.maximum = 50.0;
            maxEdgeLengthSlider.slider.step = 1.0;
            maxEdgeLengthSlider.slider.validate();
            maxEdgeLengthSlider.slider.width += SLIDER_ADD_WIDTH;
            layoutGroup.addChild(maxEdgeLengthSlider);

            maxEdgeErrorSlider.title.text = "Max Edge Error";
            maxEdgeErrorSlider.slider.minimum = 0.1
            maxEdgeErrorSlider.slider.maximum = 3.0;
            maxEdgeErrorSlider.slider.step = 0.1;
            maxEdgeErrorSlider.slider.validate();
            maxEdgeErrorSlider.slider.width += SLIDER_ADD_WIDTH;
            layoutGroup.addChild(maxEdgeErrorSlider);

            vertsPerPolySlider.title.text = "Verts Per Poly";
            vertsPerPolySlider.slider.minimum = 3.0
            vertsPerPolySlider.slider.maximum = 12.0;
            vertsPerPolySlider.slider.step = 1.0;
            vertsPerPolySlider.slider.validate();
            vertsPerPolySlider.slider.width += SLIDER_ADD_WIDTH;
            layoutGroup.addChild(vertsPerPolySlider);

            // Detail Mesh
            layoutGroup = new LayoutGroup();
            layoutGroup.layout = new VerticalLayout();
            scrollContainer.addChild(layoutGroup);

            label = new Label();
            label.text = "Detail Mesh";
            layoutGroup.addChild(label);

            detailSampleDistSlider.title.text = "Sample Distance";
            detailSampleDistSlider.slider.minimum = 0.0
            detailSampleDistSlider.slider.maximum = 16.0;
            detailSampleDistSlider.slider.step = 1.0;
            detailSampleDistSlider.slider.validate();
            detailSampleDistSlider.slider.width += SLIDER_ADD_WIDTH;
            layoutGroup.addChild(detailSampleDistSlider);

            detailSampleMaxErrorSlider.title.text = "Max Sample Error";
            detailSampleMaxErrorSlider.slider.minimum = 0.0
            detailSampleMaxErrorSlider.slider.maximum = 16.0;
            detailSampleMaxErrorSlider.slider.step = 1.0;
            detailSampleMaxErrorSlider.slider.validate();
            detailSampleMaxErrorSlider.slider.width += SLIDER_ADD_WIDTH;
            layoutGroup.addChild(detailSampleMaxErrorSlider);

            // Build Time
            layoutGroup = new LayoutGroup();
            layoutGroup.layout = new VerticalLayout();
            scrollContainer.addChild(layoutGroup);

            layoutGroup.addChild(buildTimeLabel);

            // Build Button
            layoutGroup = new LayoutGroup();
            layoutGroup.layout = new VerticalLayout();
            scrollContainer.addChild(layoutGroup);

            buildButton.label = "Build";
            layoutGroup.addChild(buildButton);
        }
    }
}