package mornington.lib.movers
{
    import mornington.lib.IMover;
    import mornington.core.flash.display.ExtendedMovieClip;
    import flash.events.*;
    import flash.geom.Point;

    public class PointAtMouse implements IMover {
        
        var _targ:ExtendedMovieClip,
            maths:Number;

        public function added(m:ExtendedMovieClip):void {
            _targ = m;
            if(_targ.stage != null) {
                registerEventListeners();
            } else {
                _targ.addEventListener(Event.ADDED_TO_STAGE, addedToStage);
            }
        }

        private function addedToStage(e:Event):void {
            registerEventListeners();
        }

        private function registerEventListeners():void {
            _targ.stage.addEventListener(Event.ENTER_FRAME, rotatePointerToMouse);
        }

        private function rotatePointerToMouse(e:Event):void {
            var mouse_x = int(_targ.stage.mouseX - (_targ.stage.stageWidth / 2)),
                mouse_y = int(_targ.stage.mouseY - (_targ.stage.stageHeight / 2)),
                quad:Number,
                abs_x:Number,
                abs_y:Number,
                tg:Number,
                angle:Number;

            if (mouse_x > 0 && mouse_y > 0) {
                quad = 4;
            }

            if (mouse_x<0 && mouse_y>0) {
                quad = 1;
            }

            if (mouse_x<0 && mouse_y<0) {
                quad = 2;
            }

            if (mouse_x>0 && mouse_y<0) {
                quad = 3;
            }

            abs_x = Math.abs(mouse_x);
            abs_y = Math.abs(mouse_y);
            tg = abs_y/abs_x;
            maths = Math.atan(tg)*Number(180)/Math.PI;
            if (quad == 1) { angle = 90 - maths }
            if (quad == 2) { angle = 90 + maths }
            if (quad == 3) { angle = 270 - maths }
            if (quad == 4) { angle = 270 + maths }
            _targ.rotation = angle;
        }
    }
}
