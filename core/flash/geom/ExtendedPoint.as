package mornington.core.flash.geom 
{

    import flash.geom.Point;

    public class ExtendedPoint extends Point {
        
        public function ExtendedPoint(x:Number, y:Number){
            super(x, y);
        }
        
        public function devide(n:Number):ExtendedPoint {
            var p:ExtendedPoint = new ExtendedPoint(x / n, y / n);
            return p;
        }

        public function devideBang(n:Number):void {
            x = x / n; y = y / n;
        }
    }
}
