package mornington.lib {
	import flash.display.*;
	import flash.events.*;
	
	public class State extends EventDispatcher {
		private var _currentStage:Stage;
		protected var stateViews:Array;
		private var isDisplayed:Boolean = false;
        private var viewRefs:Object;
		
		public function set currentStage(s:Stage):void { _currentStage = s; }
		public function get currentStage():Stage { return _currentStage; }

		public function State()
		{ 
			stateViews = new Array();
            viewRefs = new Object();
		}
		
		public function display():void
		{
			for(var i:int; i < stateViews.length; i++ )
				currentStage.addChild(stateViews[i]);
			isDisplayed = true;
		}
		
		public function hide():void
		{
			for(var i:int; i < stateViews.length; i++ )
				currentStage.removeChild(stateViews[i]);
		}
		

		public function addView(s:Sprite, viewRef:String = null):void
		{
			if(isDisplayed){
				currentStage.addChild(s);
			}
			stateViews.push(s);
            
            if(viewRef) {
                viewRefs[viewRef] = s;
            }
		}

        public function getView(r:String):Sprite {
            if(viewRefs[r]) {
                return viewRefs[r];
            } else {
                throw new Error("Can not find view " + r );
            }
        }
	}
}
