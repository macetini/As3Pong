package org.pong.mvcs.view.signals 
{
	import org.osflash.signals.Signal;
	import org.pong.mvcs.vo.BallVO;
	
	/**
	 * 
	 * Dispatched by BallView once the ball hits stage border. Used to determine new ball direction.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public class BallHitWallSignal extends Signal 
	{
		
		/**
		 * @param BallVO initial value object.
		 */
		public function BallHitWallSignal() 
		{
			super(BallVO);
		}
		
	}

}