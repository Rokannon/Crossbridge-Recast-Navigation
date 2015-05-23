package app.view
{
    import app.model.GUIModel;
    import app.model.GUIModelEvent;
    import app.model.SoloMesh;
    import app.model.SoloMeshEvent;
    import app.model.enum.ToolType;

    import feathers.controls.Alert;
    import feathers.data.ListCollection;

    import flash.events.Event;

    public class GUIViewMediator
    {
        private var _guiView:GUIView;
        private var _guiModel:GUIModel;
        private var _soloMesh:SoloMesh;

        public function GUIViewMediator()
        {
        }

        public function connect(guiView:GUIView, guiModel:GUIModel, soloMesh:SoloMesh):void
        {
            _guiView = guiView;
            _guiModel = guiModel;
            _guiModel.addEventListener(GUIModelEvent.TOGGLE_SHOW_LOG, onToggleShowLog);
            _soloMesh = soloMesh;
            _soloMesh.addEventListener(SoloMeshEvent.NO_MESH_SELECTED, onNoMeshSelected);
            _soloMesh.addEventListener(SoloMeshEvent.MESH_IS_NOT_BUILT, onMeshIsNotBuilt);
            _soloMesh.addEventListener(SoloMeshEvent.NO_TOOL_SELECTED, onNoToolSelected);
            _soloMesh.addEventListener(SoloMeshEvent.TOOL_CHANGED, onToolChanged);
            updateLog();
        }

        private function onToolChanged(event:SoloMeshEvent):void
        {
            if (_soloMesh.currentToolType == ToolType.TOOL_TESTER)
                _guiView.toolCaptionLabel.text = "Click/SHIFT+Click to set Start/End points.";
            else
                _guiView.toolCaptionLabel.text = "";
        }

        private function onNoToolSelected(event:SoloMeshEvent):void
        {
            var buttons:ListCollection = new ListCollection([
                                                                {
                                                                    label: "OK"
                                                                }
                                                            ]);
            Alert.show("No tool selected.", "Alert", buttons);
        }

        private function onMeshIsNotBuilt(event:SoloMeshEvent):void
        {
            var buttons:ListCollection = new ListCollection([
                                                                {
                                                                    label: "OK"
                                                                }
                                                            ]);
            Alert.show("Mesh is not built.", "Alert", buttons);
        }

        private function onNoMeshSelected(event:SoloMeshEvent):void
        {
            var buttons:ListCollection = new ListCollection([
                                                                {
                                                                    label: "OK"
                                                                }
                                                            ]);
            Alert.show("No mesh selected.", "Alert", buttons);
        }

        private function onToggleShowLog(event:Event):void
        {
            updateLog();
        }

        private function updateLog():void
        {
            if (_guiModel.showLog)
                _guiView.showLog();
            else
                _guiView.hideLog();
        }
    }
}