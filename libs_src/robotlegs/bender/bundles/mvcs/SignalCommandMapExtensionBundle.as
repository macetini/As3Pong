package robotlegs.bender.bundles.mvcs 
{
	/**
	 * ...
	 * @author mc
	 */
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;

	public class SignalCommandMapExtensionBundle implements IExtension
	{
		public function extend( context:IContext ):void {
			context.install( SignalCommandMapExtension );
		}
	}

}