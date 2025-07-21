package org.pong.mvcs.view.signals 
{
	import org.osflash.signals.Signal;
	import org.pong.mvcs.vo.BallVO;
	
	/**
	 * 
	 * Dispatched by BallView once the ball hits Paddle. Used to determine new ball direction.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public class BallHitPaddleSignal extends Signal 
	{
		
		/**
		 * @param BallVO initial value object.
		 */
		public function BallHitPaddleSignal() 
		{
			super(BallVO);
		}
		
	}

}