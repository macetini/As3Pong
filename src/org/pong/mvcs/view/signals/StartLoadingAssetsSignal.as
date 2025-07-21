package org.pong.mvcs.view.signals 
{
	import org.osflash.signals.Signal;
	
	/**
	 * 
	 * Dispatched by LoadingView once it is added to stage. Used to initiates loading assets.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	
	public class StartLoadingAssetsSignal extends Signal 
	{
		public function StartLoadingAssetsSignal() 
		{
			super();
		}
	}

}