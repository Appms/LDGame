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
	public class Level extends State
	{
		public var GAME:Game;
		
		private var key_down:int = 83;
		private var key_up:int = 87;
		private var key_right:int = 68;
		private var key_left:int = 65;
		private var key_enter:int = 13;
		
		public var ch1:SoundChannel = new SoundChannel();
		public var SoundMenu:Sound = new Assets.SoundMenu() as Sound;
		
		private var capa0:Sprite;
		private var capa1:Sprite;
		private var capa2:Sprite;
		
		// ATRIBUTOS PROPORCIONADOS POR CAPA 0
		
		public const LEVELS_0:int = 4;
		public const TRACKS_0:int  = 3;
		
		private var gameMatrix:Array;
		private var matrixText:TextField;
		private var test:String;
		private var secsPassed:Number;
		private var currentLevel:int = 0;
		private var currentTrack:int = 0;

		
		// ATRIBUTOS PROPORCIONADOS POR CAPA 1
		
		private var CAPA_1_BOTON_IZQ:Boolean = false;
		private var CAPA_1_BOTON_DER:Boolean = false;
		
		// ATRIBUTOS PROPORCIONADOS POR CAPA 2
		
		private var CAPA_2_BOTON_ESPACIO:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_IZQ:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_DER:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_ARR:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_ABA:Boolean = false;
		private var CAPA_2_MOUSE_CLICKED:Boolean = false;
		
		private var CAPA_2_LEFTHAND_X:Number = 0;
		private var CAPA_2_LEFTHAND_Y:Number = 0;
		private var CAPA_2_RIGHTHAND_X:Number = 0;
		private var CAPA_2_RIGHTHAND_Y:Number = 0;
		
		// ATRIBUTOS PROPORCIONADOS GLOBALMENTE
		
		private var GLOBAL_BOTON_ESPACIO:Boolean = false;
		private var GLOBAL_BOTON_W:Boolean = false;
		private var GLOBAL_BOTON_A:Boolean = false;
		private var GLOBAL_BOTON_S:Boolean = false;
		private var GLOBAL_BOTON_D:Boolean = false;
		private var GLOBAL_MOUSE_CLICKED:Boolean = false;
		private var GLOBAL_MOUSE_X:Number = 0;
		private var GLOBAL_MOUSE_Y:Number = 0;
		
		// FIN ATRIBUTOS
		
		private var spawn:PDParticleSystem;
		
		private var colorin:uint = 0xFFFFFF;
		
		

		
		public function Level(game_origen:Game) 
		{
			GAME = game_origen;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(EnterFrameEvent.ENTER_FRAME, onEnterFrame);
			//addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
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
			ch1 = SoundMenu.play(0, 9999);
			
			capa0 = new Sprite();
			var i:Image = new Image(Assets.getAtlas().getTexture("capa0"));
			capa0.addChild(i);
			addChild(capa0);
			capa0.x = GAME.true_width/2 - capa0.width/2;
			capa0.y = 58;
			
			capa1 = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("capa1"));
			capa1.addChild(i);
			addChild(capa1);
			capa1.x = GAME.true_width/2 - capa1.width/2;
			capa1.y = 38;
			
			capa2 = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("capa2"));
			capa2.addChild(i);
			addChild(capa2);
			capa2.x = 0;
			capa2.y = 0;
			
			
			//**************** CAPA 0 ******************
			gameMatrix = new Array(LEVELS_0 * TRACKS_0);
			test = new String();
			
			for (var t:int = 0; t < LEVELS_0; t++)
			{	
				gameMatrix[t] = new Array(TRACKS_0);
				for (var u:int = 0; u < TRACKS_0; u++)
				{	
					gameMatrix[t][u] = 0;
				}
			}
			
			currentTrack = Math.random() * 2;
			currentLevel = 0;
			
			gameMatrix[currentLevel][currentTrack] = 1;
			gameMatrix[3][1] = 2;
			
			for (t = 0; t < LEVELS_0; t++)
			{	
				for (u = 0; u < TRACKS_0; u++)
				{	
					test += gameMatrix[t][u];
					test += " ";
				}
				test += "\n";
			}
			
			trace(test);
			
			matrixText = new TextField(100, 100 , test, "Arial", 18, 0xffffff);
			matrixText.x = 0;
			matrixText.y = 0;
			matrixText.border = true;
			capa0.addChild(matrixText);
		}
		
		private function onEnterFrame(e:EnterFrameEvent):void {
			/*
			if (Input.isPressed(Input.DOWN) || Input.isPressed(Input.DOWN2)) {
				selected++;
				if (selected > 1) {
					selected = 0;
				}
			}
			else if (Input.isPressed(Input.UP) || Input.isPressed(Input.UP2)) {
				selected--;
				if (selected < 0) {
					selected = 1;
				}
			}
			else if (Input.isPressed(Input.ENTER)) {
				
			}
			
			if (selected == 0) {
				select_menu.y = 200;
			}
			else if (selected == 1) {
				select_menu.y = 300;
			}
			*/
			
			//**************** CAPA 0 ******************
			/*
			for (var t:int = 0; t < LEVELS_0; t++)
			{	
				for (var u:int = 0; u < TRACKS_0; u++)
				{	
					test += gameMatrix[t][u];
					test += " ";
				}
				test += "\n";
			}
			
			matrixText.text = test;
			*/
		}
	}
}