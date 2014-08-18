package app.model
{
    import flash.geom.Point;

    public class CoordSpace
    {
        private var _textureSize:Number;
        private var _xMin:Number;
        private var _yMin:Number;
        private var _xMax:Number;
        private var _yMax:Number;

        public function CoordSpace()
        {
        }

        public function reset(textureSize:Number, xMin:Number, yMin:Number, xMax:Number, yMax:Number):void
        {
            _textureSize = textureSize;
            _xMin = xMin;
            _yMin = yMin;
            _xMax = xMax;
            _yMax = yMax;
        }

        public function sceneToModel(point:Point, resultPoint:Point = null):Point
        {
            if (resultPoint == null)
            {
                resultPoint = new Point();
            }
            var dx:Number = _xMax - _xMin;
            var dy:Number = _yMax - _yMin;
            if (dx < dy)
            {
                resultPoint.setTo(_xMin - 0.5 * (dy - dx) + (point.x / _textureSize) * dy,
                                  _yMin + (point.y / _textureSize) * dy);
            }
            else
            {
                resultPoint.setTo(_xMin + (point.x / _textureSize) * dx,
                                  _yMin - 0.5 * (dx - dy) + (point.y / _textureSize) * dx);
            }
            return resultPoint;
        }

        public function modelToScene(point:Point, resultPoint:Point = null):Point
        {
            if (resultPoint == null)
            {
                resultPoint = new Point();
            }
            var dx:Number = _xMax - _xMin;
            var dy:Number = _yMax - _yMin;
            if (dx < dy)
            {
                resultPoint.setTo(_textureSize * (point.x - _xMin + 0.5 * (dy - dx)) / dy,
                                  _textureSize * (point.y - _yMin) / dy);
            }
            else
            {
                resultPoint.setTo(_textureSize * (point.x - _xMin) / dx,
                                  _textureSize * (point.y - _yMin + 0.5 * (dx - dy)) / dx);
            }
            return resultPoint;
        }
    }
}