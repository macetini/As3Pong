package org.pong.mvcs.vo 
{
	/**
	 * BallView Value object
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public final class BallVO 
	{
		/**
		 * Ball movement direction along x axis.
		 */
		public var directionX:int = 0;
		
		/**
		 * Ball movement direction along y axis.
		 */
		public var directionY:int = 0;
		
		/**
		 * Ball speed.
		 */
		public var velocity:uint;
		
		/**
		 * x coordinate position
		 */
		public var x:Number;
		
		/**
		 * y coordinate postion
		 */
		public var y:Number;
		
		/**
		 * View width
		 */
		public var width:uint;
		
		/**
		 * View height
		 */
		public var height:uint;
		
		/**
		 * View stage owner width
		 */
		public var stageWidth:uint;
		
		/**
		 * View stage owner height
		 */
		public var stageHeight:uint;
	}

}