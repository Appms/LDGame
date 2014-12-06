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
			i = new Image(Assets.getAtlas().getTexture("lefthand"));
			leftHand.addChild(i);
			capa2.addChild(leftHand);
			leftHand.x = GAME.true_width / 2 - GAME.true_width / 4;
			leftHand.y = 500;
			
<<<<<<< HEAD
			
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
=======
			rightHand = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("righthand"));
			rightHand.addChild(i);
			capa2.addChild(rightHand);
			GLOBAL_MOUSE_X = GAME.true_width / 2 + GAME.true_width / 4;
			GLOBAL_MOUSE_Y = 500;	
>>>>>>> origin/master
			
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

				//trace("X: " + GLOBAL_MOUSE_X + "// Y: " + GLOBAL_MOUSE_Y);
			}
			if (touch && touch.phase == TouchPhase.BEGAN) {
				GLOBAL_MOUSE_CLICKED = true;
			}
		}
		
		private function onEnterFrame(e:EnterFrameEvent):void {
<<<<<<< HEAD
			
			
			//**************** CAPA 0 ******************
			
			UpdateCapa0(e.passedTime);
			
			
=======

>>>>>>> origin/master
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
			
<<<<<<< HEAD
			//leftHand.x = GLOBAL_MOUSE_X;
			//leftHand.y = GLOBAL_MOUSE_Y;
=======
			moveLeftHand(e.passedTime);
			moveRightHand(e.passedTime);
			
			/*
			if (leftHand.x < GAME.true_width / 2) leftHand.x = GAME.true_width / 2;
			
			if (leftHand.x < capa1.x + capa1.width && leftHand.y < capa1.y + capa1.height) { 
				var aux_desfase_x:int = leftHand.x -(capa1.x +capa1.width);
				var aux_desfase_y:int = leftHand.y -(capa1.y +capa1.height);
				//leftHand.x = capa1.x + capa1.width; 
				if (aux_desfase_x < aux_desfase_y) {
					leftHand.y = capa1.y + capa1.height;
				}
				else {
					leftHand.x = capa1.x + capa1.width;
				}
				trace ("LOL");
			}
			*/
>>>>>>> origin/master
			
			GLOBAL_BOTON_ESPACIO = false;
			GLOBAL_BOTON_W = false;
			GLOBAL_BOTON_A = false;
			GLOBAL_BOTON_S = false;
			GLOBAL_BOTON_D = false;
			GLOBAL_MOUSE_CLICKED = false;
		}
		
<<<<<<< HEAD
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
				
=======
		private function moveLeftHand(dt:Number):void {
			
			// MOVE LEFT HAND
			var new_x:Number = leftHand.x;
			var new_y:Number = leftHand.y;
			var speed_leftHand:Number = 500;
			
			if (GLOBAL_BOTON_W) {
				new_y -= dt * speed_leftHand;
				if (new_x + leftHand.width > capa1.x && new_y < capa1.y + capa1.height) { new_y = capa1.y + capa1.height; }
			}
			if (GLOBAL_BOTON_S) {
				new_y += dt * speed_leftHand;
			}
			if (GLOBAL_BOTON_A) {
				new_x -= dt * speed_leftHand;
			}
			if (GLOBAL_BOTON_D) {
				new_x += dt * speed_leftHand;
				if (new_x + leftHand.width > capa1.x && new_y < capa1.y + capa1.height) { new_x = capa1.x - leftHand.width; }
			}
			
			if ((new_x + leftHand.width) > GAME.true_width / 2) {
				new_x = GAME.true_width / 2 - leftHand.width;
			}
			if (new_x < 0) {
				new_x = 0;
			}
			if (new_y > GAME.true_height - leftHand.height) {
				new_y = GAME.true_height - leftHand.height;
			}
			if (new_y < 0) {
				new_y = 0;
			}
			
			leftHand.x = new_x;
			leftHand.y = new_y;

			// END MOVE LEFT HAND
			
		}
		
		private function moveRightHand(dt:Number):void {
			
			// MOVE RIGHT HAND
			var new_x:Number = rightHand.x;
			var new_y:Number = rightHand.y;
			var speed_rightHand:Number = 1000;
			
			if (GLOBAL_MOUSE_X != rightHand.x) {
				if (GLOBAL_MOUSE_X > rightHand.x) {
					new_x += dt * speed_rightHand;
					if (GLOBAL_MOUSE_X < new_x) new_x = GLOBAL_MOUSE_X;
				}
				else if (GLOBAL_MOUSE_X < rightHand.x) {
						new_x -= dt * speed_rightHand;
					if (GLOBAL_MOUSE_X > new_x) new_x = GLOBAL_MOUSE_X;
				}
			}
			
			if (GLOBAL_MOUSE_Y != rightHand.y) {
				if (GLOBAL_MOUSE_Y > rightHand.y) {
					new_y += dt * speed_rightHand;
					if (GLOBAL_MOUSE_Y < new_y) new_y = GLOBAL_MOUSE_Y;
				}
				else if (GLOBAL_MOUSE_Y < rightHand.y) {
					new_y -= dt * speed_rightHand;
					if (GLOBAL_MOUSE_Y > new_y) new_y = GLOBAL_MOUSE_Y;
				}
			}
			
			if (new_x < GAME.true_width / 2) {
				new_x = GAME.true_width / 2;
			}
			
			if (new_x < capa1.x + capa1.width && new_y < capa1.y + capa1.height) { 
				var aux_desfase_x:int = new_x -(capa1.x +capa1.width);
				var aux_desfase_y:int = new_y -(capa1.y +capa1.height);
				if (aux_desfase_x < aux_desfase_y) {
					new_y = capa1.y + capa1.height;
				}
				else {
					new_x = capa1.x + capa1.width;
				}
			}	
			
			rightHand.x = new_x;
			rightHand.y = new_y;
			
			// END MOVE RIGHT HAND
			
		}
		
	}
>>>>>>> origin/master

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