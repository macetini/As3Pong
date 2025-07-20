package org.pong.utils.graphic
{
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	
	/**
	 * Graphic util provides read only access to graphic resources.
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public final class GraphicUtils
	{
		/**
		 * Injected starling resource manager
		 */
		[Inject]
		public var assetManager:AssetManager;
		
		/**
		 * Ball texture name
		 */
		public const BALL_TEXTURE_NAME:String = "ball";
		
		/**
		 * Paddle texture name
		 */
		public const PADDLE_TEXTURE_NAME:String = "paddle";
		
		/**
		 * Ball image getter
		 */
		public function get ball():Image
		{
			var texture:Texture = assetManager.getTexture(BALL_TEXTURE_NAME);
			
			return new Image(texture);
		}
		
		/**
		 * Paddle image getter.
		 */
		public function get paddle():Image
		{
			var texture:Texture = assetManager.getTexture(PADDLE_TEXTURE_NAME);
			
			return new Image(texture);
		}
	}
}