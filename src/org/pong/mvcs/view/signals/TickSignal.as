package org.pong.mvcs.view.signals 
{
	import org.osflash.signals.Signal;
	
	/**
	 * 
	 * Dispatched by StarlingStageView once a frame. Tick signal is handled by all views to call update() function.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public class TickSignal extends Signal 
	{
		
		public function TickSignal() 
		{
			super(Number);
		}
		
	}

}