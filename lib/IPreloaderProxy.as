package mornington.lib {
    
    import flash.events.ProgressEvent;
    import mornington.lib.State;

    public interface IPreloaderProxy {
        
        function get firstState():State;
        function get views():Array;
        function get urlLoaders():Array;
        function get ready():Boolean;
        function loadingProgress(percentComplete:Number):void;
        
    }
}
