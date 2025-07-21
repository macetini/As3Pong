package org.pong.mvcs.view 
{
	import org.pong.utils.graphic.GraphicUtils;

	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * AbstractMediator is base mediator for all Sprite View components.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public class AbstractSpriteView extends Sprite implements IView
	{
		/**
		 * GraphicUtils is AssetsManager util warper that provides easy access to graphic resources.
		 */
		private var _graphicUtils:GraphicUtils;
		
		/**
		 * Graphic image that will represent component
		 */
		private var _graphic:Image;
		
		/**
		 * GraphicUtil getter.
		 */
		public function get graphicUtils():GraphicUtils
		{
			return _graphicUtils;
		}
		
		/**
		 * GraphicUtil setter.
		 */
		public function set graphicUtils(value:GraphicUtils):void 
		{
			_graphicUtils = value;
		}
		
		/**
		 * Graphic getter.
		 */
		public function get graphic():Image 
		{
			return _graphic;
		}
		
		/**
		 * Graphic setter.
		 */
		public function set graphic(value:Image):void 
		{
			_graphic = value;
		}
		
		/**
		 * const
		 */
		public function AbstractSpriteView() 
		{
			super();
			
			this.flatten();
			
			setEventListeners();
		}
		
		/**
		 * Event listeners setter
		 * 
		 * @private
		 */
		protected function setEventListeners():void
		{
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		/**
		 * Internal listener
		 * 
		 * @private
		 */
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			added();
		}	
		
		/**
		 * 
		 * Called once component is added to stage
		 */
		public function added():void
		{
			trace( this + ", added()" );
		}

		
		/**
		 * Internal listener
		 * 
		 * @private
		 */
		private function onRemovedFromStage(event:Event):void
		{
			this.removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			
			removed();
		}
		
		/**
		 * Destructor
		 * 
		 * @private
		 */
		public function removed():void
		{
			trace( this + ", removed()" );
			
			this.dispose();
		}
		
		
		/**
		 * 
		 * Called once every frame as response to a Tick signal.
		 * 
		 * @param	passedTime Time passed since the last tick
		 */
		public function update(passedTime:Number):void
		{
		}		
	}

}