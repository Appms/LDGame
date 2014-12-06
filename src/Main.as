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
	//[SWF(backgroundColor="0x000000")]
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE; // Ni idea
			stage.align = StageAlign.TOP_LEFT; // Ni idea
			var strling:Starling = new Starling(Game, stage);
			//strling.showStats = true; // Muestra las estadísticas
			strling.antiAliasing = 3; // Ni idea
			strling.start();
		}

		
	}
	
}