package recastnavigation.core
{
    use namespace rn_internal;

    public class RNBase
    {
        rn_internal var ptr:int;

        public function RNBase()
        {
        }

        public function alloc():Boolean
        {
            return false;
        }

        public function free():void
        {
        }
    }
}