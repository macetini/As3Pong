package org.pong.mvcs.model.modelHelper 
{
	/**
	 * 
	 * The GameState class is a helper class used by <code>StarlingGameModel</code>. It is used to describe current 
	 * state of application.
	 * 
	 * @author mc
	 */
	
	public class GameState 
	{
		/**
		 * 
		 * Application is in process of loading assets. No objects are updated during this phase.
		 */
		public const ASSETS_LOADING:String = "assetsLoading";
		
		/**
		 * 
		 * Application is in process of screen transition - quick animation. No objects are updated during this phase.
		 */
		public const SCREEN_TRANSITION:String = "screenTransition";
		
		/**
		 * 
		 * Application is playing - objects are updated and user can interact with them.
		 */
		public const PLAY:String = "play";
		
		/**
		 * 
		 * Current state of application.
		 * 
		 * @default Deafults to <code>null</code>
		 */
		public var currentState:String = null;
	}

}