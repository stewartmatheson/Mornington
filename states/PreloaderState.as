package mornington.states 
{
    import mornington.lib.*;
    import mornington.events.StateEvent;
    import flash.events.*;
    import flash.display.*;

    public class PreloaderState extends State {
        private var _proxy:IPreloaderProxy,
                    _documentObject:MovieClip;
        
        public function PreloaderState(p:IPreloaderProxy, documentObject:MovieClip){
            super();
            _proxy = p; _documentObject = documentObject;
            _documentObject.loaderInfo.addEventListener(ProgressEvent.PROGRESS, loaderProgress);
            
            for each(var l in _proxy.urlLoaders) {
                l.addEventListener(ProgressEvent.PROGRESS, loaderProgress);
            }

            for each (var view in p.views){
                addView(view);
            }
        }

        private function loaderProgress(e:Event):void {
            var percentComplete:Number = 0,
                totalBytes:Number = _documentObject.loaderInfo.bytesTotal,
                totalBytesLoaded:Number = _documentObject.loaderInfo.bytesLoaded,
                loadersInit = true;

            for each(var l in _proxy.urlLoaders){
                if(l.bytesTotal == 0) { 
                    loadersInit = false;
                    break;
                }
                totalBytes = totalBytes + l.bytesTotal;
                totalBytesLoaded = totalBytesLoaded + l.bytesLoaded
            }

            if(loadersInit) {
                percentComplete = Math.floor((totalBytesLoaded / totalBytes) * 100);
            }

            if(percentComplete == 100){
                _documentObject.addEventListener(Event.ENTER_FRAME, waitForReady);
            }
        }

        private function waitForReady(e:Event):void {
            if(_proxy.ready) {
                _documentObject.removeEventListener(Event.ENTER_FRAME, waitForReady);
                loadingComplete(); 
            }
        }

        private function loadingComplete():void {
            var nextStateEvent:StateEvent = new StateEvent(StateEvent.COMPLETE);
            nextStateEvent.nextState = _proxy.firstState;
            dispatchEvent(nextStateEvent);
        }
    }
}
