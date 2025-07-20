package org.pong.mvcs.controller.commands
{
	import org.pong.mvcs.model.StarlingGameModel;
	import org.pong.mvcs.service.assets.IAssetsService;
	
	/**
	 * 
	 * Command called when game is started, it initiates loading of all graphical assets.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	
	public class StartLoadingAssetsCommand
	{
		[Inject]
		public var assetsService:IAssetsService;
		
		[Inject]
		public var starlingGameModel:StarlingGameModel;
		
		public function execute():void
		{
			trace(this + ", execute()");
			
			starlingGameModel.startAssetsLoading();
			assetsService.startAssetsLoading();
		}
	}
}