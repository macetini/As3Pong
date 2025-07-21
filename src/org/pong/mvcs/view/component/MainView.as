package org.pong.mvcs.view.component
{
	import org.pong.components.NetShape;
	import org.pong.mvcs.view.AbstractScreenView;
	import org.pong.mvcs.view.component.paddle.LeftPaddleView;
	import org.pong.mvcs.view.component.paddle.RightPaddleView;
	
	/**
	 * 
	 * MainView holds all interactive components. It is a place where the game is played.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public class MainView extends AbstractScreenView
	{
		/**
		 * Ball component
		 */
		private var _ball:BallView;
		
		/**
		 * Interactive Paddle component.
		 */
		private var _leftPaddle:LeftPaddleView;
		
		/**
		 * Interactive Paddle component
		 */
		private var _rightPaddle:RightPaddleView;
		
		/**
		 * HUD
		 */
		private var _hud:HudView
		
		/**
		 * Net shape in the middle of screen
		 */
		private var _netShape:NetShape;
		
		/**
		 * Const
		 */
		public function MainView()
		{
			super();
			
			createChildren();
		}
		
		/**
		 * Children creator
		 */
		private function createChildren():void
		{
			trace(this + " createChildren()");
			
			_ball = new BallView();
			_leftPaddle = new LeftPaddleView;
			_rightPaddle = new RightPaddleView;
			_hud = new HudView;
			_netShape = new NetShape;
		}
		
		/**
		 * Called when view added to screen.
		 */
		override public function added():void
		{
			super.added();
			
			addChildren();
		}
		
		/**
		 * Call when adding all game components.
		 * 
		 * @private
		 */
		private function addChildren():void
		{
			trace(this + " addChildren()");
			
			this.addChild(_netShape);
			this.addChild(_ball);
			this.addChild(_leftPaddle);
			this.addChild(_rightPaddle);
			this.addChild(_hud);
		}
		
		/**
		 * View updater
		 * 
		 * @param	passedTime Time passed since the last update.
		 */
		override public function update(passedTime:Number):void
		{
			super.update(passedTime);
			
			checkForBallCollision();
		}
		
		/**
		 * Will check if ball collides with any of the paddles.
		 */
		private function checkForBallCollision():void
		{
			if (checkBallForPaddleHit(_ball, _leftPaddle))
			{
				_ball.x = _leftPaddle.x + _leftPaddle.width;
				_ball.hitByPaddleFlag = true;
			}
			
			if (checkBallForPaddleHit(_ball, _rightPaddle))
			{
				_ball.x = _rightPaddle.x - _ball.width;
				_ball.hitByPaddleFlag = true;
			}
		}
		
		/**
		 * 
		 * Checks if provided ball and paddle collide.
		 * 
		 * @param	ball Ball View
		 * @param	paddle Any of two paddles.
		 * @return <code>true</code> if the do collide else <code>else</code>
		 */
		private function checkBallForPaddleHit(ball:BallView, paddle:AbstractPaddleView):Boolean
		{
			return ball.getBounds(ball.parent).intersects(paddle.getBounds(paddle.parent));
		}
	}
}