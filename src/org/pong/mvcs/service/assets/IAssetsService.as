package org.pong.mvcs.service.assets 
{
	/**
	 * 
	 * Interface that declares assets loading behavior.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	
	public interface IAssetsService 
	{
		/**
		 * 
		 */
		function startAssetsLoading():void;
		
		/**
		 * 
		 * Loading assets behavior.
		 * 
		 * @param	ratio Ration represent the loading progress.
		 */
		function loadAssetsProgress(ratio:Number):void;
	}
	
}