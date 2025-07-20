package org.pong.mvcs.model 
{
	import org.pong.mvcs.model.signals.HudModelUpdatedSignal;
	import org.pong.mvcs.vo.ScoreVO;
	
	/**
	 * 
	 * Hud model that keeps track of game score.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public class HudModel 
	{
		/**
		 * Current score Value object.
		 */
		private var _vo:ScoreVO;
		
		/**
		 * Left player score.
		 */
		private var _leftScore:uint = 0;
		
		/**
		 * Right player score.
		 */
		private var _rightScore:uint = 0;
		
		/**
		 * 
		 * Dispatched to view when model is finished with score calculation.
		 * 
		 */
		[Inject]
		public var hudModelUpdatedSignal:HudModelUpdatedSignal;
		
		/**
		 * 
		 * Creates new current score value object.
		 * 
		 * @return Current score value object.
		 */
		public function createVO():ScoreVO
		{
			var newVO:ScoreVO = new ScoreVO;
			
			newVO.leftScore = _leftScore;
			newVO.rightScore = _rightScore;
			
			return newVO;
		}
		
		/**
		 * 
		 * Calculates new score.
		 * 
		 * @event hudModelUpdatedSignal() dispatched when new score is calculated.
		 * 
		 * @param	leftPlayerWon If <code>true</code> then left player score will be increments else right player score will.
		 */
		public function playerWon(leftPlayerWon:Boolean):void
		{
			if (leftPlayerWon)
				_leftScore++;
			else
				_rightScore++;
				
			_vo = createVO();
			
			hudModelUpdatedSignal.dispatch(_vo);
		}
	}

}