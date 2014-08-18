package app.data.mesh
{
    public class EmbeddedMeshes
    {
        [Embed(source="/../meshes/Mesh-001.obj", mimeType="application/octet-stream")]
        private static const Mesh1:Class;

        [Embed(source="/../meshes/Mesh-002.obj", mimeType="application/octet-stream")]
        private static const Mesh2:Class;

        public function EmbeddedMeshes()
        {
        }

        public static function initialize():void
        {
            MeshInfoLibrary.instance.addMeshInfoFromByteArray(new Mesh1(), "Mesh-1.obj");
            MeshInfoLibrary.instance.addMeshInfoFromByteArray(new Mesh2(), "Mesh-2.obj");
        }
    }
}