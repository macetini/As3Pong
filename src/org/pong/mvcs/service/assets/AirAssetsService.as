package org.pong.mvcs.service.assets
{
	import flash.filesystem.File;

	import org.pong.mvcs.service.signals.AssetsLoadingCompleteSignal;
	import org.pong.mvcs.service.signals.AssetsLoadingProgressSignal;

	import starling.utils.AssetManager;
	
	/**
	 * 
	 * AirAssetsService provides assets loading functionality. All loaded assets will be available through GraphicUtils.
	 * 
	 * @see org.pong.utils.graphic.GraphicUtils
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public class AirAssetsService implements IAssetsService
	{
		/**
		 * Dispatched while assets are loading.
		 */
		[Inject]
		public var assetsLoadingProgressSignal:AssetsLoadingProgressSignal;
		
		/**
		 * Dispatched when assets are finished loading.
		 */
		[Inject]
		public var assetsLoadingCompleteSignal:AssetsLoadingCompleteSignal;
		
		/**
		 * Injected feathers AssetsManager.
		 */
		[Inject]
		public var assetManager:AssetManager;
		
		//TO-DO: centralize directory location strings
		
		/**
		 * Application directory.
		 */
		public static const DIR_URL:String = "app:/"
		
		/**
		 * Asset director inside application directory.
		 */
		public static const BASE_URL:String = "assets/";
		
		/**
		 * Method queues assets in AssetsManage.
		 * 
		 * @see org.pong.utils.graphic.GraphicUtils
		 */
		public function startAssetsLoading():void
		{
			var assetsUrl:String = DIR_URL + BASE_URL;
			
			var file:File = File.applicationDirectory.resolvePath(assetsUrl);
			assetManager.enqueue(file);
			
			assetManager.verbose = true;
			
			assetManager.loadQueue(loadAssetsProgress);
		}
		
		/**
		 * 
		 * Called while assets loading progress is pending.
		 * 
		 * @event assetsLoadingProgressSignal() is dispatched while loading.
		 * @event assetsLoadingCompleteSignal() is dispatched when service is finished loading.
		 * 
		 * @param	ratio Assets loading ration (from 0 to 1.0).
		 */
		public function loadAssetsProgress(ratio:Number):void
		{
			trace(this + ", Loading assets, progress:", ratio);
		
			assetsLoadingProgressSignal.dispatch(ratio);
			
			if (ratio == 1.0)
				assetsLoadingCompleteSignal.dispatch();
		}
	
	}

}