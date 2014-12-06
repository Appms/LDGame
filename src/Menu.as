package  
{
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.text.TextField;
	import starling.events.ResizeEvent;
	import starling.core.Starling;
	import starling.filters.BlurFilter;
	import starling.extensions.PDParticleSystem;
	import starling.textures.Texture;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	/**
	 * ...
	 * @author Ruvipls
	 */
	public class Menu extends State
	{
		
		public var GAME:Game;
		
		private var key_down:int = 83;
		private var key_up:int = 87;
		private var key_right:int = 68;
		private var key_left:int = 65;
		private var key_enter:int = 13;
		/*
		public var ch1:SoundChannel = new SoundChannel();
		public var SoundMenu:Sound = new Assets.SoundMenu() as Sound;
		public var SoundHoja1:Sound = new Assets.SoundHoja1() as Sound;
		public var SoundHoja2:Sound = new Assets.SoundHoja2() as Sound;
		public var SoundHojas:Sound = new Assets.SoundHojas() as Sound;
		public var SoundMoveCursor:Sound = new Assets.SoundMoveCursor() as Sound;
		public var SoundSeleccionar:Sound = new Assets.SoundSeleccionar() as Sound;
		*/
		
		private var text_field:TextField;
		
		private var abierto:Boolean = false;
		
		private var buttons:Array = new Array();
		
		private var portada:Sprite;
		private var portadaArt:MovieClip;
		
		private var pasarpag:Sprite;
		private var pasarpagArt:MovieClip;
		
		private var contraportada:Image;
		private var tocho_d:Sprite;
		private var tocho_i:Sprite;
		
		private var pegatina_d:Sprite;
		private var pegatina_i:Sprite;
		
		private var playboton:Image;
		private var tesorosboton:Image;
		private var expedicionboton:Image;
		
		private var spawn:PDParticleSystem;
		
		private var colorin:uint = 0xFFFFFF;
		private var pags_i:int = 0;
		private var pags_i_destino:int = 0;
		private var selected:Image;
		
		private var ready:Boolean = false;
		private var pagina_pasada:Boolean = false;
		
		public function Menu(game_origen:Game) 
		{
			GAME = game_origen;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(EnterFrameEvent.ENTER_FRAME, onEnterFrame);
			addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			this.touchable = false;

		}
		
		private function onStageResize(e:ResizeEvent):void {
			GAME.true_x = e.width / 2 - GAME.true_width / 2;
			GAME.true_y = e.height / 2 - GAME.true_height / 2;
			Starling.current.viewPort.x = GAME.true_x;
			Starling.current.viewPort.y = GAME.true_y;
		}
		
		private function onAddedToStage():void {
			stage.addEventListener(ResizeEvent.RESIZE, this.onStageResize);
			//ch1 = SoundMenu.play(0, 9999);
		}
		
		private function onEnterFrame(e:EnterFrameEvent):void {

			
		}
		
		
		
		
		
		private function onKeyDown(e:KeyboardEvent):void {
			
		if (e.keyCode == key_down) {
				
			}
			else if (e.keyCode == key_up) {
				
			}
			else if (e.keyCode == key_enter) {
				
			}
			
		}
		
	}

}