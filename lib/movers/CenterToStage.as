package mornington.lib.movers 
{
    import mornington.lib.IMover;
    import mornington.core.flash.display.ExtendedMovieClip;
    import flash.events.*;

    public class CenterToStage implements IMover {
        var _targ:ExtendedMovieClip;

        public function added(m:ExtendedMovieClip):void {
            _targ = m;
            if(_targ.stage != null) {
                positionMovie();
            } else {
                _targ.addEventListener(Event.ADDED_TO_STAGE, addedToStage);
            }
        }

        private function addedToStage(e:Event):void {
            positionMovie();
        }
    
        private function positionMovie():void {
            _targ.y = (_targ.y / 2) + (_targ.stage.stageHeight / 2 );
            _targ.x = (_targ.x / 2) + (_targ.stage.stageWidth / 2 );
        }
    }
}
