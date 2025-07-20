package org.pong.mvcs.controller.bootstraps
{
	import org.pong.mvcs.service.assets.AirAssetsService;
	import org.pong.mvcs.service.assets.IAssetsService;
	import robotlegs.bender.framework.api.IInjector;
	
	/**
	 * 
	 * Bootstrap dependency injector for all Services.
	 * 
	 * @see org.pong.mvcs.AppConfig
	 * @author Marko (Cetinic) Cettina
	 */
  
	public class BootstrapServices
    {
		
        public function BootstrapServices(injector:IInjector)
        {
			injector.map(IAssetsService).toSingleton(AirAssetsService);
        }
    }

}