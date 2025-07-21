package robotlegs.bender.bundles.mvcs 
{
	/**
	 * ...
	 * @author Marko (Cetinic) Cettina
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