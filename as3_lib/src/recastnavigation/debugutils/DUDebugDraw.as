package recastnavigation.debugutils
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_duDebugDraw_alloc;

    use namespace rn_internal;

    /**
     * Abstract debug draw interface.
     */
    public class DUDebugDraw extends RNBase
    {
        private const _obj:Object = new Object();

        public function DUDebugDraw()
        {
            super();
            _obj.depthMask = depthMask;
            _obj.texture = texture;
            _obj.begin = begin;
            _obj.vertex = vertex;
            _obj.vertex_uv = vertex_uv;
            _obj.end = end;
        }

        public override function alloc():Boolean
        {
            ptr = internal_duDebugDraw_alloc(_obj);
            return ptr != 0;
        }

        public override function free():void
        {
            CModule.free(ptr);
            ptr = 0;
        }

        protected function depthMask(state:Boolean):void
        {
        }

        protected function texture(state:Boolean):void
        {
        }

        /** Begin drawing primitives. */
        protected function begin(prim:int, size:Number = 1.0):void
        {
        }

        /** Submit a vertex */
        protected function vertex(x:Number, y:Number, z:Number, color:int):void
        {
        }

        /** Submit a vertex */
        protected function vertex_uv(x:Number, y:Number, z:Number, color:int, u:Number, v:Number):void
        {
        }

        /** End drawing primitives. */
        protected function end():void
        {
        }
    }
}