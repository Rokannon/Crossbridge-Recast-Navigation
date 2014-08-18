package app.view
{
    import app.data.mesh.MeshInfo;
    import app.data.mesh.MeshInfoLibrary;
    import app.model.GUIModel;
    import app.model.GUIModelEvent;
    import app.model.SoloMesh;
    import app.model.SoloMeshEvent;

    import recastnavigation.recast.RCConfig;

    import starling.animation.Tween;
    import starling.core.Starling;
    import starling.events.Event;

    public class PropertiesViewMediator
    {
        private static const HELPER_CONFIG:RCConfig = new RCConfig();
        HELPER_CONFIG.alloc();

        private var _guiModel:GUIModel;
        private var _soloMesh:SoloMesh;
        private var _propertiesView:PropertiesView;
        private var _firstBuild:Boolean = true;

        public function PropertiesViewMediator()
        {
        }

        public function connect(propertiesView:PropertiesView, guiModel:GUIModel, soloMesh:SoloMesh):void
        {
            _guiModel = guiModel;
            _guiModel.addEventListener(GUIModelEvent.TOGGLE_SHOW_LOG, onToggleShowLog);

            _soloMesh = soloMesh;
            _soloMesh.addEventListener(SoloMeshEvent.BUILD_COMPLETE, onSoloMeshBuildComplete);

            _propertiesView = propertiesView;
            _propertiesView.showLogCheck.isSelected = _guiModel.showLog;
            _propertiesView.showLogCheck.addEventListener(Event.CHANGE, showLogCheck_changeHandler);
            _propertiesView.meshPickerList.addEventListener(Event.CHANGE, meshPickerList_changeHandler);
            _propertiesView.cellSizeSlider.slider.value = _soloMesh.cellSize;
            _propertiesView.cellSizeSlider.slider.addEventListener(Event.CHANGE, cellSizeSlider_changeHandler);
            _propertiesView.cellHeightSlider.slider.value = _soloMesh.cellHeight;
            _propertiesView.cellHeightSlider.slider.addEventListener(Event.CHANGE, cellHeightSlider_changeHandler);
            _propertiesView.agentHeightSlider.slider.value = _soloMesh.agentHeight;
            _propertiesView.agentHeightSlider.slider.addEventListener(Event.CHANGE, agentHeightSlider_changeHandler);
            _propertiesView.agentRadiusSlider.slider.value = _soloMesh.agentRadius;
            _propertiesView.agentRadiusSlider.slider.addEventListener(Event.CHANGE, agentRadiusSlider_changeHandler);
            _propertiesView.agentMaxClimbSlider.slider.value = _soloMesh.agentMaxClimb;
            _propertiesView.agentMaxClimbSlider.slider.addEventListener(Event.CHANGE,
                                                                        agentMaxClimbSlider_changeHandler);
            _propertiesView.agentMaxSlopeSlider.slider.value = _soloMesh.agentMaxSlope;
            _propertiesView.agentMaxSlopeSlider.slider.addEventListener(Event.CHANGE,
                                                                        agentMaxSlopeSlider_changeHandler);
            _propertiesView.partitioningToggleGroup.addEventListener(Event.CHANGE,
                                                                     partitioningToggleGroup_changeHandler);
            _propertiesView.maxEdgeLengthSlider.slider.value = _soloMesh.edgeMaxLen;
            _propertiesView.maxEdgeLengthSlider.slider.addEventListener(Event.CHANGE,
                                                                        maxEdgeLengthSlider_changeHandler);
            _propertiesView.maxEdgeErrorSlider.slider.value = _soloMesh.edgeMaxError;
            _propertiesView.maxEdgeErrorSlider.slider.addEventListener(Event.CHANGE, maxEdgeError_changeHandler);
            _propertiesView.vertsPerPolySlider.slider.value = _soloMesh.vertsPerPoly;
            _propertiesView.vertsPerPolySlider.slider.addEventListener(Event.CHANGE, vertsPerPoly_changeHandler);
            _propertiesView.detailSampleDistSlider.slider.value = _soloMesh.detailSampleDist;
            _propertiesView.detailSampleDistSlider.slider.addEventListener(Event.CHANGE,
                                                                           detailSampleDistSlider_changeHandler);
            _propertiesView.detailSampleMaxErrorSlider.slider.value = _soloMesh.detailSampleMaxError;
            _propertiesView.detailSampleMaxErrorSlider.slider.addEventListener(Event.CHANGE,
                                                                               detailSampleMaxErrorSlider_changeHandler);
            _propertiesView.buildButton.addEventListener(Event.TRIGGERED, buildButton_triggeredHandler);

            updateVoxelsLabel();
            updateBuildTime();
            updateButtonEnabled();
        }

        private function showLogCheck_changeHandler(event:Event):void
        {
            _guiModel.showLog = _propertiesView.showLogCheck.isSelected;
        }

        private function meshPickerList_changeHandler(event:Event):void
        {
            updateVoxelsLabel();
            updateButtonEnabled();
            if (_propertiesView.meshPickerList.selectedIndex != -1)
            {
                var meshInfo:MeshInfo = MeshInfoLibrary.instance.meshes[_propertiesView.meshPickerList.selectedIndex];
                _soloMesh.setMesh(meshInfo);
            }
            if (_firstBuild)
            {
                _propertiesView.scrollToPosition(0, _propertiesView.maxVerticalScrollPosition, 0.5);
                Starling.current.juggler.removeTweens(_propertiesView.buildButton);
                _propertiesView.buildButton.alpha = 1.0;
                var tween:Tween = new Tween(_propertiesView.buildButton, 0.5);
                tween.animate("alpha", 0.5)
                tween.reverse = true;
                tween.repeatCount = 0;
                Starling.current.juggler.add(tween);
            }
        }

        private function cellSizeSlider_changeHandler(event:Event):void
        {
            _soloMesh.cellSize = _propertiesView.cellSizeSlider.slider.value;
            updateVoxelsLabel();
        }

        private function cellHeightSlider_changeHandler(event:Event):void
        {
            _soloMesh.cellHeight = _propertiesView.cellHeightSlider.slider.value;
        }

        private function agentHeightSlider_changeHandler(event:Event):void
        {
            _soloMesh.agentHeight = _propertiesView.agentHeightSlider.slider.value;
        }

        private function agentRadiusSlider_changeHandler(event:Event):void
        {
            _soloMesh.agentRadius = _propertiesView.agentRadiusSlider.slider.value;
        }

        private function agentMaxClimbSlider_changeHandler(event:Event):void
        {
            _soloMesh.agentMaxClimb = _propertiesView.agentMaxClimbSlider.slider.value;
        }

        private function agentMaxSlopeSlider_changeHandler(event:Event):void
        {
            _soloMesh.agentMaxSlope = _propertiesView.agentMaxSlopeSlider.slider.value;
        }

        private function partitioningToggleGroup_changeHandler(event:Event):void
        {
            _soloMesh.partitionType = _propertiesView.partitioningToggleGroup.selectedIndex;
        }

        private function maxEdgeLengthSlider_changeHandler(event:Event):void
        {
            _soloMesh.edgeMaxLen = _propertiesView.maxEdgeLengthSlider.slider.value;
        }

        private function maxEdgeError_changeHandler(event:Event):void
        {
            _soloMesh.edgeMaxError = _propertiesView.maxEdgeErrorSlider.slider.value;
        }

        private function vertsPerPoly_changeHandler(event:Event):void
        {
            _soloMesh.vertsPerPoly = _propertiesView.vertsPerPolySlider.slider.value;
        }

        private function detailSampleDistSlider_changeHandler(event:Event):void
        {
            _soloMesh.detailSampleDist = _propertiesView.detailSampleDistSlider.slider.value;
        }

        private function detailSampleMaxErrorSlider_changeHandler(event:Event):void
        {
            _soloMesh.detailSampleMaxError = _propertiesView.detailSampleMaxErrorSlider.slider.value;
        }

        private function buildButton_triggeredHandler():void
        {
            if (_propertiesView.meshPickerList.selectedIndex != -1)
            {
                _soloMesh.build();
                if (_firstBuild)
                {
                    _firstBuild = false;
                    Starling.current.juggler.removeTweens(_propertiesView.buildButton);
                    _propertiesView.buildButton.alpha = 1.0;
                }
            }
        }

        private function onToggleShowLog(event:GUIModelEvent):void
        {
            _propertiesView.showLogCheck.isSelected = _guiModel.showLog;
        }

        private function onSoloMeshBuildComplete(event:SoloMeshEvent):void
        {
            updateBuildTime();
        }

        private function updateBuildTime():void
        {
            var time:String = _soloMesh.totalBuildTimeMs == 0 ? "none" : _soloMesh.totalBuildTimeMs + "ms";
            _propertiesView.buildTimeLabel.text = "Build Time: " + time;
        }

        private function updateButtonEnabled():void
        {
            _propertiesView.buildButton.isEnabled = _propertiesView.meshPickerList.selectedIndex != -1;
        }

        private function updateVoxelsLabel():void
        {
            if (_propertiesView.meshPickerList.selectedIndex == -1)
            {
                _propertiesView.voxelsLabel.text = " ";
            }
            else
            {
                var meshInfo:MeshInfo = MeshInfoLibrary.instance.meshes[_propertiesView.meshPickerList.selectedIndex];
                HELPER_CONFIG.cs = _soloMesh.cellSize;
                HELPER_CONFIG.rcCalcBounds(meshInfo.verts);
                HELPER_CONFIG.rcCalcGridSize();
                _propertiesView.voxelsLabel.text = "Voxels " + HELPER_CONFIG.width + " x " + HELPER_CONFIG.height;
            }
        }
    }
}