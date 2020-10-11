package org.pong.mvcs.view.mediator
{
	import org.pong.mvcs.model.signals.BallModelUpdatedSignal;
	import org.pong.mvcs.view.AbstractMediator;
	import org.pong.mvcs.view.component.BallView;
	import org.pong.mvcs.view.signals.BallAddedToStageSignal;
	import org.pong.mvcs.view.signals.BallHitPaddleSignal;
	import org.pong.mvcs.view.signals.BallHitWallSignal;
	import org.pong.mvcs.view.signals.PlayerWonSignal;
	import org.pong.mvcs.vo.BallVO;
	
	/**
	 * View Mediator - handles signal disptching.
	 * 
	 * @author mc
	 */
	
	public class BallMediator extends AbstractMediator
	{
		/**
		 * Dispatched once when added to stage.
		 */
		[Inject]
		public var ballAddedToStageSignal:BallAddedToStageSignal;
		
		/**
		 * Disptched when ball hits the wall.
		 */
		[Inject]
		public var ballHitWallSignal:BallHitWallSignal;
		
		/**
		 * Dispatched when ball hits the paddle.
		 */
		[Inject]
		public var ballHitPaddleSignal:BallHitPaddleSignal;
		
		/**
		 * Dispatched if model was updated.
		 */
		[Inject]
		public var ballModelUpdatedSignal:BallModelUpdatedSignal;
		
		/**
		 * Dispatched if one player won the match.
		 */
		[Inject]
		public var playerWonSignal:PlayerWonSignal;
		
		/**
		 * constr
		 */
		public function BallMediator()
		{
			super();
		}
		
		/**
		 * Internal initialization logic
		 * 
		 * @private
		 */
		override public function initialize():void
		{
			super.initialize();
			
			setSignals();
		}
		
		/**
		 * Signals setter.
		 * 
		 * @private
		 */
		private function setSignals():void
		{
			addOnceToSignal(view.ballAddedToStageSignal, ballAddedToStage);
			
			addToSignal(view.ballHitWallSignal, ballHitWall);
			addToSignal(view.ballHitPaddleSignal, ballHitPaddle);
			
			addToSignal(view.playerWonSignal, playerWon);
			
			addToSignal(ballModelUpdatedSignal, view.ballModelUpdated);
		}
		
		/**
		 * ballAddedToStageSignal dispatcher.
		 * 
		 * @param	vo	Current value object
		 */
		private function ballAddedToStage(vo:BallVO):void
		{
			ballAddedToStageSignal.dispatch(vo);
		}
		
		/**
		 * ballHitWall dispatcher.
		 * 
		 * @param	vo	Current value object
		 */
		private function ballHitWall(vo:BallVO):void
		{
			ballHitWallSignal.dispatch(vo);
		}
		
		/**
		 * ballHitPaddle dispatcher.
		 * 
		 * @param	vo	Current value object
		 */
		private function ballHitPaddle(vo:BallVO):void
		{
			ballHitPaddleSignal.dispatch(vo);
		}
		
		/**
		 * playerWon dispatcher.
		 * 
		 * @param	playerWonData	Array composed of two values - left player won flag and ScoreVO
		 */
		private function playerWon(playerWonData:Array):void
		{
			playerWonSignal.dispatch(playerWonData);
		}
		
		/**
		 * view getter
		 * 
		 * @private
		 */
		protected function get view():BallView
		{
			return BallView(viewComponent);
		}
	
	}
}
