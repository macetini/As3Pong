package org.pong.mvcs.view.signals 
{
	import org.osflash.signals.Signal;
	
	/**
	 * 
	 * Dispatched by Starling Stage View once screen transition is done. Used to change from loading game state to
	 * transition game state.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public class ScreenTransitionCompleteSignal extends Signal 
	{
		
		public function ScreenTransitionCompleteSignal() 
		{
			super();
		}
		
	}

}