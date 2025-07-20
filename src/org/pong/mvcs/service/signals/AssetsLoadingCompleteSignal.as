package org.pong.mvcs.service.signals 
{
	import org.osflash.signals.Signal;
	
	/**
	 * Dispached when all assets finished loading.
	 * 
	 * @see org.pong.mvcs.service.assets.AirAssetsService.loadAssetsProgress(ratio:Number):void
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public class AssetsLoadingCompleteSignal extends Signal 
	{
		
		public function AssetsLoadingCompleteSignal() 
		{
			super();
		}
		
	}

}