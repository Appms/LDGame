package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	/**
	 * ...
	 * @author Andrés Valencia
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE; // Ni idea
			stage.align = StageAlign.TOP_LEFT; // Ni idea
			var strling:Starling = new Starling(Game, stage);
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
	}
	
}