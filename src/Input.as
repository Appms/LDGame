package  
{
	import starling.events.KeyboardEvent;
	/**
	 * ...
	 * @author Pol
	 */
	public class Input
	{
		
		private static const NUM_KEYS:int = 12;
		
		public static const UP:int = 0;
		public static const DOWN:int = 1;
		public static const LEFT:int = 2;
		public static const RIGHT:int = 3;
		
		public static const ENTER:int = 4;
		public static const SPACE:int = 5;
		
		public static const O:int = 6;
		public static const P:int = 7;
		
		public static const UP2:int = 8;
		public static const DOWN2:int = 9;
		public static const LEFT2:int = 10;
		public static const RIGHT2:int = 11;
		
		public static var keys:Array;
		public static var pkeys:Array;
		
		public static var last_p:String = "null";
		
		public static function init():void {
			var i:int;
			
			keys = new Array();
			for (i = 0; i < NUM_KEYS; i++) keys[i] = false;
			pkeys = new Array();
			for (i = 0; i < NUM_KEYS; i++) pkeys[i] = false;
		}
		
		public static function onKeyDown(event:KeyboardEvent):void {
			var key:int = event.keyCode;
			
			if (key == 65) keys[LEFT] = true;
			if (key == 68) keys[RIGHT] = true;
			if (key == 83) keys[DOWN] = true;
			if (key == 87) keys[UP] = true;
			if (key == 13) keys[ENTER] = true;
			if (key == 32) keys[SPACE] = true;
			if (key == 79) keys[O] = true;
			if (key == 80) keys[P] = true;
			if (key == 37) keys[LEFT2] = true;
			if (key == 39) keys[RIGHT2] = true;
			if (key == 40) keys[DOWN2] = true;
			if (key == 38) keys[UP2] = true;
		}
		
		public static function onKeyUp(event:KeyboardEvent):void {
			var key:int = event.keyCode;
			
			if (key == 65) keys[LEFT] = false;
			if (key == 68) keys[RIGHT] = false;
			if (key == 83) keys[DOWN] = false;
			if (key == 87) keys[UP] = false;
			if (key == 13) keys[ENTER] = false;
			if (key == 32) keys[SPACE] = false;
			if (key == 79) keys[O] = false;
			if (key == 80) keys[P] = false;
			if (key == 37) keys[LEFT2] = false;
			if (key == 39) keys[RIGHT2] = false;
			if (key == 40) keys[DOWN2] = false;
			if (key == 38) keys[UP2] = false;
		}
		
		public static function update():void {
			last_p = "null";
			var i:int;
			for (i = 0; i < NUM_KEYS; i++) {
				if (!pkeys[i] && keys[i]) { last_p = ""+i; }
				pkeys[i] = keys[i];
			}
		}
		
		public static function isDown(key:int):Boolean {
			return keys[key];
		}
		
		public static function isPressed(key:int):Boolean {
			return (keys[key] && !pkeys[key]);
		}
		
	}

}