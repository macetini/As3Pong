package org.pong.mvcs.view.component
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.pong.mvcs.view.AbstractSpriteView;
	import org.pong.mvcs.vo.BallVO;
	
	/**
	 * 
	 * Ball view represents ball that moves through screen. If the ball touches one of the stage borders than it 
	 * should be bounced in another direction. If it hits one of the paddles than it should also be bounced. If ball
	 * touches one of vertical bounds than it should restart it's position. BallModel provides new directions based on provided values. BalView 
	 * it self just moves ball in one direction, it doesn't calculate any direction logic.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public class BallView extends AbstractSpriteView
	{
		/**
		 * Initial ball movement delay when the main screen is shown. Used so user would have little
		 * time to understand it's surroundings.
		 */
		private var _initialDelay:Number = 0.3;
		
		/**
		 * Ball movement delay when match is restarted.
		 */
		private var _initialDelayAfterReset:Number = 0.2;
		
		/**
		 * Ball speed.
		 */
		private var _velocity:uint = 400;
		
		/**
		 * Ball movement direction along x axis.
		 */
		private var _directionX:int = 0;
		
		/**
		 * Ball movement direction along y axis.
		 */
		private var _directionY:int = 0;

		/**
		 * Ball value object.
		 */
		private var _vo:BallVO;
		
		/**
		 * Dispatched when view added to stage.
		 */
		private var _ballAddedToStageSignal:ISignal;
		
		/**
		 * Dispatched when pall hits stage border.
		 */
		private var _ballHitWallSignal:ISignal;
		
		/**
		 * Dispatched when ball hists paddle.
		 */
		private var _ballHitPaddleSignal:ISignal;
		
		/**
		 * Dispatched when ball hits top right or top left stage border - when match is won.
		 */
		private var _playerWonSignal:ISignal;
		
		/**
		 * Hit paddle flag.
		 * 
		 * @see update()
		 */
		private var _hitByPaddleFlag:Boolean = false;
	
		/**
		 * addedToStageSignal getter. Read only.
		 */
		public function get ballAddedToStageSignal():ISignal
		{
			return _ballAddedToStageSignal;
		}
		
		/**
		 * ballHitWallSignal getter. Read only.
		 */
		public function get ballHitWallSignal():ISignal
		{
			return _ballHitWallSignal;
		}
		
		/**
		 * ballHitPaddleSignal getter. Read only.
		 */
		public function get ballHitPaddleSignal():ISignal
		{
			return _ballHitPaddleSignal;
		}
		
		/**
		 * Player won signal getter. Read only.
		 */
		public function get playerWonSignal():ISignal 
		{
			return _playerWonSignal;
		}
		
		/**
		 * hitByPaddleFlag getter
		 */
		public function get hitByPaddleFlag():Boolean 
		{
			return _hitByPaddleFlag;
		}
		
		/**
		 * hitByPaddleFlag setter
		 */
		public function set hitByPaddleFlag(value:Boolean):void 
		{
			_hitByPaddleFlag = value;
		}
		
		/**
		 * const
		 */
		public function BallView():void
		{
			super();

			setSignals();
		}
		
		/**
		 * Signals creator.
		 * 
		 * @private
		 */
		private function setSignals():void
		{
			_ballAddedToStageSignal = new Signal();
			
			_ballHitWallSignal = new Signal();
			_ballHitPaddleSignal = new Signal();
			
			_playerWonSignal = new Signal();
		}
		
		/**
		 * 
		 * Model update handle
		 * 
		 * @param	vo Ball value object with new direction provided by model.
		 */
		public function ballModelUpdated(vo:BallVO):void
		{
			trace(this + " ballModelUpdated()");
			
			_vo = vo;
			
			this.x = _vo.x;
			this.y = _vo.y;
			
			this._directionX = _vo.directionX;
			this._directionY = _vo.directionY;
		}
		
		/**
		 * Added handler. Sets graphics and initial values.
		 * 
		 * @event ballAddedToStageSignal is dispatched when called.
		 */
		override public function added():void
		{
			super.added();
			
			setGraphic();
			setInitialValues();
			
			_ballAddedToStageSignal.dispatch(_vo);
		}
		
		/**
		 * Graphic setter. Sets image.
		 * 
		 * @private
		 */
		private function setGraphic():void
		{
			graphic = graphicUtils.ball;
			this.addChild(graphic);
			
			this.width = graphic.width;
			this.height = graphic.height;
		}
		
		/**
		 * Initial values setter. Sets ball view to the middle of screen.
		 */
		public function setInitialValues():void
		{
			this.x = stage.width / 2 - this.width / 2 ;
			this.y = stage.height / 2 - this.height / 2;
			
			this._directionX = 0;
			this._directionY = 0;
			
			_vo = new BallVO;
			_vo = updateNewVO();
		}
		
		/**
		 * View updater. Check if border collision happened.
		 * 
		 * @param	passedTime Time passed since the last update.
		 */
		override public function update(passedTime:Number):void
		{
			super.update(passedTime);
					
			if (checkForInitialDelay(passedTime))
				return;
				
			if (_hitByPaddleFlag)
			{
				sendBallHitPaddleSignal();
				return;
			}
			
			if (checkWallHit())
				return;
			
			updateBallMovement(passedTime);
		}
		
		/**
		 * 
		 * Initial view update delay counter. Counts delay time. When the time runs out view updates continue.
		 * Used to allow small delay between matches or when game starts.
		 * 
		 * @param	passedTime
		 * @return <code>true</code> if time run out else <code>false</code>.
		 */
		private function checkForInitialDelay(passedTime:Number):Boolean
		{
			if (_initialDelay > 0)
			{
				_initialDelay -= passedTime;
				return true;
			}else
				return false;
		}
		
		/**
		 * 
		 * Value object updater. Value object will be set to current view values. Used before sending value object
		 * to the model. This way the model will be provided with latest values.
		 * 
		 * @return Updated value object.
		 */
		private function updateNewVO():BallVO
		{
			//TODO - this needs to be dynamic
			
			trace(this + " updateNewVO()");
			var vo:BallVO = new BallVO;
			
			vo.velocity = _velocity;
			
			vo.x = this.x;
			vo.y = this.y;
			
			vo.stageHeight = stage.height;
			vo.stageWidth = stage.width;
			
			vo.width = this.width;
			vo.height = this.height;
			
			vo.directionX = this._directionX;
			vo.directionY = this._directionY;
			
			return vo;
		}
		
		/**
		 * Called when ball hit paddle.
		 * 
		 * @event ballHitPaddleSignal sent.
		 */
		private function sendBallHitPaddleSignal():void
		{
			_hitByPaddleFlag = false;
			
			_ballHitPaddleSignal.dispatch(updateNewVO());
		}
		
		/**
		 * 
		 * Check if the ball touches one of stage bounds.
		 * 
		 * @return <code>true</code> if it does touch one of border else <code>false</code>.
		 */
		private function checkWallHit():Boolean
		{
			var ballOutsideVerticalBounds:Boolean = this.x + this.width >= stage.width || this.x <= 0;
			var ballOutsideHorizontalBounds:Boolean = this.y + this.height >= stage.height || this.y <= 0;
						
			if (ballOutsideVerticalBounds)
			{				
				sendPlayerWonSignal(this.x <= 0)
				return true;
				
			}else if (ballOutsideHorizontalBounds)
			{
				sendBallHitWallSignal();
				return true;
			}
			
			return false;
		}
		
		/**
		 * 
		 * Called if ball touches vertical stage bounds. 
		 * 
		 * @event sendBallHitWallSignal()
		 * 
		 * @param	leftPlayerWon
		 */
		private function sendPlayerWonSignal(leftPlayerWon:Boolean):void
		{
			trace(this + " sendPlayerWonSignal()");
			
			_initialDelay = _initialDelayAfterReset;
			
			setInitialValues
			
			_playerWonSignal.dispatch([leftPlayerWon, _vo]);
		}
		
		/**
		 * 
		 * Called if ball touches horizontal stage bounds. 
		 * 
		 * @event sendBallHitWallSignal() if ball touches horizontal bounds.
		 */
		private function sendBallHitWallSignal():void
		{	
			_ballHitWallSignal.dispatch(updateNewVO());
		}

		private function updateBallMovement(passedTime:Number):void
		{
			this.x += _directionX * _velocity * passedTime;
			this.y += _directionY * _velocity * passedTime;
		}
	}
}
