package org.pong.mvcs.service.assets 
{
	
	/**
	 * 
	 * Interface that declares aseets loading behavior.
	 * 
	 * @author mc
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