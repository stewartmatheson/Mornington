package mornington.lib {
    import flash.display.Stage;
	import mornington.events.StateEvent;
	import mornington.lib.State;
	
	public class StateContext
	{
		private var currentStage:Stage;
		private var currentState:State;
	
        public function set initState(s:State):void {
            if(currentState) {
                return;
            } else {
                setupState(s);
            }
        }

		public function StateContext(s:Stage)
		{
			currentStage = s;
		}

		private function stateReady(e:StateEvent):void
		{
			currentState.hide();
			currentState = null;
			setupState(e.nextState);
		}

		private function setupState(s:State):void 
		{
			currentState = s;
			currentState.currentStage = currentStage;
			currentState.display();
			var stateReadyEvent = new StateEvent(StateEvent.READY);
			currentState.dispatchEvent(stateReadyEvent);
			currentState.addEventListener(StateEvent.COMPLETE, stateReady);
		}
	}
}
