package app.data.mesh
{
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;

    public class MeshInfoLibrary
    {
        public static const instance:MeshInfoLibrary = new MeshInfoLibrary();

        public const meshes:Vector.<MeshInfo> = new Vector.<MeshInfo>();

        private const _meshInfoByName:Dictionary = new Dictionary();

        public function MeshInfoLibrary()
        {
        }

        public function addMeshInfoFromByteArray(byteArray:ByteArray, name:String, scale:Number = 1.0):void
        {
            var meshInfo:MeshInfo = new MeshInfo();
            meshInfo.name = name;
            meshInfo.initFromByteArray(byteArray, scale);
            meshes.push(meshInfo);
            _meshInfoByName[name] = meshInfo;
        }

        public function getMeshInfoByName(name:String):MeshInfo
        {
            return _meshInfoByName[name];
        }
    }
}