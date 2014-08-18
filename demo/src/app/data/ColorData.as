package app.data
{
    import recastnavigation.debugutils.duRGBA;

    public class ColorData
    {
        public var r:int;
        public var g:int;
        public var b:int;
        public var a:int;

        public function ColorData(r:int = 0, g:int = 0, b:int = 0, a:int = 0)
        {
            this.r = r;
            this.g = g;
            this.b = b;
            this.a = a;
        }

        public function getFlashColor():uint
        {
            return (r << 16) | (g << 8) | (b << 0);
        }

        public function getFlashAlpha():Number
        {
            return a / 255;
        }

        public function getRecastColor():int
        {
            return duRGBA(r, g, b, a);
        }

        public function copyFrom(colorData:ColorData):void
        {
            r = colorData.r;
            g = colorData.g;
            b = colorData.b;
            a = colorData.a;
        }

        public function mutliply(t:Number):void
        {
            r *= t;
            g *= t;
            b *= t;
        }
    }
}