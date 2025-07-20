package org.pong.mvcs.model.signals 
{
	import org.osflash.signals.Signal;
	import org.pong.mvcs.vo.BallVO;
	
	/**
	 * 
	 * Signal dispatched from Ball Model to Ball View when model finishes it's work - recalculation of new Ball direction.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public class BallModelUpdatedSignal extends Signal 
	{
		/**
		 * @param ballVO - current ball view value object.
		 */
		public function BallModelUpdatedSignal() 
		{
			super(BallVO);
		}
		
	}

}