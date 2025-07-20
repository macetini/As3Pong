package org.pong.mvcs.controller.commands 
{
	import org.pong.mvcs.model.BallModel;
	import org.pong.mvcs.model.HudModel;
	
	/**
	 * 
	 * Command that calls HUD updates and resets the ball position once the match is won.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	
	public class PlayerWonCommand 
	{
		[Inject]
		public var hudModel:HudModel;
		
		[Inject]
		public var ballModel:BallModel;
		
		/**
		 * <code>execute</code> function passes <code>BallVO</code> object to Ball model and boolean value 
		 * (left <code>true</code> or right <code>false</code>) to HUD model so it can differentiate which player won the match.
		 * 
		 * @param Array with two values - Boolean and BallVO
		 **/
		public function execute(playerWonData:Array):void
		{
			trace(this + ", execute()");
			
			hudModel.playerWon(playerWonData[0]);
			
			ballModel.playerWon(playerWonData[1]);
		}
	}

}