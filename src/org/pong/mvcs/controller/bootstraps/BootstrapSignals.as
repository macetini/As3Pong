package org.pong.mvcs.controller.bootstraps 
{
	import org.pong.mvcs.model.signals.*;
	import org.pong.mvcs.service.signals.*;
	import org.pong.mvcs.view.signals.*;

	import robotlegs.bender.framework.api.IInjector;
	
	/**
	 * 
	 * Bootstrap dependency injector for all Signal classes.
	 * 
	 * @see org.pong.mvcs.AppConfig
	 * @author Marko (Cetinic) Cettina
	 */
	
	public class BootstrapSignals 
	{
		public function BootstrapSignals(injector:IInjector)
		{
			injector.map(TickSignal).asSingleton();
			injector.map(UpdateViewsSignal).asSingleton();
			
			injector.map(BallAddedToStageSignal).asSingleton();
			
			injector.map(StartLoadingAssetsSignal).asSingleton();
			injector.map(AssetsLoadingProgressSignal).asSingleton();
			injector.map(AssetsLoadingCompleteSignal).asSingleton();
			
			injector.map(ScreenTransitionCompleteSignal).asSingleton();
			
			injector.map(BallHitWallSignal).asSingleton();
			injector.map(BallHitPaddleSignal).asSingleton();
			
			injector.map(BallModelUpdatedSignal).asSingleton();
			
			injector.map(PlayerWonSignal).asSingleton();
			injector.map(HudModelUpdatedSignal).asSingleton();
		}
	}
}