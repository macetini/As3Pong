package org.pong.mvcs.view.component
{
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.events.FeathersEventType;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	import feathers.themes.MetalWorksMobileTheme;
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.pong.mvcs.view.component.MainView;
	import starling.animation.Transitions;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	
	/**
	 * 
	 * Game view is only one step above stage. It is a first screen show on stage. It is also a screen navigator that
	 * enables transition from loading screen to main screen.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	
	public class StarlingGameView extends ScreenNavigator
	{
		/**
		 * Loading screen name
		 */
		private const LOADING_SCREEN:String = "loadingScreen";
		
		/**
		 * Main screen name
		 */
		private const MAIN_SCREEN:String = "mainScreen";
		
		/**
		 * Duartion of transition animation between screens.
		 */
		private const _transitionDuration:Number = 0.4;
		
		/**
		 * Tick signal is disptched once every frame. It is a update signal that all views listen to.
		 */
		private var _tickSignal:ISignal;
		
		/**
		 * Transition animation
		 * 
		 * @private
		 */
		private var _transitionManager:ScreenSlidingStackTransitionManager;
		
		/**
		 * Tick signal getter
		 */
		public function get tickSignal():ISignal
		{
			return _tickSignal;
		}
		
		/**
		 * cosntr
		 */
		public function StarlingGameView()
		{
			super();
			
			setTheme();
			setNavigator();
			setSignals();
			setEventListenders();
			setTransitionManager();
		}
		
		/**
		 * Navigator creator
		 * 
		 * @private
		 */
		private function setNavigator():void
		{
			this.addScreen(LOADING_SCREEN, new ScreenNavigatorItem(LoadingScreenView, {onLoadingCompleate: MAIN_SCREEN}));			
			this.addScreen(MAIN_SCREEN, new ScreenNavigatorItem(MainView));
		}
		
		/**
		 * Theme setter
		 * 
		 * @private
		 */
		private function setTheme():void
		{
			new MetalWorksMobileTheme;
		}
		
		/**
		 * Signal creator
		 * 
		 * @private
		 */
		private function setSignals():void
		{
			_tickSignal = new Signal;
		}
		
		/**
		 * Listners setter
		 * 
		 * @private
		 */
		private function setEventListenders():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageEventHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		
		/**
		 * Transition manager setter. Creates animation shown between screens
		 * 
		 *
		 */
		private function setTransitionManager():void
		{
			_transitionManager = new ScreenSlidingStackTransitionManager(this);
			_transitionManager.duration = _transitionDuration;
			_transitionManager.ease = Transitions.EASE_OUT_BACK;
		}
		
		/**
		 * Called when component added to stage.
		 */
		protected function added():void
		{
			trace(this + ", added()");
			
			this.removeEventListener(Event.ADDED_TO_STAGE, addedToStageEventHandler);
			
			this.showScreen(LOADING_SCREEN);
			
			startGameLoopIterationSignal();
		}
		
		/**
		 * 
		 * Added to stage handler
		 * 
		 * @private
		 */
		private function addedToStageEventHandler(event:Event):void
		{
			added();
		}
		
		/**
		 * Component Destructor.
		 */
		protected function removed():void
		{
			trace(this + ", removed()");
		}
		
		/**
		 * 
		 * Removed from stage handler
		 * 
		 * @private
		 */
		private function onRemovedFromStage(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			
			removed();
		}
		
		/**
		 * Enter frame lister.
		 * 
		 * @private
		 */
		private function startGameLoopIterationSignal():void
		{
			stage.addEventListener(EnterFrameEvent.ENTER_FRAME, onEnterFrame);
		}
		
		/**
		 * 
		 * Dispatches new _tickSignal signale every frame.
		 * 
		 * @event tickSignal once a frame
		 * 
		 * @param	event Enter frame event.
		 */
		private function onEnterFrame(event:EnterFrameEvent):void
		{
			_tickSignal.dispatch(event.passedTime);
		}
	
	}
}
