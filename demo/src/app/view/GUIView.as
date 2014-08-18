package app.view
{
    import feathers.controls.Label;
    import feathers.controls.Screen;
    import feathers.layout.AnchorLayout;
    import feathers.layout.AnchorLayoutData;

    public class GUIView extends Screen
    {
        public static const SIDEBAR_PADDING:Number = 7;
        public static const SIDEBAR_WIDTH:Number = 200;
        public static const SIDEBAR_GAP:Number = 15;
        public static const TOGGLE_GROUP_GAP:Number = 10;

        public const propertiesView:PropertiesView = new PropertiesView();
        public const logView:LogView = new LogView();
        public const toolsView:ToolsView = new ToolsView();
        public const toolCaptionLabel:Label = new Label();

        private var _propertiesViewLayoutData:AnchorLayoutData;
        private var _logViewLayoutData:AnchorLayoutData;

        public function GUIView()
        {
            super();
        }

        protected override function initialize():void
        {
            super.initialize();

            width = stage.stageWidth;
            height = stage.stageHeight;
            layout = new AnchorLayout();

            var ald:AnchorLayoutData;

            ald = new AnchorLayoutData();
            ald.top = SIDEBAR_PADDING;
            ald.bottom = SIDEBAR_PADDING;
            ald.right = SIDEBAR_PADDING;
            propertiesView.layoutData = ald;
            addChild(propertiesView);

            ald = new AnchorLayoutData();
            ald.bottom = SIDEBAR_PADDING;
            ald.horizontalCenter = 0;
            logView.layoutData = ald;
            addChild(logView);

            ald = new AnchorLayoutData();
            ald.top = SIDEBAR_PADDING;
            ald.bottom = SIDEBAR_PADDING;
            ald.left = SIDEBAR_PADDING;
            toolsView.layoutData = ald;
            addChild(toolsView);

            ald = new AnchorLayoutData();
            ald.top = SIDEBAR_PADDING;
            ald.left = SIDEBAR_PADDING + toolsView.width;
            toolCaptionLabel.layoutData = ald;
            addChild(toolCaptionLabel);
        }

        public function hideLog():void
        {
            removeChild(logView);
        }

        public function showLog():void
        {
            addChild(logView);
        }
    }
}