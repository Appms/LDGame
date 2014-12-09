package  
{
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	/**
	 * ...
	 * @author Ruvipls
	 */
	public class Game extends Sprite
	{
		
		public var true_width:int = 800;
		public var true_height:int = 600;
		public var true_x:int = 0;
		public var true_y:int = 0;
		
		public var MENU:int = 0;
		public var LEVEL1:int = 1;
		//public var CARGANDO:int = 2;
		//public var GAME_OVER:int = 3;
		public var currentState:State;
		public var States:Array = new Array();
		
		public function Game() 
		{
			Input.init();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(EnterFrameEvent.ENTER_FRAME, onEnterFrame);
			addEventListener(KeyboardEvent.KEY_UP, Input.onKeyUp);
			addEventListener(KeyboardEvent.KEY_DOWN, Input.onKeyDown);
			//this.touchable = false;
		}
		
		private function onAddedToStage():void {
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			//States.push(new Menu(this));
			//States.push(new Level(this, PROFUNDIDAD + 1));
			//States.push(new Cargando(this));
			//States.push(new Game_Over(this));
			//changeState(MENU);
			addChild(new Level(this));
		}
		
		private function onEnterFrame():void {
			Input.update();
		}
		
		public function changeState(num:int):void {
			currentState = States[num];
			removeChildren();
			addChild(currentState).name = "actual";
		}
		
		public function reset():void {
			removeChildren();
			addChild(new Level(this));
		}
		

		
	}

}