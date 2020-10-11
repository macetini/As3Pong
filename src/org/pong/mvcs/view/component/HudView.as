package org.pong.mvcs.view.component 
{
	import feathers.controls.text.TextFieldTextRenderer;
	import flash.text.TextFormat;
	import org.pong.mvcs.view.AbstractScreenView;
	import org.pong.mvcs.vo.ScoreVO;
	
	/**
	 * HUD that displays left and right player scores.
	 * 
	 * @author mc
	 */
	public class HudView extends AbstractScreenView 
	{
		/**
		 * Text font.
		 */
		private var _hudFontName:String = "SourceSansPro";
		
		/**
		 * Font size.
		 */
		private var _hudFontSize:int = 48;
		
		/**
		 * Font color.
		 */
		private var _hudColor:uint = 0xFFFFFF;
		
		/**
		 * Inital hud value - zero.
		 */
		private var _initHudLabelValue:uint = 0;
		
		/**
		 * Left score label.
		 */
		private var _leftHudLabel:TextFieldTextRenderer; 
		
		/**
		 * Right label score.
		 */
		private var _rightHudLabel:TextFieldTextRenderer;
		
		/**
		 * Numerical representation of left score.
		 */
		private var _leftHudLabelValue:uint;
		
		/**
		 * Numerical representation of right score.
		 */
		private var _righHudLabelValue:uint;
		
		/**
		 * Label distance from vertical borders.
		 */
		private var _X_hudPositionFromCenter:int = 75;
		
		/**
		 * Label distances from horizontal borders.
		 */
		private var _Y_hudPositionFromTop:int = 10;
		
		/**
		 * Hud value object
		 */
		private var _vo:ScoreVO;
		
		/**
		 * const
		 */
		public function HudView() 
		{
			super();
			
			createChildren();
		}
		
		/**
		 * Children creator
		 * 
		 * @private
		 */
		private function createChildren():void
		{
			_leftHudLabel = getHudLabel(_initHudLabelValue.toString());	
			_rightHudLabel = getHudLabel(_initHudLabelValue.toString());
		}
		
		/**
		 * 
		 * Hud label creator.
		 * 
		 * @param	string String Text that new label will show.
		 * @return New label with provided text.
		 */
		private function getHudLabel(string:String):TextFieldTextRenderer
		{
			var textFieldTextRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();

			textFieldTextRenderer.textFormat = new TextFormat(_hudFontName, _hudFontSize, _hudColor, null, null, null, null, null, "center");
			
			textFieldTextRenderer.text = string;
			
			return textFieldTextRenderer;
		}
		
		/**
		 * View Creator
		 */
		override public function added():void
		{
			super.added();
			
			setInitaialValues();
			addChildren();
		}
		
		/**
		 * Initial values setter.
		 */
		public function setInitaialValues():void
		{
			_vo = new ScoreVO;
			
			_leftHudLabel.text = _initHudLabelValue.toString();
			_rightHudLabel.text = _initHudLabelValue.toString();
			
			_leftHudLabelValue = _righHudLabelValue = _initHudLabelValue;
		}
		
		/**
		 * Adds child labels.
		 * 
		 *  @private
		 */
		private function addChildren():void
		{
			addLeftHud();
			addRightHud();
		}
		
		/**
		 * Left hud creator.
		 */
		private function addLeftHud():void
		{
			_leftHudLabel.x = 0;
			_leftHudLabel.y = _Y_hudPositionFromTop;
			_leftHudLabel.width = stage.width / 2;
			
			this.addChild(_leftHudLabel);
			_leftHudLabel.flatten();
		}
		
		/**
		 * Right hud creator.
		 */
		private function addRightHud():void
		{
			_rightHudLabel.x = stage.width / 2;
			_rightHudLabel.y = _Y_hudPositionFromTop;
			_rightHudLabel.width = stage.width / 2;
			
			this.addChild(_rightHudLabel);
			_rightHudLabel.flatten();
		}
		
		/**
		 * 
		 * Model updater handler.
		 * 
		 * @param	newVO new value object (new scores) provided by mode.
		 */
		public function hudModelUpdated(newVO:ScoreVO):void
		{
			_vo = newVO;

			_leftHudLabelValue = _vo.leftScore;
				
			_leftHudLabel.text = _leftHudLabelValue.toString();
			
			_righHudLabelValue = _vo.rightScore;
			_rightHudLabel.text = _righHudLabelValue.toString();
		}
	}

}