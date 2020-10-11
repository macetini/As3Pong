package org.pong.mvcs.service.signals 
{
	import org.osflash.signals.Signal;
	
	/**
	 * 
	 * Dispatched during assets loading progress. Contains loading progress information.
	 * 
	 * @see org.pong.mvcs.service.assets.AirAssetsService.loadAssetsProgress(ratio:Number):void
	 * @author mc
	 */
	public class AssetsLoadingProgressSignal extends Signal 
	{
		public function AssetsLoadingProgressSignal() 
		{
			super(Number);
		}
	}

}