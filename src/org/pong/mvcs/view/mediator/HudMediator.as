package org.pong.mvcs.view.mediator 
{
	import org.pong.mvcs.model.signals.HudModelUpdatedSignal;
	import org.pong.mvcs.view.AbstractMediator;
	import org.pong.mvcs.view.component.HudView;
	import org.pong.mvcs.vo.ScoreVO;
	
	/**
	 * Hud mediator - handles score calculation signals.
	 * 
	 * @author mc
	 */
	public class HudMediator extends AbstractMediator 
	{
		/**
		 * Dispatched when hud model updated.
		 */
		[Inject]
		public var hudModelUpdatedSignal:HudModelUpdatedSignal;
		
		/**
		 * Constr
		 */
		public function HudMediator() 
		{
			super();
		}
		
		/**
		 * Iternal initialization logic.
		 * 
		 * @private
		 */
		override public function initialize():void
		{
			super.initialize();
			
			setSignals();
		}
		
		
		/**
		 * Signal setter
		 * 
		 * @private
		 */
		private function setSignals():void
		{
			addToSignal(hudModelUpdatedSignal, hudModelUpdated);
		}
		
		/**
		 * 
		 * Hud model update handler - new score is provided by model.
		 * 
		 * @param	newVO New score value object.
		 */
		private function hudModelUpdated(newVO:ScoreVO):void
		{
			view.hudModelUpdated(newVO);
		}
		
		/**
		 * Component view
		 * 
		 * @private
		 */
		protected function get view():HudView
		{
			return HudView(viewComponent);
		}
	}

}