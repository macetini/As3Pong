package org.pong.mvcs.controller.bootstraps 
{
	import org.pong.mvcs.view.component.*;
	import org.pong.mvcs.view.component.paddle.*;
	import org.pong.mvcs.view.mediator.*;

	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	
	/**
	 * Bootstrap dependency injector for all Mediators.
	 * 
	 * @see org.pong.mvcs.AppConfig
	 * @author Marko (Cetinic) Cettina
	 */
	
	public class BootstrapMediatorMap 
	{
		public function BootstrapMediatorMap(mediatorMap:IMediatorMap) 
		{
			mediatorMap.map(StarlingGameView).toMediator(StarlingGameMediator);
			mediatorMap.map(LoadingScreenView).toMediator(LoadingScreenMediator);
			mediatorMap.map(MainView).toMediator(MainMediator);
			mediatorMap.map(BallView).toMediator(BallMediator);
			mediatorMap.map(LeftPaddleView).toMediator(DefaultPaddleMediator);
			mediatorMap.map(RightPaddleView).toMediator(DefaultPaddleMediator);
			mediatorMap.map(HudView).toMediator(HudMediator);
		}
	}
}