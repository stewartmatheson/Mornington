package mornington 
{
    import mornington.lib.StateContext;
    import flash.display.*;
    import mornington.lib.IPreloaderProxy;
    import mornington.states.PreloaderState;

    public class Loader {
        public static function go(  preloaderProxy:IPreloaderProxy, 
                                    documentObject:MovieClip):void{
            
            var pl:PreloaderState = new PreloaderState(preloaderProxy, documentObject);
            var s:StateContext = new StateContext(localStage(documentObject));
            s.initState = pl;
        }

        private static function localStage(documentObject:MovieClip):Stage {
            var myMC:MovieClip = new MovieClip();
            documentObject.addChild(myMC);
            var _stage:Stage = myMC.stage;
            return _stage;
        }
    }
}
