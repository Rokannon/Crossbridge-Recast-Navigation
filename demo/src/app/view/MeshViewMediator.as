package app.view
{
    import app.data.MeshBounds;
    import app.model.GUIModel;
    import app.model.SoloMesh;
    import app.model.SoloMeshEvent;
    import app.view.debugdraw.StarlingTextureDUDebugDraw;

    import recastnavigation.debugutils.duDebugDrawNavMesh;
    import recastnavigation.debugutils.duDebugDrawTriMeshSlope;
    import recastnavigation.debugutils.enum.DrawNavMeshFlags;

    public class MeshViewMediator
    {
        private static const HELPER_BOUNDS_1:MeshBounds = new MeshBounds();
        private static const HELPER_BOUNDS_2:MeshBounds = new MeshBounds();

        private var _meshView:MeshView;
        private var _soloMesh:SoloMesh;
        private var _debugDraw:StarlingTextureDUDebugDraw
        private var _firstBuild:Boolean;

        public function MeshViewMediator()
        {
        }

        public function connect(meshView:MeshView, soloMesh:SoloMesh):void
        {
            _meshView = meshView;
            _soloMesh = soloMesh;

            _debugDraw = new StarlingTextureDUDebugDraw(_meshView.renderTexture, 0, 0, 1, 1);
            _debugDraw.alloc();

            _soloMesh.addEventListener(SoloMeshEvent.BUILD_COMPLETE, onMeshBuildComplete);
            _soloMesh.addEventListener(SoloMeshEvent.MESH_SELECTED, onMeshSelected);
        }

        private function onMeshSelected(event:SoloMeshEvent):void
        {
            _meshView.renderTexture.clear();
            _soloMesh.meshInfo.getMeshBoundMin(HELPER_BOUNDS_1);
            _soloMesh.meshInfo.getMeshBoundMax(HELPER_BOUNDS_2);
            _debugDraw.reset(_meshView.renderTexture, HELPER_BOUNDS_1.x - GUIModel.BOUNDS_PADDING,
                             HELPER_BOUNDS_1.z - GUIModel.BOUNDS_PADDING, HELPER_BOUNDS_2.x + GUIModel.BOUNDS_PADDING,
                             HELPER_BOUNDS_2.z + GUIModel.BOUNDS_PADDING);
            duDebugDrawTriMeshSlope(_debugDraw, _soloMesh.meshInfo.verts, _soloMesh.meshInfo.tris,
                                    _soloMesh.meshInfo.normals, _soloMesh.agentMaxSlope, 1);
            _firstBuild = true;
        }

        private function onMeshBuildComplete(event:SoloMeshEvent):void
        {
            if (!_firstBuild)
            {
                _meshView.renderTexture.clear();
                duDebugDrawTriMeshSlope(_debugDraw, _soloMesh.meshInfo.verts, _soloMesh.meshInfo.tris,
                                        _soloMesh.meshInfo.normals, _soloMesh.agentMaxSlope, 1);
            }
            duDebugDrawNavMesh(_debugDraw, _soloMesh.navMesh, DrawNavMeshFlags.DU_DRAWNAVMESH_COLOR_TILES);
            _firstBuild = false;
        }
    }
}