package  
{
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	/**
	 * ...
	 * @author Ruvipls
	 */
	public class Camera_Level extends Sprite
	{
		
		private var LEVEL:Level;
		
		public function Camera_Level(level_origin:Level) 
		{
			LEVEL = level_origin;
			addEventListener(EnterFrameEvent.ENTER_FRAME, onEnterFrame);
			this.touchable = false;
		}
		
		private function onEnterFrame():void {

			x = ( LEVEL.player.true_x) - LEVEL.GAME.true_width / 2;
			y = ( LEVEL.player.true_y) - LEVEL.GAME.true_height / 2 ;

			
		}
		
	}

}