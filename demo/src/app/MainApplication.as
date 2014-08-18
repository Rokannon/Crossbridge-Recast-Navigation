package app
{
    import app.model.GUIModel;
    import app.model.SoloMesh;
    import app.rccontext.CustomRCContext;
    import app.view.GUIView;
    import app.view.GUIViewMediator;
    import app.view.LogViewMediator;
    import app.view.MeshViewMediator;
    import app.view.PropertiesViewMediator;
    import app.view.SceneView;
    import app.view.SceneViewMediator;
    import app.view.ToolsViewMediator;
    import app.view.tool.CrowdToolViewMediator;
    import app.view.tool.TesterToolViewMediator;

    import feathers.themes.MetalWorksMobileTheme;

    import flash.utils.getTimer;

    import starling.display.Sprite;
    import starling.events.Event;

    public class MainApplication extends Sprite
    {
        private var _soloMesh:SoloMesh;
        private var _prevTime:uint;

        public function MainApplication()
        {
            super();
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        private function onAddedToStage(event:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            addEventListener(Event.ENTER_FRAME, onEnterFrame);
            _prevTime = getTimer();

            var context:CustomRCContext = new CustomRCContext(true);
            context.alloc();

            _soloMesh = new SoloMesh();
            _soloMesh.connect(context);

            var sceneView:SceneView = new SceneView();
            addChild(sceneView);

            var guiModel:GUIModel = new GUIModel();

            new MetalWorksMobileTheme();
            var guiView:GUIView = new GUIView();
            addChild(guiView);

            (new GUIViewMediator()).connect(guiView, guiModel, _soloMesh);
            (new LogViewMediator()).connect(guiView.logView, guiModel, context);
            (new PropertiesViewMediator()).connect(guiView.propertiesView, guiModel, _soloMesh);
            (new ToolsViewMediator()).connect(guiView.toolsView, _soloMesh);

            (new SceneViewMediator()).connect(sceneView, _soloMesh);
            (new MeshViewMediator()).connect(sceneView.meshView, _soloMesh);
            (new TesterToolViewMediator()).connect(sceneView.toolView, _soloMesh);
            (new CrowdToolViewMediator()).connect(sceneView.toolView, _soloMesh);
        }

        private function onEnterFrame(event:Event):void
        {
            var currTime:uint = getTimer();
            var dt:Number = (currTime - _prevTime) / 1000;
            _prevTime = currTime;

            _soloMesh.handleUpdate(dt);
        }
    }
}