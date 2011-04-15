package mornington.lib.movers 
{
    import mornington.core.flash.display.ExtendedMovieClip;
    import flash.utils.Timer;
    import flash.events.*;
    import mornington.lib.IMover;
    

    public class EaseTo implements IMover {
        private var _targX:Number, 
                    _targY:Number, 
                    _targ:ExtendedMovieClip,
                    _easeTimer:Timer,
                    _extenralListeners:Array;
        
        public function EaseTo(x:Number, y:Number) {
            _targX = x; _targY = y;
            _extenralListeners = new Array();
        }

        public function added(t:ExtendedMovieClip):void {
            _targ = t;
            if(_targ.stage != null) {
                startEase();
            } else {
                _targ.addEventListener(Event.ADDED_TO_STAGE, addedToStage);
            }
        }

        public function addTickListener(f:Function):void {
            _extenralListeners.push(f);
        }

        private function addedToStage(e:Event):void {
            startEase();
        }

        private function startEase():void {
            _easeTimer = new Timer(10);
            _easeTimer.addEventListener(TimerEvent.TIMER, tick);
            for each(var f in _extenralListeners) {
                _easeTimer.addEventListener(TimerEvent.TIMER, f);
            }
            _easeTimer.start();
        }

        private function tick(e:TimerEvent):void {
            var offsetX = (_targ.x - _targX) / 5,
                offsetY = (_targ.y - _targY) / 5;
            _targ.x = _targ.x - offsetX; _targ.y = _targ.y - offsetY;
            if(_targ.x == _targX && _targ.y == _targY){
                _easeTimer.stop();
            }
        }
    }
}
