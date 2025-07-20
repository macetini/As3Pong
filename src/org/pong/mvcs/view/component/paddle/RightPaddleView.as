package org.pong.mvcs.view.component.paddle 
{
	import flash.ui.Keyboard;
	import org.pong.mvcs.view.component.AbstractPaddleView;
	
	/**
	 * More specialized child of AbstractPaddleView object.
	 * 
	 * @see org.pong.mvcs.view.component.AbstractPaddleView
	 * 
	 * @author Marko (Cetinic) Cettina
	 */
	public class RightPaddleView extends AbstractPaddleView 
	{	
		public function RightPaddleView() 
		{
			super();
		}
		
		/**
		 * 
		 * Definition of upward movement key.
		 * 
		 * @return KeyCode that will initiate upward movment of paddle object. Define to move up.
		 */
		override protected function setKeyCodeUp():uint
		{
			return Keyboard.UP;
		}
		
		/**
		 * 
		 *  Definition of downward movement key.
		 * 
		 * @return KeyCode that will initiate downward movment of paddle object. Define to move down.
		 */
		override protected function setKeyCodeDown():uint
		{
			return Keyboard.DOWN;
		}
		
		/**
		 * Called to set inital view values - like position. 
		 */
		override public function setInitaialValues():void
		{
			this.x = stage.width - xPosition;
			this.y = stage.height / 2 - this.height / 2;
		}
	}

}