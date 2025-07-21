package org.pong.mvcs.view.signals 
{
	import org.osflash.signals.Signal;
	import org.pong.mvcs.vo.BallVO;
	
	/**
	 * 
	 * Dispatched by BallView once added to stage. Used to determine ball view initial values.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public class BallAddedToStageSignal extends Signal 
	{
		/**
		 * @param BallVO initial value object.
		 */
		public function BallAddedToStageSignal() 
		{
			super(BallVO);
		}
		
	}

}