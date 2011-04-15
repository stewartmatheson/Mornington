package mornington.core.flash.display {
    
    import flash.display.MovieClip;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import mornington.lib.IMover;

    public class ExtendedMovieClip extends MovieClip {
        private var _movers:Array;
        private var _fadeTimer:Timer;
        private var _fadingMode:int;
        private const FADING_IN:int = 0;
        private const FADING_OUT:int = 1;

        function ExtendedMovieClip(){
            super();
        }

        public function addMover(m:IMover):void {
            if(!_movers) {
                _movers = new Array();
            }
            _movers.push(m);
            m.added(this);
        }
        
        public function fadeIn(t:Number):void {
            if(alpha == 1) {
                return;
            }

            initTimer(t);
            
            if(alpha <= 0){
                _fadingMode = FADING_IN;
                _fadeTimer.reset();
                _fadeTimer.start();
            }
        }

        public function fadeOut(t:Number):void {
            if(alpha == 0) {
                return;
            }

            initTimer(t);

            if(alpha >= 1) {
                _fadingMode = FADING_OUT;
                _fadeTimer.reset();
                _fadeTimer.start();
            }
        }

        private function initTimer(t:Number):void {
            if(!_fadeTimer) {
                _fadeTimer = new Timer(t);
                _fadeTimer.addEventListener(TimerEvent.TIMER, tick);
            } else {
                _fadeTimer.delay = t;
            }       
        }

        private function tick(e:TimerEvent):void {
            if(_fadingMode == FADING_IN) {
                alpha = alpha + 0.1;
                if(alpha >= 1 ){
                    _fadeTimer.stop();
                } 
            } else {
                alpha = alpha - 0.1;
                if(alpha <= 0) {
                    _fadeTimer.stop();
                }
            }
        }
    }
}
