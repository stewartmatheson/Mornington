package mornington.lib {
	import flash.display.*;
	import flash.events.*;
    import mornington.core.flash.display.ExtendedMovieClip;
	
	public class State extends EventDispatcher {
		private var _currentStage:Stage;
        private var _controllers:Array;
        private var _controllerRefs:Array;
		protected var stateViews:Array;
		private var isDisplayed:Boolean = false;
        private var viewRefs:Object;
		
		public function set currentStage(s:Stage):void { _currentStage = s; }
		public function get currentStage():Stage { return _currentStage; }

        public function State()
        { 
            stateViews = new Array();
            _controllers = new Array();
            _controllerRefs = new Array();
            viewRefs = new Object();
        }

        public function display():void
        {
            for(var i:int; i < stateViews.length; i++ ) {
                currentStage.addChild(stateViews[i]);
            }
            isDisplayed = true;
        }

        public function hide():void
        {
            for(var i:int; i < stateViews.length; i++ ) {
                currentStage.removeChild(stateViews[i]);
            }
        }

        public function addView(v:Sprite, viewRef:String = null):void
        {
            if(isDisplayed){
                currentStage.addChild(v);
            }

            stateViews.push(v);
            
            if(viewRef) {
                viewRefs[viewRef] = v;
            }
        }

        public function getView(r:String):Sprite {
            if(viewRefs[r]) {
                return viewRefs[r];
            } else {
                throw new Error("Can not find view " + r );
            }
        }


        public function addController(c:Controller, controllerRef:String = null):void
        {
            _controllers.push(c);
            c.addedToState(this);
            if(controllerRef) {
                _controllerRefs[controllerRef] = c;
            }
        }

        public function getController(r:String):Object {
            if(_controllerRefs[r]) {
                return _controllerRefs[r];
            } else {
                throw new Error("Can not find controller " + r );
            }
        }
	}
}
