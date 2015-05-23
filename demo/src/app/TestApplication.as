package app
{
    import app.data.mesh.MeshInfo;
    import app.data.mesh.MeshInfoLibrary;
    import app.model.SoloMesh;

    import flash.geom.Point;

    import recastnavigation.detour.crowd.DTCrowd;
    import recastnavigation.detour.navmeshquery.DTQueryFilter;
    import recastnavigation.recast.RCContext;

    import starling.display.Sprite;
    import starling.events.Event;

    public class TestApplication extends Sprite
    {
        public function TestApplication()
        {
            super();
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        private function onAddedToStage():void
        {
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            var meshInfo:MeshInfo = MeshInfoLibrary.instance.getMeshInfoByName("Obj-test-1.obj");
            var soloMesh:SoloMesh = new SoloMesh();
            var rcContext:RCContext = new RCContext();
            rcContext.alloc();
            soloMesh.connect(rcContext);
            soloMesh.setMesh(meshInfo);
            soloMesh.build();
            trace("Mesh built.");

            var crowd:DTCrowd = new DTCrowd();
            crowd.alloc();

            var filter:DTQueryFilter = new DTQueryFilter();
            filter.alloc();

            var p:Point = new Point();
            soloMesh.query.findNearestPoly(p.x, 0, p.y, 20, 40, 20, filter);
            p.setTo(soloMesh.query.nearestPtX, soloMesh.query.nearestPtZ);
            var ref:int = soloMesh.query.nearestRef;
            trace(p, ref);

            crowd.init(128, 5, soloMesh.navMesh);
            for (var i:int = crowd.getAgentCount() - 1; i >= 0; --i)
            {
                if (crowd.getAgent(i).active)
                    trace("active");
            }
        }
    }
}