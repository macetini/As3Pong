package org.pong.mvcs.view.signals 
{
	import org.osflash.signals.Signal;
	
	/**
	 * 
	 * Disptched by LoadingView once it is added to stage. Used to initiates loading assets.
	 * 
	 * @author mc
	 */
	
	public class StartLoadingAssetsSignal extends Signal 
	{
		public function StartLoadingAssetsSignal() 
		{
			super();
		}
	}

}