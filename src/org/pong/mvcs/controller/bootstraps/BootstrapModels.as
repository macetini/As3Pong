package org.pong.mvcs.controller.bootstraps
{
	import org.pong.mvcs.model.*;
	import robotlegs.bender.framework.api.IInjector;
	
	/**
	 * Bootstrap dependency injector for all Models.
	 * 
	 * @see org.pong.mvcs.AppConfig
	 * @author mc
	 */
	
    public class BootstrapModels
    {
        public function BootstrapModels(injector:IInjector)
        {
			injector.map(StarlingGameModel).asSingleton();			
			injector.map(BallModel).asSingleton();
			injector.map(HudModel).asSingleton();
        }
    }
}