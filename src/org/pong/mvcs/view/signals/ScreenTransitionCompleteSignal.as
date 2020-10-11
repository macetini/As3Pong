package org.pong.mvcs.view.signals 
{
	import org.osflash.signals.Signal;
	
	/**
	 * 
	 * Dispatched by StarligStageView once screen transition is done. Used to change from loading game state to 
	 * transition game state.
	 * 
	 * @author mc
	 */
	public class ScreenTransitionCompleteSignal extends Signal 
	{
		
		public function ScreenTransitionCompleteSignal() 
		{
			super();
		}
		
	}

}