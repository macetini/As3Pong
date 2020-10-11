package org.pong.mvcs.view.component 
{
	import feathers.controls.ProgressBar;
	import org.pong.mvcs.view.AbstractScreenView;
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	
	/**
	 * Loading screen is first screen show by screen navigator. It's purpouse is to show user assets loading progress.
	 * 
	 * @author mc
	 */
	public class LoadingScreenView extends AbstractScreenView 
	{
		/**
		 * Progress bar that displays assets loading progress.
		 */
		private var _progressBar:ProgressBar;
		
		/**
		 * Disptched when loading screen is set to stage.
		 */
		private var _startLoadingSignal:ISignal;
		
		/**
		 * Dispatched when all assets have bee loaded.
		 */
		private var _onLoadingCompleateSignal:ISignal;
		
		/**
		 * startLoadingSignal getter. Read only
		 */
		public function get startLoadingSignal():ISignal 
		{
			return _startLoadingSignal;
		}
		
		/**
		 * onLoadingCompleate signal getter. Read only.
		 */
		public function get onLoadingCompleate():ISignal 
		{
			return _onLoadingCompleateSignal;
		}
		
		/**
		 * cosnt
		 */
		public function LoadingScreenView() 
		{
			super();
			
			setSignals();
		}
		
		/**
		 * Signals creator.
		 * 
		 * @private
		 */
		private function setSignals():void
		{
			_startLoadingSignal = new Signal;
			_onLoadingCompleateSignal = new Signal;
		}
		
		/**
		 * Called when view added to stage.
		 */
		override public function added():void
		{
			super.added();
			
			addLoadingProgressBar();
			
			_startLoadingSignal.dispatch();
		}
		
		/**
		 * Progress bar creator;
		 */
		private function addLoadingProgressBar():void
		{			
			//TODO: create custom ProgreessBar component
			
			_progressBar = new ProgressBar();
			
			_progressBar.width = stage.stageWidth * 0.8;
			_progressBar.height = 20;
			
			_progressBar.minimum = 0;
			_progressBar.maximum = 100;
			
			_progressBar.value = 0;
			
			_progressBar.x = (stage.stageWidth - _progressBar.width) / 2;
			_progressBar.y = (stage.stageHeight - _progressBar.height) / 1.1;
			
			this.addChild(_progressBar);
		}

		/**
		 * Called when assets loader updates.
		 * 
		 * @param	value ratio of loaded assets - from 0 to 1.0.
		 */
		public function setProgreesBar(value:Number):void
		{
			_progressBar.value = value * 100;
		}
	}

}