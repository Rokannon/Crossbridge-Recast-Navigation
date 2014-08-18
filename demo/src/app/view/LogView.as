package app.view
{
    import app.model.GUIModel;
    import app.rccontext.CustomRCContext;

    import feathers.controls.ScrollContainer;
    import feathers.controls.ScrollText;
    import feathers.layout.AnchorLayout;
    import feathers.layout.AnchorLayoutData;

    public class LogView extends ScrollContainer
    {
        public const scrollText:ScrollText = new ScrollText();

        private var _guiModel:GUIModel;
        private var _context:CustomRCContext;

        public function LogView()
        {
            super();
        }

        protected override function initialize():void
        {
            super.initialize();

            height = 200;
            width = 800;
            layout = new AnchorLayout();

            scrollText.layoutData = new AnchorLayoutData(10, 0, 10, 0);
            addChild(scrollText);
        }
    }
}