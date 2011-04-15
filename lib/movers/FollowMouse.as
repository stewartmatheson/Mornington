package mornington.lib.movers 
{
    import mornington.lib.IMover;
    import mornington.core.flash.display.ExtendedMovieClip;
    import flash.events.*;

    public class FollowMouse implements IMover {
        var _targ:ExtendedMovieClip;

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
            _targ.stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoved);
        }

        private function mouseMoved(e:MouseEvent):void {
            _targ.y = e.stageY; _targ.x = e.stageX;
        }
    }
}
