package app.view.debugdraw
{
    import app.data.DebugDrawVertexData;

    import recastnavigation.debugutils.DUDebugDraw;
    import recastnavigation.debugutils.enum.DUDebugDrawPrimitives;

    import starling.display.Shape;
    import starling.textures.RenderTexture;

    public class StarlingTextureDUDebugDraw extends DUDebugDraw
    {
        private static const VERTEX_DATA_POOL:Vector.<DebugDrawVertexData> = new Vector.<DebugDrawVertexData>();
        private static const VERTS_PER_FLUSH:int = 60;

        private const _currentVerts:Vector.<DebugDrawVertexData> = new Vector.<DebugDrawVertexData>();
        private const _shape:Shape = new Shape();

        private var _currentPrim:int;
        private var _currentSize:Number;
        private var _renderTexture:RenderTexture;
        private var _xMin:Number;
        private var _yMin:Number;
        private var _xMax:Number;
        private var _yMax:Number;

        public function StarlingTextureDUDebugDraw(renderTexture:RenderTexture, xMin:Number, yMin:Number, xMax:Number,
                                                   yMax:Number)
        {
            super();
            reset(renderTexture, xMin, yMin, xMax, yMax);
        }

        public function reset(renderTexture:RenderTexture, xMin:Number, yMin:Number, xMax:Number, yMax:Number):void
        {
            _renderTexture = renderTexture;

            var d:Number;
            if ((xMax - xMin) / (yMax - yMin) < renderTexture.width / renderTexture.height)
            {
                d = 0.5 * ((yMax - yMin) / (xMax - xMin) - renderTexture.height / renderTexture.width) * (xMax - xMin);
                _xMin = xMin - d;
                _yMin = yMin;
                _xMax = xMax + d;
                _yMax = yMax;
            }
            else
            {
                d = 0.5 * ((xMax - xMin) / (yMax - yMin) - renderTexture.width / renderTexture.height) * (yMax - yMin);
                _xMin = xMin;
                _yMin = yMin - d;
                _xMax = xMax;
                _yMax = yMax + d;
            }
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
            var vertsCount:int = 0;
            _shape.graphics.lineStyle();
            var length:int = _currentVerts.length;
            for (var i:int = 0; i < length; ++i)
            {
                var vertexData:DebugDrawVertexData = _currentVerts[i];
                _shape.graphics.beginFill(vertexData.color, vertexData.alpha);
                _shape.graphics.drawCircle(vertexData.x, vertexData.y, 0.5 * _currentSize);
                _shape.graphics.endFill();
                vertsCount += 1;
                if (vertsCount >= VERTS_PER_FLUSH)
                {
                    vertsCount = 0;
                    flush();
                }
            }
            if (vertsCount != 0)
            {
                flush();
            }
        }

        [Inline]
        private function end_lines():void
        {
            var vertsCount:int = 0;
            var length:int = _currentVerts.length;
            for (var i:int = 0; i < length; i += 2)
            {
                var vertexData:DebugDrawVertexData;
                vertexData = _currentVerts[i];
                _shape.graphics.lineStyle(_currentSize, vertexData.color, vertexData.alpha);
                _shape.graphics.moveTo(vertexData.x, vertexData.y);
                vertexData = _currentVerts[i + 1];
                _shape.graphics.lineTo(vertexData.x, vertexData.y);
                vertsCount += 2;
                if (vertsCount >= VERTS_PER_FLUSH)
                {
                    vertsCount = 0;
                    flush();
                }
            }
            if (vertsCount != 0)
            {
                flush();
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
            var vertsCount:int = 0;
            _shape.graphics.lineStyle();
            var length:int = _currentVerts.length;
            for (var i:int = 0; i < length; i += numVerts)
            {
                var vertexData:DebugDrawVertexData;
                vertexData = _currentVerts[i];
                _shape.graphics.beginFill(vertexData.color, vertexData.alpha);
                _shape.graphics.moveTo(vertexData.x, vertexData.y);
                for (var j:int = 1; j < numVerts; ++j)
                {
                    vertexData = _currentVerts[i + j];
                    _shape.graphics.lineTo(vertexData.x, vertexData.y);
                }
                vertexData = _currentVerts[i];
                _shape.graphics.lineTo(vertexData.x, vertexData.y);
                _shape.graphics.endFill();
                _shape.graphics.lineStyle();
                vertsCount += 2;
                if (vertsCount >= VERTS_PER_FLUSH)
                {
                    vertsCount = 0;
                    flush();
                }
            }
            if (vertsCount != 0)
            {
                flush();
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
            vertexData.x = _renderTexture.width * (x - _xMin) / (_xMax - _xMin);
            vertexData.y = _renderTexture.height * (z - _yMin) / (_yMax - _yMin);
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

        [Inline]
        private function flush():void
        {
            _renderTexture.draw(_shape);
            _shape.graphics.clear();
        }
    }
}