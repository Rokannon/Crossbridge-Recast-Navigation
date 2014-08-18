package app.data
{
    public class DebugDrawVertexData
    {
        public var x:Number;
        public var y:Number;
        public var color:uint;
        public var alpha:Number;

        public function DebugDrawVertexData()
        {
        }

        public function toString():String
        {
            return "(x:" + x + ", y:" + y + ", color:" + color + ", alpha:" + alpha + ")";
        }
    }
}