package org.pong.mvcs.model 
{
	import org.pong.mvcs.model.modelHelper.GameState;
	import org.pong.mvcs.model.signals.UpdateViewsSignal;
	
	/**
	 * StarlingGameModel contains game state logic. Based on game States it decides should game objects be
	 * updated or not.
	 * 
	 * @author mc
	 */
	
	public class StarlingGameModel 
	{
		/**
		 * 
		 * Dispached if GameState.PLAY.
		 * 
		 * @see updateViewObjects()
		 */
		[Inject]
		public var updateViewSignal:UpdateViewsSignal;
		
		/**
		 * Current state of the game.
		 * 
		 * @default Dfaults to <code>null</code>
		 * @see org.pong.mvcs.model.modelHelper.GameState
		 */
		private var _gameState:GameState;
		
		public function StarlingGameModel():void
		{
			_gameState = new GameState;
		}
		
		/**
		 *  Metod that sets <code>GameState.ASSETS_LOADING state.
		 * 
		 * @see org.pong.mvcs.model.modelHelper.GameState
		 */
		public function startAssetsLoading():void
		{
			trace(this + " startAssetsLoading()");
			_gameState.currentState = _gameState.ASSETS_LOADING;
		}
		
		
		/**
		 *  Metod that sets <code>GameState.SCREEN_TRANSITION state.
		 * 
		 * @see org.pong.mvcs.model.modelHelper.GameState
		 */
		public function assetsLoadingComplete():void
		{
			trace(this + " assetsLoadingComplete()");
			_gameState.currentState = _gameState.SCREEN_TRANSITION;
		}
		
		/**
		 *  Metod that sets <code>GameState.PLAY state.
		 * 
		 * @see org.pong.mvcs.model.modelHelper.GameState
		 */
		public function screenTransitionComplete():void
		{
			trace(this + " screenTransitionComplete()");
			_gameState.currentState = _gameState.PLAY;
		}
		
		/**
		 * 
		 * <code>updateViewObjects</code> corresponds to Tick signal. Every frame the View sends Tick signal, StarlingGameObject
		 * responds to this signal after it checks game state. If application is loading assets, or if it is in state of screen transition
		 * then no objects on stage will be updated - the Tick signal won't be responded to.
		 * 
		 * @event updateViewSignal() dispached if game state GameState.Play
		 * 
		 * @param	passedTime Time passed since the last frame/signal.
		 * 
		 * @see org.pong.mvcs.model.modelHelper.GameState
		 * @see org.pong.mvcs.view.component.StarlingGameView
		 */
		public function updateViewObjects(passedTime:Number):void
		{
			if(_gameState.currentState == _gameState.PLAY)
				updateViewSignal.dispatch(passedTime);
		}
	}

}