package org.pong.mvcs.view.signals 
{
	import org.osflash.signals.Signal;
	
	/**
	 * 
	 * Dispatched by BallView once the match ended. Used to deremine new ball direction and calculate new score.
	 *
	 * @author mc
	 */
	public class PlayerWonSignal extends Signal 
	{
		
		/**
		 * @param Array consiting of BallVO initial value object, ScoreVO
		 */
		public function PlayerWonSignal() 
		{
			super(Array);
		}
		
	}

}