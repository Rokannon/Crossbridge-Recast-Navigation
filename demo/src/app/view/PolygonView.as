package app.view
{
    import starling.display.Shape;
    import starling.display.materials.FlatColorMaterial;

    public class PolygonView extends Shape
    {
        public const material:FlatColorMaterial = new FlatColorMaterial();

        public var polyRef:int;

        public function PolygonView()
        {
            super();
        }
    }
}