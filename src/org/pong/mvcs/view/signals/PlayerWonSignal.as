package org.pong.mvcs.view.signals 
{
	import org.osflash.signals.Signal;
	
	/**
	 * 
	 * Dispatched by BallView once the match ended. Used to determine new ball direction and calculate new score.
	 *
	 * @author Marko (Cetinic) Cettina
	 */
	public class PlayerWonSignal extends Signal 
	{
		
		/**
		 * @param Array constituting of BallVO initial value object, ScoreVO
		 */
		public function PlayerWonSignal() 
		{
			super(Array);
		}
		
	}

}