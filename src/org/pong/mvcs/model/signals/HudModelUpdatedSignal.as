package org.pong.mvcs.model.signals 
{
	import org.osflash.signals.Signal;
	import org.pong.mvcs.vo.ScoreVO;
	
	/**
	 * 
	 * Signal dispached to view when Hud model finishes calculation of new score.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public class HudModelUpdatedSignal extends Signal 
	{
		/**
		 * @param ballVO - current score view value object.
		 */
		public function HudModelUpdatedSignal() 
		{
			super(ScoreVO);	
		}
		
	}

}