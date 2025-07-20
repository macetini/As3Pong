package org.pong.components 
{	
	import starling.display.Shape;
	import starling.events.Event;
	
	/**
	 * Custom Shape Component that should represent the net in Pong game. Basically, just straight white line in the
	 * middle of screen.
	 * 
	 * @author Marko (Cetinic) Cettina
	 * 
	 */
	
	public class NetShape extends Shape
	{
		/**
		 * Net shape color.
		 */
		private var _netColor:uint = 0xFFFFFF;
		
		/**
		 * New shape width.
		 */
		private var _netWidth:int = 6;
		
		public function NetShape() 
		{
			super();
		
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		/**
		 * 
		 * Internal shape calculation.
		 * 
		 * @private
		 */
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			this.graphics.beginFill(_netColor);
			this.graphics.lineStyle(1, _netColor);			
			
			this.graphics.drawRect(stage.width / 2 - _netWidth / 2, 0, _netWidth, stage.height);
			this.graphics.endFill();
			
		}
		
	}

}