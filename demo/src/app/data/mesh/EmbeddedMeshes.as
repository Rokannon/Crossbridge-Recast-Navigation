package app.data.mesh
{
    public class EmbeddedMeshes
    {
        [Embed(source="c:/Users/Vladimir/Documents/Crossbridge-Recast-Navigation/demo/meshes/dungeon.obj", mimeType="application/octet-stream")]
        private static const dungeon_obj:Class;

        [Embed(source="c:/Users/Vladimir/Documents/Crossbridge-Recast-Navigation/demo/meshes/nav_test.obj", mimeType="application/octet-stream")]
        private static const nav_test_obj:Class;

        [Embed(source="c:/Users/Vladimir/Documents/Crossbridge-Recast-Navigation/demo/meshes/Obj-test-1.obj", mimeType="application/octet-stream")]
        private static const Obj_test_1_obj:Class;

        [Embed(source="c:/Users/Vladimir/Documents/Crossbridge-Recast-Navigation/demo/meshes/Obj-test-2.obj", mimeType="application/octet-stream")]
        private static const Obj_test_2_obj:Class;

        [Embed(source="c:/Users/Vladimir/Documents/Crossbridge-Recast-Navigation/demo/meshes/Obj-test-3.obj", mimeType="application/octet-stream")]
        private static const Obj_test_3_obj:Class;

        [Embed(source="c:/Users/Vladimir/Documents/Crossbridge-Recast-Navigation/demo/meshes/Obj-test-4.obj", mimeType="application/octet-stream")]
        private static const Obj_test_4_obj:Class;

        public function EmbeddedMeshes()
        {
        }

        public static function initialize():void
        {
            MeshInfoLibrary.instance.addMeshInfoFromByteArray(new dungeon_obj(), "dungeon.obj");
            MeshInfoLibrary.instance.addMeshInfoFromByteArray(new nav_test_obj(), "nav_test.obj");
            MeshInfoLibrary.instance.addMeshInfoFromByteArray(new Obj_test_1_obj(), "Obj-test-1.obj", 0.5);
            MeshInfoLibrary.instance.addMeshInfoFromByteArray(new Obj_test_2_obj(), "Obj-test-2.obj");
            MeshInfoLibrary.instance.addMeshInfoFromByteArray(new Obj_test_3_obj(), "Obj-test-3.obj");
            MeshInfoLibrary.instance.addMeshInfoFromByteArray(new Obj_test_4_obj(), "Obj-test-4.obj");
        }
    }
}