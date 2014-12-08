package  
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
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
	import flash.ui.Mouse;
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
		public var channel_phone:SoundChannel = new SoundChannel();
		public var channel_office:SoundChannel = new SoundChannel();
		
		public var SoundMenu:Sound = new Assets.SoundMenu() as Sound;
		public var SoundSqueak1_01:Sound = new Assets.SoundSqueak1_01() as Sound;
		public var SoundSqueak2_01:Sound = new Assets.SoundSqueak2_01() as Sound;
		public var SoundSqueak3_01:Sound = new Assets.SoundSqueak3_01() as Sound;
		public var SoundSqueak4_01:Sound = new Assets.SoundSqueak4_01() as Sound;
		public var SoundSqueak5_01:Sound = new Assets.SoundSqueak5_01() as Sound;
		public var SoundSqueak6_01:Sound = new Assets.SoundSqueak6_01() as Sound;
		public var SoundSqueak7_01:Sound = new Assets.SoundSqueak7_01() as Sound;
		public var SoundSqueak8_01:Sound = new Assets.SoundSqueak8_01() as Sound;
		public var SoundSqueak9_01:Sound = new Assets.SoundSqueak9_01() as Sound;
		public var SoundSqueak10_01:Sound = new Assets.SoundSqueak10_01() as Sound;
		public var SoundSqueak1_02:Sound = new Assets.SoundSqueak1_02() as Sound;
		public var SoundSqueak2_02:Sound = new Assets.SoundSqueak2_02() as Sound;
		public var SoundSqueak3_02:Sound = new Assets.SoundSqueak3_02() as Sound;
		public var SoundSqueak4_02:Sound = new Assets.SoundSqueak4_02() as Sound;
		public var SoundSqueak5_02:Sound = new Assets.SoundSqueak5_02() as Sound;
		public var SoundSqueak6_02:Sound = new Assets.SoundSqueak6_02() as Sound;
		public var SoundSqueak7_02:Sound = new Assets.SoundSqueak7_02() as Sound;
		public var SoundSqueak8_02:Sound = new Assets.SoundSqueak8_02() as Sound;
		public var SoundSqueak9_02:Sound = new Assets.SoundSqueak9_02() as Sound;
		public var SoundSqueak10_02:Sound = new Assets.SoundSqueak10_02() as Sound;
		public var SoundPhone:Sound = new Assets.SoundPhone() as Sound;
		public var SoundOffice:Sound = new Assets.SoundOffice() as Sound;
		public var SoundKey:Sound = new Assets.SoundKey() as Sound;
		public var SoundClick:Sound = new Assets.SoundClick() as Sound;
		
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
		private var currentTrack:int = 0;
		private var currentPos:int;
		private var genSecs:Number = 0;
		private var deathSecs:Number = 0;
		private var highScore:Number = 0;
		private var generated:Boolean;
		private var initiated:Boolean;
		private var dead:Boolean;
		private var frogPoints:Number = 0;
		private var customDt:Number = 0;
		private var increasement:Number = 0;
		private var character0:MovieClip;
		private var character1:MovieClip;
		private var character2:MovieClip;
		private var bombsAway:Array;
		private var widthCapa0:Number;
		private var heightCapa0:Number;
		private var mouth0:Image;
		private var mouth1:Image;
		private var mouth2:Image;

		
		// ATRIBUTOS PROPORCIONADOS POR CAPA 1
		
		private var CAPA_1_BOTON_IZQ:Boolean = false;
		private var CAPA_1_BOTON_DER:Boolean = false;
		
		private var lifes:Number;
		private var lifesArray:Array;
		private var lifeUp:Sprite;
		private var lifeUpDt:Number;
		private var character:Sprite;
		private var jumptimer:Number;
		private var fairy:Sprite;
		private var fairy_displacement:Point;
		private var newEnemy:Sprite;
		private var enemyArray:Array = new Array();
		private var enemySpawner:Number = 0;
		private var widthCapa1:Number;
		private var heightCapa1:Number;
		private var gamepad:Sprite;
		private var pisotoneando:Boolean;
		private var LB:Sprite;
		private var RB:Sprite;
		private var LBPressed:Boolean;
		private var RBPressed:Boolean;
		private var LBdt:Number;
		private var RBdt:Number;
		
		// ATRIBUTOS PROPORCIONADOS POR CAPA 2
		
		private var CAPA_2_BOTON_ESPACIO:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_IZQ:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_DER:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_ARR:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_ABA:Boolean = false;
		private var CAPA_2_MOUSE_CLICKED:Boolean = false;
		
		private var CAPA_2_LEFT_MOUSE_X:Number = 200;
		private var CAPA_2_LEFT_MOUSE_Y:Number = 500;
		
		private var leftHand1:Sprite;
		private var leftHand2:Sprite;
		private var leftHandMouse1:Sprite;
		private var leftHandMouse2:Sprite;
		private var leftShirt:Sprite;
		
		private var rightHand1:Sprite;
		private var rightHand2:Sprite;
		private var rightHandMouse1:Sprite;
		private var rightHandMouse2:Sprite;
		private var rightShirt:Sprite;
		
		private var computer:Sprite;
		private var keyboard:Sprite;
		
		private var areaMouse:Sprite;
		private var areaNeutral:Sprite;
		private var mouse:Sprite;
		private var mouseCatched:Boolean = false;
		
		private var areaSnowMan:Sprite;
		private var snowMan:Sprite;
		private var snowManCatched:Boolean = false;
		
		private var phone_base:Sprite;
		private var areaPhone:Sprite;
		private var phone:Sprite;
		private var phoneCatched:Boolean = false;
		
		private var phoneEvent:Number = 0;
		private var phoneBronca:Number = 1;
		
		private var areaCoffe:Sprite;
		private var coffe:Sprite;
		private var coffeCatched:Boolean = false;
		
		private var test_F_IZQ:Sprite;
		private var test_F_DER:Sprite;
		private var test_F_ARR:Sprite;
		private var test_F_ABA:Sprite;
		private var test_ESP:Sprite;
		
		private var changed_x_rotation:Number = 73;
		private var changed_y_rotation:Number = 43;
		
		// ATRIBUTOS PROPORCIONADOS GLOBALMENTE
		
		private var debug:Boolean = true;
		private var ira:Number = 0;
		private var GLOBAL_BOTON_ESPACIO:Boolean = false;
		private var GLOBAL_BOTON_W:Boolean = false;
		private var GLOBAL_BOTON_A:Boolean = false;
		private var GLOBAL_BOTON_S:Boolean = false;
		private var GLOBAL_BOTON_D:Boolean = false;
		private var GLOBAL_MOUSE_CLICKED:Boolean = false;
		private var GLOBAL_MOUSE_MANTAINED:Boolean = false;
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
			//Mouse.hide();
			

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
			channel_office = SoundOffice.play(0, 999999);
			channel_phone = SoundPhone.play(0, 9999);
			channel_phone.soundTransform = new SoundTransform(0, -1);
			
			capa0 = new Sprite();
			var i:Image = new Image(Assets.getAtlas().getTexture("capa0"));
			capa0.addChild(i);
			capa0.scaleX = 1.01;
			capa0.scaleY = 1.01;
			addChild(capa0);
			capa0.x = GAME.true_width/2 - capa0.width/2;
			capa0.y = 57;
			
			capa1 = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("capa1"));
			capa1.addChild(i);
			addChild(capa1);
			capa1.x = GAME.true_width/2 - capa1.width/2;
			capa1.y = 41;
			
			capa2 = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("capa2"));
			capa2.addChild(i);
			addChild(capa2);
			capa2.x = 0;
			capa2.y = 0;
			
			//**************** CAPA 0 ******************
			widthCapa0 = capa0.width;
			heightCapa0 = capa0.height;
			drawCapa0();
			gameMatrix = new Array(LEVELS_0 * TRACKS_0);
			test = new String();
			initiated = true;
			dead = false;
			bombsAway = new Array();
			
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
			
			matrixText = new TextField(150, 180 ,test , "Arial", 28, 0xffffff);
			matrixText.x = 0;
			matrixText.y = 0;
			matrixText.border = false;
			capa0.addChild(matrixText);
			
			
			// ****************** CAPA 1 ******************
			widthCapa1 = capa1.width;
			heightCapa1 = capa1.height;
			
			lifes = 3;
			lifesArray = new Array();
			drawLifes();
			lifeUpDt = 0;
			
			jumptimer = 0;
			
			gamepad = new Sprite();
			i = new Image(Assets.getTexture("gamepad"));
			gamepad.addChild(i);
			capa1.addChild(gamepad);
			gamepad.x = widthCapa1 / 2;
			gamepad.y = heightCapa1 / 2 + 100;
			gamepad.pivotX = gamepad.width / 2;
			gamepad.pivotY = gamepad.height / 2;
			gamepad.scaleX = 0.1;
			gamepad.scaleY = 0.1;
			gamepad.rotation = Math.PI / 4;
			
			RB = new Sprite();
			i = new Image(Assets.getTexture("RB"));
			RB.addChild(i);
			capa1.addChild(RB);
			RB.x = widthCapa1 / 2 + 25;
			RB.y = heightCapa1 / 2 + 100 + 15;
			RB.pivotX = RB.width / 2;
			RB.pivotY = RB.height / 2;
			RB.scaleX = 0.1;
			RB.scaleY = 0.1;
			
			LB = new Sprite();
			i = new Image(Assets.getTexture("LB"));
			LB.addChild(i);
			capa1.addChild(LB);
			LB.x = widthCapa1 / 2 - 15;
			LB.y = heightCapa1 / 2 + 100 - 25;
			LB.pivotX = LB.width / 2;
			LB.pivotY = LB.height / 2;
			LB.scaleX = 0.1;
			LB.scaleY = 0.1;
			
			RBdt = 0;
			LBdt = 0;
			
			
			character = new Sprite();
			i = new Image(Assets.getTexture("character"));
			character.addChild(i);
			capa1.addChild(character);
			character.x = widthCapa1/2;
			character.y = heightCapa1/2 + 100;
			character.pivotX = character.width / 2; // 132
			character.pivotY = character.height / 2; // 224
			character.scaleX = 0.15;
			character.scaleY = 0.15;
			
			
			fairy = new Sprite();
			i = new Image(Assets.getTexture("fairy"));
			fairy.addChild(i);
			capa1.addChild(fairy);
			fairy.pivotX = fairy.width / 2;
			fairy.pivotY = fairy.height / 2;
			fairy.scaleX = 0.025;
			fairy.scaleY = 0.025;
			fairy_displacement = new Point(0, 0);
			
			
			
			
			// *********************** CAPA 2 ***********************
			
			computer = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("OFFICE_computer"));
			computer.addChild(i);
			capa2.addChild(computer);
			
			keyboard = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("OFFICE_keyboard"));
			keyboard.addChild(i);
			capa2.addChild(keyboard);
			
			areaMouse = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("area_mouse"));
			areaMouse.addChild(i);
			if (debug) areaMouse.alpha = 0.2;
			else areaMouse.alpha = 0;
			areaMouse.x = 570;
			areaMouse.y = 425;
			
			areaNeutral = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("area_neutral"));
			areaNeutral.addChild(i);
			if (debug) areaNeutral.alpha = 0.2;
			else areaNeutral.alpha = 0;
			areaNeutral.x = areaMouse.x + areaMouse.width/2 - areaNeutral.width/2;
			areaNeutral.y = areaMouse.y + areaMouse.height/2 - areaNeutral.height/2;
			
			capa2.addChild(areaNeutral);
			capa2.addChild(areaMouse);
			
			mouse = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("mouse"));
			mouse.addChild(i);
			capa2.addChild(mouse);
			mouse.x = areaMouse.x + areaMouse.width/2 - mouse.width/2;
			mouse.y = areaMouse.y + areaMouse.height / 2 - mouse.height / 2;
			
			areaSnowMan = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("area_mouse"));
			areaSnowMan.addChild(i);
			capa2.addChild(areaSnowMan);
			if (debug) areaSnowMan.alpha = 0.2;
			else areaSnowMan.alpha = 0;
			areaSnowMan.x = 600;
			areaSnowMan.y = 225;
			
			snowMan = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("snowman"));
			snowMan.addChild(i);
			capa2.addChild(snowMan);
			snowMan.x = areaSnowMan.x + areaSnowMan.width/2 - snowMan.width/2;
			snowMan.y = areaSnowMan.y + areaSnowMan.height / 2 - snowMan.height / 2;
			
			areaPhone = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("area_mouse"));
			areaPhone.addChild(i);
			capa2.addChild(areaPhone);
			if (debug) areaPhone.alpha = 0.2;
			else areaPhone.alpha = 0;
			areaPhone.x = 0;
			areaPhone.y = 225;
			
			phone_base = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("OFFICE_telefone_base"));
			phone_base.addChild(i);
			capa2.addChild(phone_base);
			phone_base.x = areaPhone.x + areaPhone.width/2 - phone_base.width/2 -32;
			phone_base.y = areaPhone.y + areaPhone.height / 2 - phone_base.height / 2;
			
			phone = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("OFFICE_telefone"));
			phone.addChild(i);
			capa2.addChild(phone);
			phone.x = areaPhone.x + areaPhone.width/2 - phone.width/2 -32;
			phone.y = areaPhone.y + areaPhone.height / 2 - phone.height / 2;
			
			areaCoffe = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("area_mouse"));
			areaCoffe.addChild(i);
			capa2.addChild(areaCoffe);
			if (debug) areaCoffe.alpha = 0.2;
			else areaCoffe.alpha = 0;
			areaCoffe.scaleX = 0.6;
			areaCoffe.scaleY = 1.4;
			areaCoffe.x = 0;
			areaCoffe.y = 400;
			
			coffe = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("mouse"));
			coffe.addChild(i);
			capa2.addChild(coffe);
			coffe.x = areaCoffe.x + areaCoffe.width/2 - coffe.width/2;
			coffe.y = areaCoffe.y + areaCoffe.height / 2 - coffe.height / 2;
			
			test_F_ARR = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("test"));
			test_F_ARR.addChild(i);
			capa2.addChild(test_F_ARR);
			if (debug) test_F_ARR.alpha = 0.4;
			else test_F_ARR.alpha = 0;
			test_F_ARR.x = 436;
			test_F_ARR.y = 432 +32;
			
			test_F_ABA = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("test"));
			test_F_ABA.addChild(i);
			capa2.addChild(test_F_ABA);
			if (debug) test_F_ABA.alpha = 0.4;
			else test_F_ABA.alpha = 0;
			test_F_ABA.x = 442;
			test_F_ABA.y = 470 +30;
			
			test_F_IZQ = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("test"));
			test_F_IZQ.addChild(i);
			capa2.addChild(test_F_IZQ);
			if (debug) test_F_IZQ.alpha = 0.4;
			else test_F_IZQ.alpha = 0;
			test_F_IZQ.x = 400;
			test_F_IZQ.y = 470 +30;
			
			test_F_DER = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("test"));
			test_F_DER.addChild(i);
			capa2.addChild(test_F_DER);
			if (debug) test_F_DER.alpha = 0.4;
			else test_F_DER.alpha = 0;
			test_F_DER.x = 484;
			test_F_DER.y = 470 +30;
			
			test_ESP = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("test"));
			test_ESP.addChild(i);
			capa2.addChild(test_ESP);
			if (debug) test_ESP.alpha = 0.4;
			else test_ESP.alpha = 0;
			test_ESP.scaleX = 5.027;
			test_ESP.x = 165;
			test_ESP.y = 470 +30;
			
			leftHand1 = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("OFFICE_hand_click_01"));
			i.scaleX *= -1;
			leftHand1.addChild(i);
			capa2.addChild(leftHand1);
			leftHand1.x = CAPA_2_LEFT_MOUSE_X;
			leftHand1.y = CAPA_2_LEFT_MOUSE_Y;
			
			leftHand2 = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("OFFICE_hand_click_02"));
			i.scaleX *= -1;
			leftHand2.addChild(i);
			capa2.addChild(leftHand2);
				
			leftShirt = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("OFFICE_shirt"));
			i.scaleX *= -1;
			leftShirt.addChild(i);
			capa2.addChild(leftShirt);
			

			rightHand1 = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("OFFICE_hand_click_01"));
			rightHand1.addChild(i);
			capa2.addChild(rightHand1);
			GLOBAL_MOUSE_X = GAME.true_width / 2 + GAME.true_width / 4;
			GLOBAL_MOUSE_Y = 500;
			
			rightHand2 = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("OFFICE_hand_click_02"));
			rightHand2.addChild(i);
			capa2.addChild(rightHand2);
			
			rightHandMouse1 = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("OFFICE_hand_mouse_01"));
			rightHandMouse1.addChild(i);
			rightHandMouse1.rotation = ( -30) * Math.PI / 180;
			capa2.addChild(rightHandMouse1);
			rightHandMouse1.x = GLOBAL_MOUSE_X;
			rightHandMouse1.y = GLOBAL_MOUSE_Y;
			
			rightHandMouse2 = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("OFFICE_hand_mouse_02"));
			rightHandMouse2.addChild(i);
			rightHandMouse2.rotation = ( -30) * Math.PI / 180;
			capa2.addChild(rightHandMouse2);
			rightHandMouse2.x = rightHandMouse1.x;
			rightHandMouse2.y = rightHandMouse1.y;
			
			rightShirt = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("OFFICE_shirt"));
			rightShirt.addChild(i);
			capa2.addChild(rightShirt);
		}
		
		private function onTouch(e:TouchEvent):void {		
			var touch:Touch = e.getTouch(this);
			if (touch && touch.phase == TouchPhase.HOVER) {
				
				GLOBAL_MOUSE_X = touch.globalX;
				GLOBAL_MOUSE_Y = touch.globalY;

			}
			if (touch && touch.phase == TouchPhase.BEGAN) {
				GLOBAL_MOUSE_CLICKED = true;
				GLOBAL_MOUSE_MANTAINED = true;
				if (mouseCatched) { CAPA_2_MOUSE_CLICKED = true; }
			}
			if (touch && touch.phase == TouchPhase.ENDED) {
				if (snowManCatched) { Squeaky2(); }
				GLOBAL_MOUSE_MANTAINED = false;
			}
		}
		
		private function onEnterFrame(e:EnterFrameEvent):void {
			
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
			
			if (GLOBAL_MOUSE_CLICKED) {
				if (snowManCatched) {
					ira -= 1;
					if (ira < 0) { ira = 0; }
					Squeaky();
				}	

			}
			
			if (GLOBAL_MOUSE_MANTAINED) {
				if (GLOBAL_MOUSE_X >= test_F_ARR.x && GLOBAL_MOUSE_X <= test_F_ARR.x + test_F_ARR.width &&
				GLOBAL_MOUSE_Y >= test_F_ARR.y && GLOBAL_MOUSE_Y <= test_F_ARR.y + test_F_ARR.height) {
					CAPA_2_BOTON_FLECHA_ARR = true;
				}
				else if (GLOBAL_MOUSE_X >= test_F_ABA.x && GLOBAL_MOUSE_X <= test_F_ABA.x + test_F_ABA.width &&
				GLOBAL_MOUSE_Y >= test_F_ABA.y && GLOBAL_MOUSE_Y <= test_F_ABA.y + test_F_ABA.height) {
					CAPA_2_BOTON_FLECHA_ABA = true;
				}
				else if (GLOBAL_MOUSE_X >= test_F_IZQ.x && GLOBAL_MOUSE_X <= test_F_IZQ.x + test_F_IZQ.width &&
				GLOBAL_MOUSE_Y >= test_F_IZQ.y && GLOBAL_MOUSE_Y <= test_F_IZQ.y + test_F_IZQ.height) {
					CAPA_2_BOTON_FLECHA_IZQ = true;
				}
				else if (GLOBAL_MOUSE_X >= test_F_DER.x && GLOBAL_MOUSE_X <= test_F_DER.x + test_F_DER.width &&
				GLOBAL_MOUSE_Y >= test_F_DER.y && GLOBAL_MOUSE_Y <= test_F_DER.y + test_F_DER.height) {
					CAPA_2_BOTON_FLECHA_DER = true;
				}
			}
			else {
				
			}
			
			if (Input.isPressed(Input.SPACE)) {
				
				
				if (CAPA_2_LEFT_MOUSE_X >= test_ESP.x && CAPA_2_LEFT_MOUSE_X <= test_ESP.x + test_ESP.width &&
				CAPA_2_LEFT_MOUSE_Y >= test_ESP.y && CAPA_2_LEFT_MOUSE_Y <= test_ESP.y + test_ESP.height) {
					CAPA_2_BOTON_ESPACIO = true;
				}
				
				if (phoneCatched && phoneEvent <= 0) {
					
					channel_phone.soundTransform = new SoundTransform(0, -1);
					if (phoneBronca < 3) {
						// SUENA LA SECRETARIA
					}
					else {
						// SUENA EL BOSS
					}
					phoneEvent = 30 + Math.random() * 10;
					phoneBronca = 1;
				}
			}
			
			
			
			updateCapa0(e.passedTime);
			updateCapa1(e.passedTime);
			
			// ****************** CAPA 2 ******************
			
			phoneEvent -= e.passedTime;
			checkPhoneEvent();
			
			moveLeftHand(e.passedTime);
			moveRightHand(e.passedTime);
			checkMouse();
			checkSnowMan();
			checkPhone();
			checkCoffe();
			
			checkLeftVisibility();
			checkRightVisibility();
			//ira += e.passedTime;
			shakeHands(ira);
			
			if (CAPA_2_MOUSE_CLICKED) {
				checkEnemyClick();
			}
			
			
			GLOBAL_BOTON_ESPACIO = false;
			GLOBAL_BOTON_W = false;
			GLOBAL_BOTON_A = false;
			GLOBAL_BOTON_S = false;
			GLOBAL_BOTON_D = false;
			GLOBAL_MOUSE_CLICKED = false;
			CAPA_2_BOTON_FLECHA_ARR = false;
			CAPA_2_BOTON_FLECHA_ABA = false;
			CAPA_2_BOTON_FLECHA_IZQ = false;
			CAPA_2_BOTON_FLECHA_DER = false;
			CAPA_2_BOTON_ESPACIO = false;
			CAPA_2_MOUSE_CLICKED = false;
		}
		
	
		
		
		private function updateCapa1(dt:Number):void {
			
			// Movimiento Personaje
			if (!pisotoneando) {
				if (CAPA_2_BOTON_FLECHA_ARR && character.y > capa1.height/2 + 25) character.y -= 60*dt;
				else if (CAPA_2_BOTON_FLECHA_IZQ) {
					character.x -= 80*dt;
					if (character.scaleX > 0) character.scaleX *= -1;
				}
				else if (CAPA_2_BOTON_FLECHA_ABA) character.y += 60*dt;
				else if (CAPA_2_BOTON_FLECHA_DER) {
					character.x += 80*dt;
					if (character.scaleX < 0) character.scaleX *= -1;
				}
			}
			
			// Salto Personaje
			if (CAPA_2_BOTON_ESPACIO && !pisotoneando) {
				pisotoneando = true;
				character.removeChildren();
				var img:Image = new Image(Assets.getTexture("character_jump"));
				character.addChild(img);
				
				if (Math.sqrt(Math.pow((RB.x - character.x), 2) + Math.pow((RB.y - character.y - 23), 2)) < 15)
				{
					RB.removeChildren();
					img = new Image(Assets.getTexture("RBP"));
					RB.addChild(img)
					RBPressed = true;
					CAPA_1_BOTON_DER = true;
				}
				else if (Math.sqrt(Math.pow((LB.x - character.x), 2) + Math.pow((LB.y - character.y - 23), 2)) < 15)
				{
					LB.removeChildren();
					img = new Image(Assets.getTexture("LBP"));
					LB.addChild(img);
					LBPressed = true;
					CAPA_1_BOTON_IZQ = true;
				}
			}
			
			if (pisotoneando) {
				jumptimer += dt;
				if (jumptimer >= 0.5) {
					pisotoneando = false;
					character.removeChildren();
					img = new Image(Assets.getTexture("character"));
					character.addChild(img);
					jumptimer = 0;
				}
			}
			
			if (RBPressed) {
				RBdt += dt;
				if (RBdt >= 0.5) {
					RBPressed = false;
					RB.removeChildren();
					img = new Image(Assets.getTexture("RB"));
					RB.addChild(img);
					RBdt = 0;
				}
			}
			
			if (LBPressed) {
				LBdt += dt;
				if (LBdt >= 0.5) {
					LBPressed = false;
					LB.removeChildren();
					img = new Image(Assets.getTexture("LB"));
					LB.addChild(img);
					LBdt = 0;
				}
			}
				
			/*if (CAPA_2_BOTON_FLECHA_ARR) character.y -= 60*dt;
			else if (CAPA_2_BOTON_FLECHA_IZQ) {
				character.x -= 80*dt;
				if (character.scaleX > 0) character.scaleX *= -1;
			}
			else if (CAPA_2_BOTON_FLECHA_ABA) character.y += 60*dt;
			else if (CAPA_2_BOTON_FLECHA_DER) {
				character.x += 80*dt;
				if (character.scaleX < 0) character.scaleX *= -1;
			}*/
			
			
			// Movimiento Hadita/Cursor
			
			/*fairy_displacement.x += Math.random() * 2.0 - 1.0;
			fairy_displacement.y += Math.random() * 2.0 - 1.0;
			if (fairy_displacement.x > 5) fairy_displacement.x = 5;
			if (fairy_displacement.x < -5) fairy_displacement.x = -5;
			if (fairy_displacement.y > 5) fairy_displacement.y = 5;
			if (fairy_displacement.y < 5) fairy_displacement.y = -5;*/
			
			//fairy.x = GLOBAL_MOUSE_X - capa1.x + fairy_displacement.x;
			//fairy.y = GLOBAL_MOUSE_Y - capa1.y + fairy_displacement.y;
			
			//fairy.x += (GLOBAL_MOUSE_X - capa1.x - fairy.x) / 3;
			//fairy.y += (GLOBAL_MOUSE_Y - capa1.y - fairy.y) / 3;

			if (mouseCatched) {
				fairy.x = (GLOBAL_MOUSE_X - areaMouse.x)*2;
				fairy.y = (GLOBAL_MOUSE_Y - areaMouse.y)*2;
			}
			
			
			if (fairy.x+fairy.width/2 > widthCapa1) fairy.x = widthCapa1-fairy.width/2;
			if (fairy.x-fairy.width/2 < 0) fairy.x = 0+fairy.width/2;
			if (fairy.y+fairy.height/2 > heightCapa1) fairy.y = heightCapa1-fairy.height/2;
			if (fairy.y-fairy.height/2 < 0) fairy.y = 0+fairy.height/2;
			
			// Spawnear Enemigos
			enemySpawner += dt;
			if (enemySpawner >= 3) {
				addEnemy();
				enemySpawner = 0;
			}
			
			// Movimiento Enemigos
			var i:Number;
			for (i = 0; i < enemyArray.length; i++) {
				if (enemyArray[i].x < character.x) {
					enemyArray[i].x += 80*dt;
					if (enemyArray[i].scaleX < 0) enemyArray[i].scaleX *= -1;
				}
				if (enemyArray[i].x > character.x) {
					enemyArray[i].x -= 80*dt;
					if (enemyArray[i].scaleX > 0) enemyArray[i].scaleX *= -1;
				}
				if (enemyArray[i].y < character.y) enemyArray[i].y += 20*dt;
				if (enemyArray[i].y > character.y) enemyArray[i].y -= 20*dt;
			}
			
			enemyCollision();
			
			updateLifeUp(dt);
			
		}
		
		private function addEnemy():void {
			newEnemy = new Sprite();
			var i:Image = new Image(Assets.getTexture("enemy"));
			newEnemy.addChild(i);
			capa1.addChild(newEnemy);
			newEnemy.pivotX = newEnemy.width / 2;
			newEnemy.pivotY = newEnemy.height / 2;
			newEnemy.scaleX = 0.05;
			newEnemy.scaleY = 0.05;
			
			if (Math.round(Math.random()) == 0) newEnemy.x = 0;
			else newEnemy.x = widthCapa1;
			newEnemy.y = heightCapa1 / 2 + 75;
			
			enemyArray.push(newEnemy);
		}
		
		
		
		private function enemyCollision():void {
			var i:Number;
			for (i = 0; i < enemyArray.length; i++) {
				if ( Math.sqrt(Math.pow((enemyArray[i].x - character.x), 2) + Math.pow((enemyArray[i].y - character.y), 2)) < 25) {
					capa1.removeChild(enemyArray[i]);
					enemyArray.splice(i, 1);
					loseLife();
				}
			}
		}
		
		private function checkEnemyClick():void {
			var i:Number;
			for (i = 0; i < enemyArray.length; i++) {
				if ( Math.sqrt(Math.pow((enemyArray[i].x - (fairy.x)), 2) + Math.pow((enemyArray[i].y - (fairy.y)), 2)) < 25)  {
					if (lifeUp == null && Math.round(Math.random() * 1) == 0) spawnLife(enemyArray[i].x, enemyArray[i].y);
					capa1.removeChild(enemyArray[i]);
					enemyArray.splice(i, 1);
				}
			}
		}
		
		private function spawnLife(x:Number, y:Number):void {
			lifeUp = new Sprite();
			var i:Image = new Image(Assets.getTexture("heart"));
			lifeUp.addChild(i);
			capa1.addChild(lifeUp);
			lifeUp.x = x;
			lifeUp.y = y;
			lifeUp.pivotX = lifeUp.width / 2;
			lifeUp.pivotY = lifeUp.height / 2;
			lifeUp.scaleX = 0.03;
			lifeUp.scaleY = 0.03;
		}
		
		private function updateLifeUp(dt:Number):void {
			if (lifeUp != null) {
				lifeUpDt += dt;
				lifeUp.y += Math.sin(lifeUpDt*Math.PI);
				
				if (lifeUpDt >= 4) {
					if (lifeUp.visible == false) lifeUp.visible = true;
					else lifeUp.visible = false;
				}
					
				if (lifeUpDt >= 5) {
					capa1.removeChild(lifeUp);
					lifeUp = null;
					lifeUpDt = 0;
				}
				else if ( Math.sqrt(Math.pow((lifeUp.x - character.x), 2) + Math.pow((lifeUp.y - character.y), 2)) < 25) {
					capa1.removeChild(lifeUp);
					lifeUp = null;
					lifeUpDt = 0;
					gainLife();
				}
			}
		}
			
		private function loseLife():void {
			lifes -= 1;
			drawLifes();
			//if (lifes <= 0){has perdido joputa}
		}
		
		private function gainLife():void {
			if(lifes < 3){
				lifes += 1;
				drawLifes();
			}
		}
		
		private function drawLifes():void {
			var i:Number;
			
			for  (i = 0; i < lifesArray.length; i++) capa1.removeChild(lifesArray[i]);
			lifesArray = new Array();
			
			for (i = 0; i < lifes; i++) {
				var life:Sprite = new Sprite();
				var img:Image = new Image(Assets.getTexture("heart"));
				life.addChild(img);
				capa1.addChild(life);
				life.scaleX = 0.05;
				life.scaleY = 0.05;
				life.x = life.width * i + 8;
				life.y = 0;
				lifesArray.push(life);
			}
		}
		
		private function updateCapa0(dt:Number):void
		{	
			
			if (initiated)
			{
				secsPassed+= dt;
				if (secsPassed >= 3)
				{
					secsPassed = 0;
					initiated = false;
					matrixText.visible = false;
				}
				
			}
			
			else if(!dead)
			{
				//updateSprites0();
				customDt = dt + increasement;
				frogPoints += customDt;
				
				if (int(frogPoints) == 15) increasement = 0.012;
				if (int(frogPoints) == 25) increasement = 0.016;
				if (int(frogPoints) == 40) increasement = 0.024;
				if (int(frogPoints) == 60) increasement = 0.035;
				
				
				frogPoints += dt;
				/*if (Input.isPressed(Input.RIGHT2)) CAPA_1_BOTON_DER = true;
				if (Input.isPressed(Input.RIGHT2)) CAPA_1_BOTON_DER = true;
				else CAPA_1_BOTON_DER = false;
				if (Input.isPressed(Input.LEFT2)) CAPA_1_BOTON_IZQ = true;
				else CAPA_1_BOTON_IZQ = false;*/
				
				if (CAPA_1_BOTON_DER && currentPos < 2)
				{	
					CAPA_1_BOTON_DER = false;
					gameMatrix[3][currentPos] = 0;
					currentPos++;
					changeSprite0();
					if (gameMatrix[3][currentPos] == 1) dead = true;
					gameMatrix[3][currentPos] = 2;
				}
				
				if (CAPA_1_BOTON_IZQ && currentPos > 0)
				{	
					CAPA_1_BOTON_IZQ = false;
					gameMatrix[3][currentPos] = 0;
					currentPos--;
					changeSprite0();
					if (gameMatrix[3][currentPos] == 1) dead = true;
					gameMatrix[3][currentPos] = 2;
				}
				
				
				if (generated)
				{
					secsPassed += customDt;

					if (secsPassed >= 1.2)
					{	
						updateSprites0();
						
						
						for (var i:int = LEVELS_0-1; i >= 0; i--)
						{
							for (var j:int = TRACKS_0-1; j >=0 ; j--)
							{
								if (gameMatrix[i][j] == 1) 
								{
									gameMatrix[i][j] = 0;
									if (i + 1 <4)
									{
										if (gameMatrix[i + 1][j] == 2) dead = true;
										else 
										{
											gameMatrix[i + 1][j] = 1;
											changeSprite0();
										}

									}
								}
							}
						}
						
						secsPassed = 0;
					}
				}
				
				genSecs += customDt;
				
				if (genSecs >= 4&& secsPassed==0)
				{
					generateEnemy();
					var probabilidad:Number = Math.random() * 10;
					if (probabilidad <= 2 && frogPoints>25 && frogPoints<40) generateEnemy();
					if (probabilidad <= 4 && frogPoints>40) generateEnemy();
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
				matrixText.fontSize = 28;
				matrixText.text = test;
			}	
			
			if (dead)
			{
				matrixText.visible = true;
				character0.visible = false;
				character1.visible = false;
				character2.visible = false;
				mouth0.visible = false;
				mouth1.visible = false;
				mouth2.visible = false;
				
				for (i = 0; i < bombsAway.length; i++)
				{
					capa0.removeChild(bombsAway[i]);
					bombsAway.splice(i, 1);
				}
				
				if (frogPoints > highScore) highScore = frogPoints;
				matrixText.fontSize = 12;
				deathSecs += dt;
				genSecs = 0;
				secsPassed = 0;
				generated = false;
				test = "Score: " + int(frogPoints);
				test += "\n";
				test += "High Score: " + int(highScore);
				test += "\n";
				test += "Try again in: " + int(3 - int(deathSecs));
				
				
				for (t = 0; t < LEVELS_0; t++)
				{	
					for (u = 0; u < TRACKS_0; u++)
					{
						gameMatrix[t][u] = 0;
					}
				}
				
				gameMatrix[3][1] = 2;
				
				matrixText.text = test;
				
				if (deathSecs >= 3)
				{
					currentPos = 1;
					character1.visible = true;
					dead = false;
					deathSecs = 0;
					frogPoints = 0;
					increasement = 0;
					matrixText.visible = false;
				}
			}
		}
		
		private function generateEnemy():void
		{
			currentTrack = Math.random() * 3;
			while(gameMatrix[0][currentTrack] ==1) currentTrack = Math.random() * 3;
			gameMatrix[0][currentTrack] = 1;
		}
		
		private function drawCapa0():void
		{
			//var screen:Image = new Image(Assets.getAtlas().getTexture("DETB_BG"));
			//capa0.addChild(screen);
			
			character0 = new MovieClip(Assets.getAtlas().getTextures("DETB_Left_I"), 3);
			starling.core.Starling.juggler.add(character0);
			capa0.addChild(character0);
			character0.y = heightCapa0 - character0.height-3;
			character0.x = 0;
			character0.visible = false;
			
			character1 = new MovieClip(Assets.getAtlas().getTextures("DETB_Front_I"), 3);
			starling.core.Starling.juggler.add(character1);
			capa0.addChild(character1);
			character1.y = heightCapa0 - character1.height-3;
			character1.x = 50;
			character1.visible = true;
			
			character2 = new MovieClip(Assets.getAtlas().getTextures("DETB_Right_I"), 3);
			starling.core.Starling.juggler.add(character2);
			capa0.addChild(character2);
			character2.y = heightCapa0 - character2.height-3;
			character2.x = 100;
			character2.visible = false;
			
			mouth0 = new Image(Assets.getAtlas().getTexture("DETB_Left_Open"));
			capa0.addChild(mouth0);
			mouth0.y = heightCapa0 - mouth0.height-3;
			mouth0.x = 0;
			mouth0.visible = false;
			
			mouth1 = new Image(Assets.getAtlas().getTexture("DETB_Front_Open"));
			mouth1.y = heightCapa0 - mouth1.height-3;
			mouth1.x = 50;
			capa0.addChild(mouth1);
			mouth1.visible = false;
			
			mouth2 = new Image(Assets.getAtlas().getTexture("DETB_Right_Open"));
			capa0.addChild(mouth2);
			mouth2.y = heightCapa0 - mouth2.height-3;
			mouth2.x = 100;
			mouth2.visible = false;
	
		}
		
		private function changeSprite0():void
		{	
			/*
					if (gameMatrix[t][u] == 2)
					{
						character0.visible = true; 
						character0.x = u*50;
					}
					*/
			
			if (currentPos == 0)
			{
				if (gameMatrix[3][currentPos] == 1)
				{
					
					mouth0.visible = true;
					character0.visible = false;
					character1.visible = false;
					character2.visible = false;
					mouth1.visible = false;
					mouth2.visible = false;
				}
				else 
				{
					character0.visible = true;
					character1.visible = false;
					character2.visible = false;
					mouth0.visible = false;
					mouth1.visible = false;
					mouth2.visible = false;
					
				}
				
			}
			
			else if (currentPos == 1)
			{
				if (gameMatrix[3][currentPos] == 1) 
				{
					mouth1.visible = true;
					character1.visible = false;
					character0.visible = false;
					character2.visible = false;
					mouth0.visible = false;
					mouth2.visible = false;
				}
				else
				{
					character1.visible = true;
					character0.visible = false;
					character2.visible = false;
					mouth0.visible = false;
					mouth1.visible = false;
					mouth2.visible = false;
				}

			}
			
			else if (currentPos == 2)
			{
				if (gameMatrix[3][currentPos] == 1) 
				{
					mouth2.visible = true;
					character2.visible = false;
					character1.visible = false;
					character0.visible = false;
					mouth0.visible = false;
					mouth1.visible = false;
				}
				else
				{
					character2.visible = true;
					character1.visible = false;
					character0.visible = false;
					mouth0.visible = false;
					mouth1.visible = false;
					mouth2.visible = false;
				}

			}

		}
		
		private function updateSprites0():void
		{
			for (var i:int = 0; i < bombsAway.length; i++)
			{
				capa0.removeChild(bombsAway[i]);
				bombsAway.splice(i, 1);
			}
			
			for (var t:int = 0; t < LEVELS_0; t++)
			{	
				for (var u:int= 0; u < TRACKS_0; u++)
				{
					if (gameMatrix[t][u] == 1)
					{
						var bomb:MovieClip = new MovieClip(Assets.getAtlas().getTextures("DETB_Bomb"), 3);
						starling.core.Starling.juggler.add(bomb);
						capa0.addChild(bomb);
						bomb.x = 50 * u +16;
						bomb.y = 40 * t;
						bombsAway.push(bomb);
					}
				}
			}	
		}
				
		private function moveLeftHand(dt:Number):void {
			
			// MOVE LEFT HAND
			var new_x:Number = CAPA_2_LEFT_MOUSE_X;
			var new_y:Number = CAPA_2_LEFT_MOUSE_Y;
			var speed_leftHand:Number = 500;
			
			if (!Input.isDown(Input.SPACE)) {
				if (GLOBAL_BOTON_W) {
					new_y -= dt * speed_leftHand;
				}
				if (GLOBAL_BOTON_S) {
					new_y += dt * speed_leftHand;
				}
				if (GLOBAL_BOTON_A) {
					new_x -= dt * speed_leftHand;
				}
				if (GLOBAL_BOTON_D) {
					new_x += dt * speed_leftHand;
				}
			}
			
			if (new_x > capa1.x +10 && new_y < capa1.y + heightCapa1 +55) { 
				var aux_desfase_x:int = new_x - (capa1.x +10);
				var aux_desfase_y:int = -(new_y -(capa1.y +heightCapa1));
				if (aux_desfase_x > aux_desfase_y) {
					new_y = capa1.y + heightCapa1 +55;
				}
				else {
					new_x = capa1.x +10;
				}
			}
			
			
			
			if ((new_x) > GAME.true_width / 2) {
				new_x = GAME.true_width / 2;
			}
			if (new_x < leftHand1.width/2 -35) {
				new_x = leftHand1.width/2 -35;
			}
			if (new_y > GAME.true_height - leftHand1.height/6 -16 +55) {
				new_y = GAME.true_height - leftHand1.height/6 -16 +55;
			}
			if (new_y < 55) {
				new_y = 55;
			}
			
			
			CAPA_2_LEFT_MOUSE_X = new_x;
			CAPA_2_LEFT_MOUSE_Y = new_y;
			
			leftHand1.x = CAPA_2_LEFT_MOUSE_X +35;
			leftHand1.y = CAPA_2_LEFT_MOUSE_Y -130 -55;
			leftHand2.x = leftHand1.x;
			leftHand2.y = leftHand1.y;
			
			//trace("X: " + CAPA_2_LEFT_MOUSE_X +"// Y: " + CAPA_2_LEFT_MOUSE_Y);
			
			leftShirt.x = leftHand1.x -120;
			leftShirt.y = leftHand1.y +310;

			// END MOVE LEFT HAND
			
		}
		
		private function moveRightHand(dt:Number):void {
			
			
			// MOVE RIGHT HAND
			
			var new_x:Number = rightHand1.x +50;
			var new_y:Number = rightHand1.y +185;
			var speed_rightHand:Number = 1000;
			
			if (GLOBAL_MOUSE_X != rightHand1.x) {
				if (GLOBAL_MOUSE_X > rightHand1.x) {
					new_x += dt * speed_rightHand;
					if (GLOBAL_MOUSE_X < new_x) new_x = GLOBAL_MOUSE_X;
				}
				else if (GLOBAL_MOUSE_X < rightHand1.x) {
						new_x -= dt * speed_rightHand;
					if (GLOBAL_MOUSE_X > new_x) new_x = GLOBAL_MOUSE_X;
				}
			}
			
			if (GLOBAL_MOUSE_Y != rightHand1.y) {
				if (GLOBAL_MOUSE_Y > rightHand1.y) {
					new_y += dt * speed_rightHand;
					if (GLOBAL_MOUSE_Y < new_y) new_y = GLOBAL_MOUSE_Y;
				}
				else if (GLOBAL_MOUSE_Y < rightHand1.y) {
					new_y -= dt * speed_rightHand;
					if (GLOBAL_MOUSE_Y > new_y) new_y = GLOBAL_MOUSE_Y;
				}
			}
			
			if (new_x < capa1.x + widthCapa1 && new_y < capa1.y + heightCapa1 +55) { 
				var aux_desfase_x:int = new_x -(capa1.x +widthCapa1);
				var aux_desfase_y:int = new_y -(capa1.y +heightCapa1);
				if (aux_desfase_x < aux_desfase_y) {
					new_y = capa1.y + heightCapa1 +55;
				}
				else {
					new_x = capa1.x + widthCapa1;
				}
			}
			
			if (mouseCatched) {
				
				// ESTA EN LO ROJO PERO NO EN LO VERDE
				if (GLOBAL_MOUSE_X > areaNeutral.x && GLOBAL_MOUSE_X < areaMouse.x) {
					new_x = areaMouse.x;
				}
				if (GLOBAL_MOUSE_X < areaNeutral.x + areaNeutral.width && GLOBAL_MOUSE_X > areaMouse.x + areaMouse.width) {
					new_x = areaMouse.x + areaMouse.width;
				}
				if (GLOBAL_MOUSE_Y > areaNeutral.y && GLOBAL_MOUSE_Y < areaMouse.y) {
					new_y = areaMouse.y
				}
				if (GLOBAL_MOUSE_Y < areaNeutral.y + areaNeutral.height && GLOBAL_MOUSE_Y > areaMouse.y + areaMouse.height) {
					new_y = areaMouse.y + areaMouse.height;
				}
				
			}
			
			if (new_x  < GAME.true_width / 2) {
				new_x = GAME.true_width / 2 ;
			}
			if (new_x -50 > GAME.true_width - rightHand1.width / 2) {
				new_x = GAME.true_width - rightHand1.width / 2 +50;
			}
			if (new_y -185 > GAME.true_height - rightHand1.height / 2) {
				new_y = GAME.true_height - rightHand1.height / 2 +185;
			}
			if (new_y < 55) {
				new_y = 55;
			}
			
			
			rightHand1.x = new_x -50;
			rightHand1.y = new_y -185;
			rightHand2.x = rightHand1.x;
			rightHand2.y = rightHand1.y;
			
			rightShirt.x = rightHand1.x +120;
			rightShirt.y = rightHand1.y +310;
			
			// END MOVE RIGHT HAND
			
		}
		
		private function checkMouse():void {
			
			// Degrees to Radians
			//radians = degrees * Math.PI / 180
 
			// Radians to Degrees
			//degree = radians * 180 / Math.PI
			
			if (mouseCatched) {
				
				if (GLOBAL_MOUSE_X <= areaNeutral.x || GLOBAL_MOUSE_X >= areaNeutral.x + areaNeutral.width ||
				GLOBAL_MOUSE_Y <= areaNeutral.y || GLOBAL_MOUSE_Y >= areaNeutral.y + areaNeutral.height) {
					mouseCatched = false;
				}
				else {		
					
					rightHandMouse1.x = rightHand1.x -70;
					rightHandMouse1.y = rightHand1.y +60;
					
					rightHandMouse2.x = rightHandMouse1.x;
					rightHandMouse2.y = rightHandMouse1.y;
					
					var point_hand_x:Number = rightHandMouse1.x + 100;
					var point_hand_y:Number = rightHandMouse1.y + 70;
				
					mouse.x = point_hand_x;
					mouse.y = point_hand_y;	
				}
				
			}
			else {
				
				if (GLOBAL_MOUSE_X >= areaMouse.x && GLOBAL_MOUSE_X <= areaMouse.x + areaMouse.width &&
				GLOBAL_MOUSE_Y >= areaMouse.y && GLOBAL_MOUSE_Y <= areaMouse.y + areaMouse.height) {
					mouseCatched = true;
				}
				
			}
			
		}
		
		
		private function checkSnowMan():void {
			
			if (snowManCatched) {

				
				if (GLOBAL_MOUSE_X < areaSnowMan.x || GLOBAL_MOUSE_X > areaSnowMan.x + areaSnowMan.width ||
				GLOBAL_MOUSE_Y < areaSnowMan.y || GLOBAL_MOUSE_Y > areaSnowMan.y + areaSnowMan.height) {
					snowManCatched = false;
				}
				else {
					
					var point_hand_x:Number = rightHand1.x + 25;
					var point_hand_y:Number = rightHand1.y - 0;
				
					snowMan.x = point_hand_x;
					snowMan.y = point_hand_y;	
				}
				
			}
			else {
				
				if (GLOBAL_MOUSE_X >= areaSnowMan.x && GLOBAL_MOUSE_X <= areaSnowMan.x + areaSnowMan.width &&
				GLOBAL_MOUSE_Y >= areaSnowMan.y && GLOBAL_MOUSE_Y <= areaSnowMan.y + areaSnowMan.height) {
					snowManCatched = true;
				}
				
			}

			
		}
		
		private function checkPhone():void {
			
			if (phoneCatched) {

				
				if (CAPA_2_LEFT_MOUSE_X < areaPhone.x || CAPA_2_LEFT_MOUSE_X > areaPhone.x + areaPhone.width ||
				CAPA_2_LEFT_MOUSE_Y < areaPhone.y || CAPA_2_LEFT_MOUSE_Y > areaPhone.y + areaPhone.height) {
					phoneCatched = false;
				}
				else {
					
					var point_hand_x:Number = leftHand1.x + leftHand1.width - 25;
					var point_hand_y:Number = leftHand1.y - 0;
				
					phone.x = point_hand_x;
					phone.y = point_hand_y;	
				}
				
			}
			else {
				
				if (CAPA_2_LEFT_MOUSE_X >= areaPhone.x && CAPA_2_LEFT_MOUSE_X <= areaPhone.x + areaPhone.width &&
				CAPA_2_LEFT_MOUSE_Y >= areaPhone.y && CAPA_2_LEFT_MOUSE_Y <= areaPhone.y + areaPhone.height) {
					phoneCatched = true;
				}
				
			}

			
		}
		
		private function checkCoffe():void {
			
			if (coffeCatched) {

				
				if (CAPA_2_LEFT_MOUSE_X < areaCoffe.x || CAPA_2_LEFT_MOUSE_X > areaCoffe.x + areaCoffe.width ||
				CAPA_2_LEFT_MOUSE_Y < areaCoffe.y || CAPA_2_LEFT_MOUSE_Y > areaCoffe.y + areaCoffe.height) {
					coffeCatched = false;
				}
				else {
					
					var point_hand_x:Number = leftHand1.x + leftHand1.width - 25;
					var point_hand_y:Number = leftHand1.y - 0;
				
					coffe.x = point_hand_x;
					coffe.y = point_hand_y;	
				}
				
			}
			else {
				
				if (CAPA_2_LEFT_MOUSE_X >= areaCoffe.x && CAPA_2_LEFT_MOUSE_X <= areaCoffe.x + areaCoffe.width &&
				CAPA_2_LEFT_MOUSE_Y >= areaCoffe.y && CAPA_2_LEFT_MOUSE_Y <= areaCoffe.y + areaCoffe.height) {
					coffeCatched = true;
				}
				
			}

			
		}
		
		private function shakeHands(intensity:Number):void {
			
			CAPA_2_LEFT_MOUSE_X += (Math.random() * 2 -1) *(intensity);
			CAPA_2_LEFT_MOUSE_Y += (Math.random() * 2 -1) * (intensity);
			
			GLOBAL_MOUSE_X += (Math.random() * 2 -1) * (intensity);
			GLOBAL_MOUSE_Y += (Math.random() * 2 -1) * (intensity);
			
		}
		
		private function checkPhoneEvent():void {
			
			if (phoneEvent <= 0) {
				
				if (channel_phone.soundTransform.volume == 0) {
					channel_phone = SoundPhone.play(0, 9999);
					channel_phone.soundTransform = new SoundTransform(1, -1);
				}
				
				
				if (phoneEvent <= -(3 + phoneBronca*3)) {
					
					phoneEvent = 30 + Math.random()*10;
					channel_phone.soundTransform = new SoundTransform(0, -1);
					phoneBronca++;
					
					if (phoneBronca > 3) {
						
						// ESTAS DESPEDIDO, MACHO
						trace ("FIRED, HIJOPUTA");
						
					}
					
				}
			}
			
		}
		
		private function Squeaky():void {
			var randi:Number = Math.random();
			if (randi > 9/10) SoundSqueak1_01.play();
			else if (randi > 8 / 10) SoundSqueak2_01.play();
			else if (randi > 7 / 10) SoundSqueak3_01.play();
			else if (randi > 6 / 10) SoundSqueak4_01.play();
			else if (randi > 5 / 10) SoundSqueak5_01.play();
			else if (randi > 4 / 10) SoundSqueak6_01.play();
			else if (randi > 3 / 10) SoundSqueak7_01.play();
			else if (randi > 2 / 10) SoundSqueak8_01.play();
			else if (randi > 1 / 10) SoundSqueak9_01.play();
			else SoundSqueak10_01.play();
		}
		
		private function Squeaky2():void {
			var randi:Number = Math.random();
			if (randi > 9/10) SoundSqueak1_02.play();
			else if (randi > 8 / 10) SoundSqueak2_02.play();
			else if (randi > 7 / 10) SoundSqueak3_02.play();
			else if (randi > 6 / 10) SoundSqueak4_02.play();
			else if (randi > 5 / 10) SoundSqueak5_02.play();
			else if (randi > 4 / 10) SoundSqueak6_02.play();
			else if (randi > 3 / 10) SoundSqueak7_02.play();
			else if (randi > 2 / 10) SoundSqueak8_02.play();
			else if (randi > 1 / 10) SoundSqueak9_02.play();
			else SoundSqueak10_02.play();
		}
		
		private function checkRightVisibility():void {
			
			if (mouseCatched) {
				if (GLOBAL_MOUSE_MANTAINED) {
					rightHandMouse2.visible = true;
					
					rightHand1.visible = false;
					rightHand2.visible = false;
					rightHandMouse1.visible = false;
				}
				else {
					rightHandMouse1.visible = true;
					
					rightHand1.visible = false;
					rightHand2.visible = false;
					rightHandMouse2.visible = false;
				}
			}
			else if (snowManCatched) {
				
			}
			else {
				if (GLOBAL_MOUSE_MANTAINED) {
					rightHand2.visible = true;
					
					rightHand1.visible = false;
					rightHandMouse1.visible = false;
					rightHandMouse2.visible = false;
				}
				else {
					rightHand1.visible = true;
					
					rightHand2.visible = false;
					rightHandMouse1.visible = false;
					rightHandMouse2.visible = false;
				}
			}
			
		}
		
		private function checkLeftVisibility():void {
			
			if (false) {
				
			}
			else {
				if (Input.isDown(Input.SPACE)) {
					leftHand2.visible = true;
					
					leftHand1.visible = false;
				}
				else {
					leftHand1.visible = true;
					
					leftHand2.visible = false;
				}
			}
			
		}
		
	}
	
}