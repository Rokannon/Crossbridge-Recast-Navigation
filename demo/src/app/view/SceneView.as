package app.view
{
    import app.model.SoloMesh;

    import starling.display.Sprite;

    public class SceneView extends Sprite
    {
        public const meshView:MeshView = new MeshView(SoloMesh.TEXTURE_SIZE);
        public const toolView:Sprite = new Sprite();

        public function SceneView()
        {
            super();
            addChild(meshView);
            addChild(toolView);
        }
    }
}