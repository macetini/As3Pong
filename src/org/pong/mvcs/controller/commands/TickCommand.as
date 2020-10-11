package org.pong.mvcs.controller.commands 
{
	import org.pong.mvcs.model.StarlingGameModel;
	
	/**
	 *
	 * <code>TickCommand</code> updates <code>StarlingGameModel</code>. Each tick represents signal sent from view.
	 * Signals are dispatched inside <code>Event.ENTER_FRAME</code> handler, so basically it is called once per 
	 * every frame.
	 * 
	 * @author mc
	 */
	
	public class TickCommand 
	{
		[Inject]
		public var starlinGameModel:StarlingGameModel;
		
		/**
		 * 
		 * @param	passedTime Time passed since the last tick.
		 */
		public function execute(passedTime:Number):void
		{		
			starlinGameModel.updateViewObjects(passedTime);
		}
	}
}