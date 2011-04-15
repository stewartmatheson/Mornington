package mornington.lib
{
    import mornington.lib.State;

    public class Controller {
        protected var _currentState:State;
        public function addedToState(s:State):void {
            _currentState = s;
        }
    }
}
