package app.view.debugdraw
{
    import app.data.DebugDrawVertexData;

    import recastnavigation.debugutils.DUDebugDraw;
    import recastnavigation.debugutils.enum.DUDebugDrawPrimitives;

    import starling.display.Graphics;

    public class StarlingGraphicsDUDebugDraw extends DUDebugDraw
    {
        private static const VERTEX_DATA_POOL:Vector.<DebugDrawVertexData> = new Vector.<DebugDrawVertexData>();

        private const _currentVerts:Vector.<DebugDrawVertexData> = new Vector.<DebugDrawVertexData>();

        private var _graphics:Graphics;
        private var _currentPrim:int;
        private var _currentSize:Number;

        public function StarlingGraphicsDUDebugDraw(graphics:Graphics)
        {
            super();
            _graphics = graphics;
        }

        protected override function begin(prim:int, size:Number = 1.0):void
        {
            _currentPrim = prim;
            _currentSize = size;
        }

        protected override function end():void
        {
            switch (_currentPrim)
            {
                case DUDebugDrawPrimitives.DU_DRAW_POINTS:
                    end_points();
                    break;
                case DUDebugDrawPrimitives.DU_DRAW_LINES:
                    end_lines();
                    break;
                case DUDebugDrawPrimitives.DU_DRAW_TRIS:
                    end_tris();
                    break;
                case DUDebugDrawPrimitives.DU_DRAW_QUADS:
                    end_quads();
                    break;
            }

            for (var i:int = _currentVerts.length - 1; i >= 0; --i)
            {
                releaseVertexData(_currentVerts[i]);
            }
            _currentVerts.length = 0;
        }

        protected override function vertex(x:Number, y:Number, z:Number, color:int):void
        {
            vertexInternal(x, y, z, color);
        }

        protected override function vertex_uv(x:Number, y:Number, z:Number, color:int, u:Number, v:Number):void
        {
            vertexInternal(x, y, z, color);
        }

        [Inline]
        private function end_points():void
        {
            _graphics.lineStyle();
            var length:int = _currentVerts.length;
            for (var i:int = 0; i < length; ++i)
            {
                var vertexData:DebugDrawVertexData = _currentVerts[i];
                _graphics.beginFill(vertexData.color, vertexData.alpha);
                _graphics.drawCircle(vertexData.x, vertexData.y, _currentSize);
                _graphics.endFill();
            }
        }

        [Inline]
        private function end_lines():void
        {
            var length:int = _currentVerts.length;
            for (var i:int = 0; i < length; i += 2)
            {
                var vertexData:DebugDrawVertexData;
                vertexData = _currentVerts[i];
                _graphics.lineStyle(_currentSize, vertexData.color, vertexData.alpha);
                _graphics.moveTo(vertexData.x, vertexData.y);
                vertexData = _currentVerts[i + 1];
                _graphics.lineTo(vertexData.x, vertexData.y);
            }
        }

        [Inline]
        private function end_tris():void
        {
            drawHelper(3);
        }

        [Inline]
        private function end_quads():void
        {
            drawHelper(4);
        }

        [Inline]
        private function drawHelper(numVerts:int):void
        {
            _graphics.lineStyle();
            var length:int = _currentVerts.length;
            for (var i:int = 0; i < length; i += numVerts)
            {
                var vertexData:DebugDrawVertexData;
                vertexData = _currentVerts[i];
                _graphics.beginFill(vertexData.color, vertexData.alpha);
                _graphics.moveTo(vertexData.x, vertexData.y);
                for (var j:int = 1; j < numVerts; ++j)
                {
                    vertexData = _currentVerts[i + j];
                    _graphics.lineTo(vertexData.x, vertexData.y);
                }
                vertexData = _currentVerts[i];
                _graphics.lineTo(vertexData.x, vertexData.y);
                _graphics.endFill();
                _graphics.lineStyle();
            }
        }

        [Inline]
        private function vertexInternal(x:Number, y:Number, z:Number, color:int):void
        {
            var r:int = (color >> 0) & 0xFF;
            var g:int = (color >> 8) & 0xFF;
            var b:int = (color >> 16) & 0xFF;
            var a:int = (color >> 24) & 0xFF;

            var vertexData:DebugDrawVertexData = createVertexData();
            vertexData.x = x;
            vertexData.y = z;
            vertexData.color = (r << 16) | (g << 8) | (b << 0);
            vertexData.alpha = a / 255;
            _currentVerts.push(vertexData);
        }

        [Inline]
        private function createVertexData():DebugDrawVertexData
        {
            return VERTEX_DATA_POOL.length == 0 ? new DebugDrawVertexData() : VERTEX_DATA_POOL.pop();
        }

        [Inline]
        private function releaseVertexData(vertexData:DebugDrawVertexData):void
        {
            VERTEX_DATA_POOL.push(vertexData);
        }
    }
}