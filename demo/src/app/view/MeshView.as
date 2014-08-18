package app.view
{
    import starling.display.Image;
    import starling.textures.RenderTexture;

    public class MeshView extends Image
    {
        public function MeshView(textureSize:int)
        {
            super(new RenderTexture(textureSize, textureSize));
        }

        public function get renderTexture():RenderTexture
        {
            return texture as RenderTexture;
        }
    }
}