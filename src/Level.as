package  
{
	import flash.geom.Point;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.events.TouchEvent;
	import starling.text.TextField;
	import starling.events.ResizeEvent;
	import starling.core.Starling;
	import starling.filters.BlurFilter;
	import starling.extensions.PDParticleSystem;
	import starling.textures.Texture;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import starling.events.Touch;
	import starling.events.TouchPhase;
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
		private var secsPassed:Number = 0;
		private var currentLevel:int = 0;
		private var currentTrack:int = 0;
		private var currentPos:int;
		private var genSecs:Number=0;
		private var generated:Boolean;
		private var initiated:Boolean;
		private var dead:Boolean;
		private var frogPoints:Number = 0;

		
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
		
		private var leftHand:Sprite;
		private var rightHand:Sprite;
		
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
			addEventListener(TouchEvent.TOUCH, onTouch);
			//this.touchable = false;

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
			capa1.y = 40;
			
			capa2 = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("capa2"));
			capa2.addChild(i);
			addChild(capa2);
			capa2.x = 0;
			capa2.y = 0;
			
			leftHand = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("righthand"));
			leftHand.addChild(i);
			capa2.addChild(leftHand);
			
			
			//**************** CAPA 0 ******************
			gameMatrix = new Array(LEVELS_0 * TRACKS_0);
			test = new String();
			
			initiated = true;
			dead = false;
			
			for (var t:int = 0; t < LEVELS_0; t++)
			{	
				gameMatrix[t] = new Array(TRACKS_0);
				for (var u:int = 0; u < TRACKS_0; u++)
				{	
					gameMatrix[t][u] = 0;
				}
			}
			

			gameMatrix[3][1] = 2;
			currentPos = 1;
			
			test = "Da Frog";
			test += "\n";
			test += "with TUPÉ";

			
			//trace(test);
			
			matrixText = new TextField(150, 180 ,test , "Arial", 36, 0xffffff);
			matrixText.x = 0;
			matrixText.y = 0;
			matrixText.border = true;
			capa0.addChild(matrixText);
		}
		
		private function onTouch(e:TouchEvent):void {		
			var touch:Touch = e.getTouch(this);
			if (touch && touch.phase == TouchPhase.HOVER) {
				GLOBAL_MOUSE_X = touch.globalX;
				GLOBAL_MOUSE_Y = touch.globalY;
				trace("X: " + GLOBAL_MOUSE_X + "// Y: " + GLOBAL_MOUSE_Y);
			}
			if (touch && touch.phase == TouchPhase.BEGAN) {
				GLOBAL_MOUSE_CLICKED = true;
			}
		}
		
		private function onEnterFrame(e:EnterFrameEvent):void {
			
			
			//**************** CAPA 0 ******************
			
			UpdateCapa0(e.passedTime);
			
			
			if (Input.isPressed(Input.SPACE)) GLOBAL_BOTON_ESPACIO = true;
			else GLOBAL_BOTON_ESPACIO = false;
			
			if (Input.isDown(Input.UP)) GLOBAL_BOTON_W = true;
			else GLOBAL_BOTON_W = false;
			
			if (Input.isDown(Input.LEFT)) GLOBAL_BOTON_A = true;
			else GLOBAL_BOTON_A = false;

			if (Input.isDown(Input.DOWN)) GLOBAL_BOTON_S = true;
			else GLOBAL_BOTON_S = false;
			
			if (Input.isDown(Input.RIGHT)) GLOBAL_BOTON_D = true;
			else GLOBAL_BOTON_D = false;
			
			if (GLOBAL_MOUSE_CLICKED) trace ("CLICKED");
			
			//leftHand.x = GLOBAL_MOUSE_X;
			//leftHand.y = GLOBAL_MOUSE_Y;
			
			GLOBAL_BOTON_ESPACIO = false;
			GLOBAL_BOTON_W = false;
			GLOBAL_BOTON_A = false;
			GLOBAL_BOTON_S = false;
			GLOBAL_BOTON_D = false;
			GLOBAL_MOUSE_CLICKED = false;
		}
		
		private function UpdateCapa0(dt:Number):void
		{	
			if (initiated)
			{
				secsPassed+= dt;
				if (secsPassed >= 3)
				{
					secsPassed = 0;
					initiated = false;
				}
				
			}
			
			else if(!dead)
			{
				
				frogPoints += dt;
				if (Input.isPressed(Input.RIGHT2)) CAPA_1_BOTON_DER = true;
				else CAPA_1_BOTON_DER = false;
				if (Input.isPressed(Input.LEFT2)) CAPA_1_BOTON_IZQ = true;
				else CAPA_1_BOTON_IZQ = false;
				
				if (CAPA_1_BOTON_DER && currentPos < 2)
				{	
					gameMatrix[3][currentPos] = 0;
					currentPos++;
					if (gameMatrix[3][currentPos] == 1) dead = true;
					gameMatrix[3][currentPos] = 2;
				}
				
				if (CAPA_1_BOTON_IZQ && currentPos > 0)
				{	
					gameMatrix[3][currentPos] = 0;
					currentPos--;
					if (gameMatrix[3][currentPos] == 1) dead = true;
					gameMatrix[3][currentPos] = 2;
				}
				
				
				
				if (generated)
				{
					secsPassed += dt;
					if (secsPassed >= 1)
					{
						gameMatrix[currentLevel][currentTrack] = 0;
						if (currentLevel + 1 <4)
						{
							currentLevel++;
							if (gameMatrix[currentLevel][currentTrack] == 2) dead = true;
							gameMatrix[currentLevel][currentTrack] = 1;
						}
						else
						{
							generated = false;
							gameMatrix[currentLevel][currentTrack] = 0;
						}
						
						secsPassed = 0;
					}
				}
				
				genSecs += dt;
				trace(genSecs);
				if (genSecs >= 2 &&!generated)
				{
					currentLevel = 0;
					currentTrack = Math.random() * 2;
					gameMatrix[currentLevel][currentTrack] = 1;
					genSecs = 0;
					generated = true;
				}
				

				test = "";
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
			}	
			
			if (dead)
			{
				genSecs = 0;
				secsPassed = 0;
				generated = false;
				test = "Score: " + int(frogPoints);
				test += "\n";
				test += "Soon";
				
				matrixText.text = test;
				
			}
		
		}
	}
	
}