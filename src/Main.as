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
	 * ...
	 * @author Marko (Cetinic) Cettina
	 */
	
	[SWF(width = "800", height = "600", frameRate = "60", backgroundColor = "#4A4137")]
	
	public class Main extends Sprite
	{	
		public function Main():void
		{
			if (stage != null) {
				init();
			} else {
				this.addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event=null):void
		{			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			const starling:Starling = new Starling(StarlingGameView, stage, null, null, Context3DRenderMode.AUTO);
			starling.showStats = true;
			starling.start();
			
			const context:IContext = new Context()
			.install(MVCSBundle, StarlingViewMapExtension, SignalCommandMapExtensionBundle)
			.configure(AppConfig, new ContextView(this), starling);
		}
	}
}