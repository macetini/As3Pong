package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display3D.Context3DRenderMode;
	import flash.events.Event;

	import org.pong.mvcs.AppConfig;
	import org.pong.mvcs.view.component.StarlingGameView;

	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.bundles.mvcs.SignalCommandMapExtensionBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.starlingViewMap.StarlingViewMapExtension;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;

	import starling.core.Starling;
	
	/**
	 * Main entry point for the As3Pong application.
	 * 
	 * This class sets up the Flash stage, initializes the Starling framework,
	 * and configures the Robotlegs context with the necessary extensions and application configuration.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	
	[SWF(width = "800", height = "600", frameRate = "60", backgroundColor = "#4A4137")]
	
	public class Main extends Sprite
	{	
		/**
		 * Constructor.
		 * Checks if the stage is available; if not, waits for the ADDED_TO_STAGE event before initializing.
		 */
		public function Main():void
		{
			if (stage != null) {
				init();
			} else {
				this.addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		/**
		 * Initializes the application.
		 * Sets stage alignment and scale mode, creates and starts the Starling framework,
		 * and sets up the Robotlegs context with required bundles and configuration.
		 * 
		 * @param e Optional Event parameter for ADDED_TO_STAGE event.
		 */
		private function init(e:Event=null):void
		{			
			// Align stage to top left and disable scaling
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			// Initialize Starling with the main game view
			const starling:Starling = new Starling(StarlingGameView, stage, null, null, Context3DRenderMode.AUTO);
			starling.showStats = true; // Display Starling performance stats
			starling.start(); // Start Starling rendering
			
			// Set up Robotlegs context and install required bundles/extensions
			const context:IContext = new Context()
				.install(MVCSBundle, StarlingViewMapExtension, SignalCommandMapExtensionBundle)
				.configure(AppConfig, new ContextView(this), starling);
		}
	}
}
