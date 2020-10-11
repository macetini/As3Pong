package org.pong.mvcs.view 
{
	import org.pong.mvcs.model.signals.UpdateViewsSignal;
	import org.pong.mvcs.view.signals.TickSignal;
	import org.pong.utils.graphic.GraphicUtils;
	import robotlegs.bender.extensions.starlingViewMap.impl.SignalMediator;
	
	/**
	 * 
	 * AbstractMediator is base mediator for all Screen View components.
	 * 
	 * @author mc
	 */
	
	public class AbstractMediator extends SignalMediator 
	{	
		/**
		 * Update view signal is responset Tick signl, it calls view update function.
		 */
		[Inject]
		public var updateViewSignal:UpdateViewsSignal;
		
		/**
		 * GraphicUtils is AssetsManager util waper that privides easy access to graphic resources.
		 */
		[Inject]
		public var graphicUtils:GraphicUtils;
		
		/**
		 * const
		 */
		public function AbstractMediator() 
		{
			super();
		}
		
		/**
		 * Initalize function - used to set inital values.
		 */
		override public function initialize():void
		{
			super.initialize();
			
			trace( this + ", initialize()" );
			
			setUtils();
			setSignals();
		}
		
		/**
		 * Sets mediator utils
		 * 
		 * @private
		 */
		private function setUtils():void
		{
			baseView.graphicUtils = graphicUtils;
		}
		
		/**
		 * Sets mediator signals
		 * 
		 * @private
		 */
		private function setSignals():void
		{
			addToSignal(updateViewSignal, baseView.update);
		}

		/**
		 * Destructor
		 * 
		 *  @private
		 */
		override public function destroy():void
		{
			trace( this + ", destroy()" );
			
			super.destroy();
		}
		
		/**
		 * BaseComponent view
		 * 
		 *  @private
		 */
		private function get baseView():IView
		{
			return IView(viewComponent);
		}
	}

}