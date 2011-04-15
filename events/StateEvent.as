package mornington.events {

	import flash.events.Event;
	import mornington.lib.State;

	public class StateEvent extends flash.events.Event {

		public static const COMPLETE:String = "complete";
		public static const READY:String = "ready";
		private var _nextState:State;
		public function get nextState():State { return _nextState; }
		public function set nextState(s):void { _nextState = s; }

		public function StateEvent(command:String)
		{
			super(command);
		}
	}
}
