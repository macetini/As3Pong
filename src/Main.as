package
{
	import flash.display3D.Context3DRenderMode;
	import org.pong.mvcs.AppConfig;
	import org.pong.mvcs.view.component.StarlingGameView;
	import robotlegs.bender.bundles.mvcs.SignalCommandMapExtensionBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	import robotlegs.bender.extensions.starlingViewMap.StarlingViewMapExtension;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author mc
	 */
	
	[SWF(width = "800", height = "600", frameRate = "60", backgroundColor = "#4A4137")]
	
	public class Main extends Sprite
	{
		protected var _context:IContext;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event=null):void
		{			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			const starling:Starling = new Starling(StarlingGameView, stage, null, null, Context3DRenderMode.AUTO);
			starling.showStats = true;
			starling.start();
			
			_context = new Context()
			.install(MVCSBundle, StarlingViewMapExtension, SignalCommandMapExtensionBundle)
			.configure(AppConfig, new ContextView(this), starling);
		}
	}
}