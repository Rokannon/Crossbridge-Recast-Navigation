package app.data
{
    public class MeshBounds
    {
        public var x:Number;
        public var y:Number;
        public var z:Number;

        public function MeshBounds()
        {
        }

        public function toString():String
        {
            return "(" + x.toString() + ", " + y.toString() + ", " + z.toString() + ")";
        }
    }
}