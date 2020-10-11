package org.pong.mvcs.view.signals 
{
	import org.osflash.signals.Signal;
	
	/**
	 * 
	 * Disptched by StarlingStageView once a frame. Tick signla is handeled by all views to call update() function.
	 * 
	 * @author mc
	 */
	public class TickSignal extends Signal 
	{
		
		public function TickSignal() 
		{
			super(Number);
		}
		
	}

}