package app
{
    import app.data.mesh.EmbeddedMeshes;

    import feathers.system.DeviceCapabilities;

    import flash.display.Sprite;

    import starling.core.Starling;

    [SWF(width="1280", height="720", frameRate="60", backgroundColor="0x262422")]
    public class Main extends Sprite
    {
        private var _starlingInstance:Starling;

        public function Main()
        {
            EmbeddedMeshes.initialize();
            DeviceCapabilities.dpi = 150;
            _starlingInstance = new Starling(MainApplication, stage);
//            _starlingInstance = new Starling(TestApplication, stage);
//            _starlingInstance.showStats = true;
            _starlingInstance.start();
        }
    }
}