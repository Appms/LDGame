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
		
		private var pcRunning:Boolean;
		private var game1Running:Boolean;
		
		private var widthCapa1:Number;
		private var heightCapa1:Number;
		
		private var lifes:Number;
		private var lifesArray:Array;
		private var lifeUp:Sprite;
		private var lifeUpDt:Number;
		
		private var backgroundGame1:Sprite;
		private var character:MovieClip;
		private var characterWalk:MovieClip;
		private var characterJump:MovieClip;
		private var characterHurt:MovieClip;
		private var characterDeath:MovieClip;
		private var oversize:MovieClip;
		private var glassface:Sprite;
		private var jumptimer:Number;
		private var hurttimer:Number;
		private var pisotoneando:Boolean;
		private var hurt:Boolean;
		private var game1over:Boolean;
		private var game1overDelay:Number;
		private var character_basescale:Number;
		
		private var fairy:MovieClip;
		private var fairy_laser:MovieClip;
		private var laserTimer:Number;
		
		private var newEnemy:MovieClip;
		private var enemyArray:Array;
		private var enemySpawner:Number;
		private var enemySplash:MovieClip;
		
		private var LB:Sprite;
		private var RB:Sprite;
		private var LBPressed:Boolean;
		private var RBPressed:Boolean;
		private var LBdt:Number;
		private var RBdt:Number;
		
		private var closeIcon:Sprite;
		
		// PC
		private var wallpaper:Sprite;
		private var txtIcon:Sprite;
		private var txtInfo:Sprite;
		private var txtClose:Sprite;
		private var gameIcon:Sprite;
		private var cursor:Sprite;
		
		// ATRIBUTOS PROPORCIONADOS POR CAPA 2
		
		private var CAPA_2_BOTON_ESPACIO:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_IZQ:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_DER:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_ARR:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_ABA:Boolean = false;
		private var CAPA_2_MOUSE_CLICKED:Boolean = false;
		
		private var CAPA_2_LEFT_MOUSE_X:Number = 200;
		private var CAPA_2_LEFT_MOUSE_Y:Number = 500;
		
		private var leftHand:Sprite;
		private var rightHand:Sprite;
		
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
			pcRunning = false;
			game1Running = false;
			
			loadPC();
			
			
			
			// *********************** CAPA 2 ***********************
			
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
			i = new Image(Assets.getAtlas().getTexture("phone_base"));
			phone_base.addChild(i);
			capa2.addChild(phone_base);
			phone_base.x = areaPhone.x + areaPhone.width/2 - phone_base.width/2 -14;
			phone_base.y = areaPhone.y + areaPhone.height / 2 - phone_base.height / 2;
			
			phone = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("phone"));
			phone.addChild(i);
			capa2.addChild(phone);
			phone.x = areaPhone.x + areaPhone.width/2 - phone.width/2 -14;
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
			
			leftHand = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("OFFICE_hand_mouse_01"));
			i.scaleX *= -1;
			leftHand.addChild(i);
			capa2.addChild(leftHand);
			leftHand.x = CAPA_2_LEFT_MOUSE_X - leftHand.width;
			leftHand.y = CAPA_2_LEFT_MOUSE_Y;
			

			rightHand = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("OFFICE_hand_mouse_01"));
			rightHand.addChild(i);
			capa2.addChild(rightHand);
			GLOBAL_MOUSE_X = GAME.true_width / 2 + GAME.true_width / 4;
			GLOBAL_MOUSE_Y = 500;	
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
			
			// ****************** CAPA 0 ******************
			
			updateCapa0(e.passedTime);
			
			// ****************** CAPA 1 ******************
			
			if (pcRunning) updatePC(e.passedTime);
			if (game1Running) updateGame1(e.passedTime);
			
			// ****************** CAPA 2 ******************
			
			phoneEvent -= e.passedTime;
			checkPhoneEvent();
			
			moveLeftHand(e.passedTime);
			moveRightHand(e.passedTime);
			checkMouse();
			checkSnowMan();
			checkPhone();
			checkCoffe();
			//ira += e.passedTime;
			shakeHands(ira);
			
			
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
		
		// PC
		
		private function loadPC():void {
			// Cool animations
			initPC();
		}
		
		private function initPC():void {
			var img: Image;
			
			wallpaper = new Sprite();
			img = new Image(Assets.getTexture("wallpaper"));
			wallpaper.addChild(img);
			capa1.addChild(wallpaper);
			wallpaper.scaleX = 0.21;
			wallpaper.scaleY = 0.25;
			
			txtIcon = new Sprite();
			img = new Image(Assets.getTexture("txtIcon"));
			txtIcon.addChild(img);
			capa1.addChild(txtIcon);
			txtIcon.x = 25;
			txtIcon.y = 25;
			txtIcon.pivotX = txtIcon.width / 2;
			txtIcon.pivotY = txtIcon.height / 2;
			txtIcon.scaleX = 0.25;
			txtIcon.scaleY = 0.25;
			
			
			txtInfo = new Sprite();
			img = new Image(Assets.getTexture("txtInfo"));
			txtInfo.addChild(img);
			capa1.addChild(txtInfo);
			txtInfo.x = widthCapa1 / 4;
			txtInfo.y = heightCapa1 / 4;
			txtInfo.scaleX = 0.5;
			txtInfo.scaleY = 0.5;
			txtInfo.visible = false;
			
			txtClose = new Sprite();
			img = new Image(Assets.getTexture("txtClose"));
			txtClose.addChild(img);
			capa1.addChild(txtClose);
			txtClose.scaleX = txtInfo.scaleX;
			txtClose.scaleY = txtInfo.scaleY;
			txtClose.x = txtInfo.x + 504*txtClose.scaleX;
			txtClose.y = txtInfo.y + 8*txtClose.scaleY;
			txtClose.visible = false;
			
			gameIcon = new Sprite();
			img = new Image(Assets.getTexture("gameIcon"));
			gameIcon.addChild(img);
			capa1.addChild(gameIcon);
			gameIcon.x = 25;
			gameIcon.y = 100;
			gameIcon.pivotX = gameIcon.width / 2;
			gameIcon.pivotY = gameIcon.height / 2;
			gameIcon.scaleX = 0.65;
			gameIcon.scaleY = 0.65;
			
			cursor = new Sprite();
			img = new Image(Assets.getTexture("cursor"));
			cursor.addChild(img);
			capa1.addChild(cursor);
			cursor.x = widthCapa1/2;
			cursor.y = heightCapa1/2;
			cursor.scaleX = 0.025;
			cursor.scaleY = 0.025;
			
			pcRunning = true;
		}
		
		private function updatePC(dt:Number):void {
			
			if (mouseCatched) {
				cursor.x = (GLOBAL_MOUSE_X - areaMouse.x)*2;
				cursor.y = (GLOBAL_MOUSE_Y - areaMouse.y)*2;
			}
			
			if (cursor.x+cursor.width > widthCapa1) cursor.x = widthCapa1-cursor.width;
			if (cursor.x < 0) cursor.x = 0;
			if (cursor.y+cursor.height > heightCapa1) cursor.y = heightCapa1-cursor.height;
			if (cursor.y < 0) cursor.y = 0;
			
			if (CAPA_2_MOUSE_CLICKED) {
				checkPCClick();
			}
		}
		
		private function checkPCClick():void {
			if ( Math.abs(gameIcon.x - cursor.x) < gameIcon.width/2 && Math.abs(gameIcon.y - cursor.y) < gameIcon.height/2)  {
				shutdownPC();
				initGame1();
			}
			if ( txtInfo.visible == false && Math.abs(txtIcon.x - cursor.x) < txtIcon.width/2 && Math.abs(txtIcon.y - cursor.y) < txtIcon.height/2)  {
				txtInfo.visible = true;
				txtClose.visible = true;
			}
			
			if ( txtInfo.visible == true && Math.abs(txtClose.x+txtClose.width/2 - cursor.x) < txtClose.width/2 && Math.abs(txtClose.y+txtClose.height/2 - cursor.y) < txtClose.height/2)  {
				txtInfo.visible = false;
				txtClose.visible = false;
			}
		}
				
				
			
		
		private function shutdownPC():void {
			capa1.removeChildren();
			pcRunning = false;
		}
		
		// GAME1
		
		private function initGame1():void {
			
			var img:Image;
			
			enemyArray = new Array();
			
			jumptimer = 0;
			hurttimer = 0;
			enemySpawner = 8 + Math.random()*5;
			character_basescale = 1;
			
			game1over = false;
			game1overDelay = 2;
			
			backgroundGame1 = new Sprite();
			img = new Image(Assets.getAtlas().getTexture("capa1"));
			backgroundGame1.addChild(img);
			capa1.addChild(backgroundGame1);
			backgroundGame1.x = 0;
			backgroundGame1.y = 0;
			
			closeIcon = new Sprite();
			img = new Image(Assets.getTexture("closeIcon"));
			closeIcon.addChild(img);
			capa1.addChild(closeIcon);
			closeIcon.scaleX = 0.1;
			closeIcon.scaleY = 0.1;
			closeIcon.x = widthCapa1 - closeIcon.width*1.25;
			closeIcon.y = closeIcon.height/4;
			closeIcon.pivotX = closeIcon.width / 2;
			closeIcon.pivotY = closeIcon.height / 2;
			
			
			RB = new Sprite();
			img = new Image(Assets.getTexture("RB"));
			RB.addChild(img);
			capa1.addChild(RB);
			RB.x = widthCapa1 / 2 + 30;
			RB.y = heightCapa1 / 2 + 100 ;
			RB.pivotX = RB.width / 2;
			RB.pivotY = RB.height / 2;
			RB.scaleX = 0.2;
			RB.scaleY = 0.1;
			
			LB = new Sprite();
			img = new Image(Assets.getTexture("LB"));
			LB.addChild(img);
			capa1.addChild(LB);
			LB.x = widthCapa1 / 2 - 49;
			LB.y = heightCapa1 / 2 + 63;
			LB.pivotX = LB.width / 2;
			LB.pivotY = LB.height / 2;
			LB.scaleX = 0.15;
			LB.scaleY = 0.08;
			
			RBdt = 0;
			LBdt = 0;
			
			
			character = new MovieClip(Assets.getAtlas().getTextures("SCA_hero_idle"), 6);
			starling.core.Starling.juggler.add(character);
			capa1.addChild(character);
			character.x = widthCapa1/2;
			character.y = heightCapa1 - 50;
			character.pivotX = character.width / 2;
			character.pivotY = character.height / 2;
			character.visible = true;
			
			characterWalk = new MovieClip(Assets.getAtlas().getTextures("SCA_hero_walk"), 6);
			starling.core.Starling.juggler.add(characterWalk);
			capa1.addChild(characterWalk);
			characterWalk.x = character.x;
			characterWalk.y = character.y;
			characterWalk.pivotX = characterWalk.width / 2;
			characterWalk.pivotY = characterWalk.height / 2;
			characterWalk.visible = false;
			
			characterJump = new MovieClip(Assets.getAtlas().getTextures("SCA_hero_jump"), 6);
			starling.core.Starling.juggler.add(characterJump);
			capa1.addChild(characterJump);
			characterJump.x = character.x;
			characterJump.y = character.y;
			characterJump.pivotX = character.width / 2;
			characterJump.pivotY = character.height / 2;
			characterJump.visible = false;
			characterJump.stop();
			
			characterHurt = new MovieClip(Assets.getAtlas().getTextures("SCA_hero_hurt"), 6);
			starling.core.Starling.juggler.add(characterHurt);
			capa1.addChild(characterHurt);
			characterHurt.x = character.x;
			characterHurt.y = character.y;
			characterHurt.pivotX = character.width / 2;
			characterHurt.pivotY = character.height / 2;
			characterHurt.visible = false;
			characterHurt.stop();
			
			characterDeath = new MovieClip(Assets.getAtlas().getTextures("SCA_hero_death"), 0.5);
			starling.core.Starling.juggler.add(characterDeath);
			capa1.addChild(characterDeath);
			characterDeath.addFrameAt(0, Assets.getAtlas().getTexture("SCA_hero_hurt_01"), null, 1 / 6);
			characterDeath.x = character.x;
			characterDeath.y = character.y;
			characterDeath.pivotX = character.width / 2;
			characterDeath.pivotY = character.height / 2;
			characterDeath.visible = false;
			characterDeath.stop();
			
			oversize = new MovieClip(Assets.getAtlas().getTextures("SCA_hero_face"), 3);
			starling.core.Starling.juggler.add(oversize);
			capa1.addChild(oversize);
			oversize.x = widthCapa1 / 2;
			oversize.y = heightCapa1 + oversize.height + 50;
			oversize.pivotX = oversize.width / 2;
			oversize.pivotY = oversize.height / 2;
			
			glassface = new Sprite();
			img = new Image(Assets.getAtlas().getTexture("SCA_hero_glassface"));
			glassface.addChild(img);
			capa1.addChild(glassface);
			glassface.x = widthCapa1 / 2;
			glassface.y = heightCapa1 / 2;
			glassface.pivotX = glassface.width / 2;
			glassface.pivotY = glassface.height / 2;
			glassface.visible = false;
			
			
			laserTimer = 0;
			
			fairy = new MovieClip(Assets.getAtlas().getTextures("SCA_eye_fly"), 6);
			starling.core.Starling.juggler.add(fairy);
			capa1.addChild(fairy);
			fairy.pivotX = fairy.width / 2;
			fairy.pivotY = fairy.height / 2;
			fairy.x = widthCapa1 / 2;
			fairy.y = heightCapa1 / 2;
			
			fairy_laser = new MovieClip(Assets.getAtlas().getTextures("SCA_eye_laser"), 6);
			starling.core.Starling.juggler.add(fairy_laser);
			capa1.addChild(fairy_laser);
			fairy_laser.pivotX = fairy.pivotX;
			fairy_laser.pivotY = fairy.pivotY;
			fairy_laser.visible = false;
			
			lifes = 3;
			lifesArray = new Array();
			drawLifes();
			lifeUpDt = 0;
			
			game1Running = true;
		}
		
		
		private function updateGame1(dt:Number):void {
			
			if (!game1over) {
				
				if (laserTimer > 0) {
					laserTimer -= dt;
				}
				else if (CAPA_2_MOUSE_CLICKED) {
					checkGame1Click();
				}
				else {
					fairy.visible = true;
					fairy_laser.visible = false;
				}
				
				
				// Movimiento Personaje
				if (!pisotoneando && !hurt) {
					
					character.visible = true;
					characterWalk.visible = false;
					
					if (CAPA_2_BOTON_FLECHA_ARR) {
						if ( character.y > heightCapa1 / 2 + 34) {
							character.y -= 120 * dt;
							if (character.scaleX > 0) character.scaleX = character_basescale + (character.y - 250) / 250;
							else character.scaleX = -(character_basescale + (character.y - 250) / 250);
							character.scaleY = character_basescale + (character.y - 250) / 250;
							if (characterWalk.visible == false) {
								characterWalk.visible = true;
								character.visible = false;
							}
							
							oversize.y += 240 * dt;
							if (oversize.y <= heightCapa1/2 + 50) {
								glassface.visible = true;
								oversize.visible = false;
							}
							else {
								glassface.visible = false;
								oversize.visible = true;
							}
						}
						
						characterWalk.scaleX = character.scaleX;
						characterWalk.scaleY = character.scaleY;
					}
					
					else if (CAPA_2_BOTON_FLECHA_IZQ) {
						if (character.x > 0) {
							character.x -= 160*dt;
							if (characterWalk.visible == false) {
								characterWalk.visible = true;
								character.visible = false;
							}
							if (character.scaleX < 0) character.scaleX *= -1;
							characterWalk.scaleX = character.scaleX;
						}
					}
					
					else if (CAPA_2_BOTON_FLECHA_ABA) {
						if (character.y < heightCapa1+250) {
							character.y += 120 * dt;
							if (character.scaleX > 0) character.scaleX = character_basescale + (character.y - 250) / 250;
							else character.scaleX = -(character_basescale + (character.y - 250) / 250);
							character.scaleY = character_basescale + (character.y - 250) / 250;
							
							if (characterWalk.visible == false) {
								characterWalk.visible = true;
								character.visible = false;
							}
							
							oversize.y -= 240 * dt;
							if (oversize.y <= heightCapa1/2 + 50) {
								glassface.visible = true;
								oversize.visible = false;
							}
							else {
								glassface.visible = false;
								oversize.visible = true;
							}
						}
						
						characterWalk.scaleX = character.scaleX;
						characterWalk.scaleY = character.scaleY;
					}
					
					else if (CAPA_2_BOTON_FLECHA_DER) {
						if (character.x < widthCapa1) {
							character.x += 160*dt;
							if (characterWalk.visible == false) {
								characterWalk.visible = true;
								character.visible = false;
							}
							if (character.scaleX > 0) character.scaleX *= -1;
							characterWalk.scaleX = character.scaleX;
						}
					}
					
					characterWalk.x = character.x;
					characterWalk.y = character.y;
				}
				
				// Salto Personaje
				if (GLOBAL_BOTON_ESPACIO && !pisotoneando && !hurt) {
					pisotoneando = true;
					character.visible = false;
					characterWalk.visible = false;
					characterJump.x = character.x;
					characterJump.y = character.y;
					characterJump.scaleX = character.scaleX;
					characterJump.scaleY = character.scaleY;
					characterJump.visible = true;
					
					characterJump.play();
					var img:Image;
					if (Math.abs(RB.x - character.x) < RB.width/2 && Math.abs(RB.y - character.y -23) < RB.height/2)
					{
						RB.removeChildren();
						img = new Image(Assets.getTexture("RBP"));
						RB.addChild(img)
						RBPressed = true;
						CAPA_1_BOTON_DER = true;
					}
					else if (Math.abs(LB.x - character.x) < LB.width/2 && Math.abs(LB.y - character.y -21) < LB.height/2 - 2)
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
						characterJump.stop();
						characterJump.visible = false;
						character.visible = true;
						jumptimer = 0;
					}
				}
				if (hurt) {
					hurttimer += dt;
					if (hurttimer >= 0.5) {
						hurt = false;
						characterHurt.stop();
						characterHurt.visible = false;
						character.visible = true;
						hurttimer = 0;
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
				
				
				// Movimiento Hadita/Cursor
				
				//fairy.x += (GLOBAL_MOUSE_X - capa1.x - fairy.x) / 3;
				//fairy.y += (GLOBAL_MOUSE_Y - capa1.y - fairy.y) / 3;
				
				if (mouseCatched) {
					fairy.x = (GLOBAL_MOUSE_X - areaMouse.x)*2;
					fairy.y = (GLOBAL_MOUSE_Y - areaMouse.y)*2;
				}
				
				
				if (fairy.x + fairy.width/4 > widthCapa1) fairy.x = widthCapa1-fairy.width/4;
				if (fairy.x - fairy.width/4 < 0) fairy.x = 0 + fairy.width/4;
				if (fairy.y + fairy.height/4 > heightCapa1) fairy.y = heightCapa1 - fairy.height/4;
				if (fairy.y - fairy.height/4 < 0) fairy.y = 0 + fairy.height/4;
				
				// Spawnear Enemigos
				enemySpawner -= dt;
				if (enemySpawner <= 0) {
					addEnemy();
					enemySpawner = 8 + Math.round(Math.random()*5);
				}
				
				// Movimiento Enemigos
				var i:Number;
				for (i = 0; i < enemyArray.length; i++) {
					if (enemyArray[i].scaleX > 0) {
						if (enemyArray[i].x <= 0) {
							capa1.removeChild(enemyArray[i]);
							enemyArray.splice(i, 1);
							if (i>0) i--;
						}
						else {
							enemyArray[i].x -= 80 * dt;
						}
					}
					else {
						if (enemyArray[i].x >= widthCapa1) {
							capa1.removeChild(enemyArray[i]);
							enemyArray.splice(i, 1);
							if (i>0) i--;
						}
						else {
							enemyArray[i].x += 80*dt;
						}
					}
				}
				
				enemyCollision();
				
				updateLifeUp(dt);
				
			}
			else {
				game1overDelay -= dt;
				if (game1overDelay <= 0) {
					game1overDelay = 2;
					game1Running = false;
					game1over = false;
					shutdownGame1();
					initGame1();
				}
			}
			
		}
		
		private function addEnemy():void {
			newEnemy = new MovieClip(Assets.getAtlas().getTextures("SCA_bug_walk"), 6);
			starling.core.Starling.juggler.add(newEnemy);
			capa1.addChild(newEnemy);
			newEnemy.pivotX = newEnemy.width / 2;
			newEnemy.pivotY = newEnemy.height / 2;
			
			if (Math.round(Math.random()) == 0) {
				newEnemy.x = 0;
				newEnemy.scaleX *= -1;
			}
			else {
				newEnemy.x = widthCapa1;
			}
			newEnemy.y = heightCapa1 / 2 + 60 + Math.random() * 60.0;
			
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
		
		private function checkGame1Click():void {
			laserTimer = 0.5;
			fairy_laser.x = fairy.x;
			fairy_laser.y = fairy.y;
			fairy_laser.visible = true;
			fairy.visible = false;
			
			var i:Number;
			for (i = 0; i < enemyArray.length; i++) {
				if ( Math.sqrt(Math.pow((enemyArray[i].x - (fairy.x)), 2) + Math.pow((enemyArray[i].y - (fairy.y)), 2)) < 25)  {
					if (lifeUp == null && Math.round(Math.random() * 1) == 0) spawnLife(enemyArray[i].x, enemyArray[i].y);
					capa1.removeChild(enemyArray[i]);
					enemyArray.splice(i, 1);
				}
			}
			
			if ( Math.sqrt(Math.pow((closeIcon.x - fairy.x+20), 2) + Math.pow((closeIcon.y - fairy.y), 2)) < closeIcon.width)  {
				shutdownGame1();
				initPC();
			}
		}
		
		private function spawnLife(x:Number, y:Number):void {
			lifeUp = new Sprite();
			var i:Image = new Image(Assets.getAtlas().getTexture("SCA_vida"));
			lifeUp.addChild(i);
			capa1.addChild(lifeUp);
			lifeUp.x = x;
			lifeUp.y = y;
			lifeUp.pivotX = lifeUp.width / 2;
			lifeUp.pivotY = lifeUp.height / 2;
			lifeUp.scaleX = 0.75;
			lifeUp.scaleY = 0.75;
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
			hurt = true;
			character.visible = false;
			characterWalk.visible = false;
			characterJump.visible = false;
			characterHurt.x = character.x;
			characterHurt.y = character.y;
			characterHurt.scaleX = character.scaleX;
			characterHurt.scaleY = character.scaleY;
			characterHurt.visible = true;
			characterHurt.play();
			
			if (lifes <= 0) {
				characterDeath.x = character.x;
				characterDeath.y = character.y;
				characterDeath.scaleX = character.scaleX;
				characterDeath.scaleY = character.scaleY;
				characterDeath.stop();
				characterDeath.play();
				characterDeath.visible = true;
				characterJump.visible = false;
				characterWalk.visible = false;
				characterHurt.visible = false;
				character.visible = false;
				game1over = true;
			}
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
				var img:Image = new Image(Assets.getAtlas().getTexture("SCA_vida"));
				life.addChild(img);
				capa1.addChild(life);
				life.x = (life.width-8) * i;
				life.y = 0;
				lifesArray.push(life);
			}
		}
		
		private function shutdownGame1():void {
			capa1.removeChildren();
			game1Running = false;
		}
		
		// GAME 0
		
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
			
			
			if (new_x > capa1.x && new_y < capa1.y + heightCapa1) { 
				var aux_desfase_x:int = new_x - capa1.x;
				var aux_desfase_y:int = -(new_y -(capa1.y +heightCapa1));
				if (aux_desfase_x > aux_desfase_y) {
					new_y = capa1.y + heightCapa1;
				}
				else {
					new_x = capa1.x;
				}
			}
			
			
			
			if ((new_x) > GAME.true_width / 2) {
				new_x = GAME.true_width / 2;
			}
			if (new_x - leftHand.width < -leftHand.width/2) {
				new_x = -leftHand.width/2 +leftHand.width;
			}
			if (new_y > GAME.true_height - leftHand.height/2) {
				new_y = GAME.true_height - leftHand.height/2;
			}
			if (new_y < 0) {
				new_y = 0;
			}
			
			CAPA_2_LEFT_MOUSE_X = new_x;
			CAPA_2_LEFT_MOUSE_Y = new_y;
			
			leftHand.x = CAPA_2_LEFT_MOUSE_X - leftHand.width;
			leftHand.y = new_y;

			// END MOVE LEFT HAND
			
		}
		
		private function moveRightHand(dt:Number):void {
			
			
			// MOVE RIGHT HAND
			if (rightHand.rotation != 0) {
				rightHand.x += 30;
				rightHand.y -= 10;
				rightHand.rotation = 0;
			}
			
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
			
			if (new_x < capa1.x + widthCapa1 && new_y < capa1.y + heightCapa1) { 
				var aux_desfase_x:int = new_x -(capa1.x +widthCapa1);
				var aux_desfase_y:int = new_y -(capa1.y +heightCapa1);
				if (aux_desfase_x < aux_desfase_y) {
					new_y = capa1.y + heightCapa1;
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
			
			if (new_x < GAME.true_width / 2) {
				new_x = GAME.true_width / 2;
			}
			if (new_x > GAME.true_width - rightHand.width / 2) {
				new_x = GAME.true_width - rightHand.width / 2;
			}
			if (new_y > GAME.true_height - rightHand.height / 2) {
				new_y = GAME.true_height - rightHand.height / 2;
			}
			
			rightHand.x = new_x;
			rightHand.y = new_y;
			
			// END MOVE RIGHT HAND
			
		}
		
		private function checkMouse():void {
			
			// Degrees to Radians
			//radians = degrees * Math.PI / 180
 
			// Radians to Degrees
			//degree = radians * 180 / Math.PI
			
			if (mouseCatched) {
				if (rightHand.rotation != 0) {
					rightHand.x += 30;
					rightHand.y -= 10;
					rightHand.rotation = 0;
				}
				
				if (GLOBAL_MOUSE_X < areaNeutral.x || GLOBAL_MOUSE_X > areaNeutral.x + areaNeutral.width ||
				GLOBAL_MOUSE_Y < areaNeutral.y || GLOBAL_MOUSE_Y > areaNeutral.y + areaNeutral.height) {
					mouseCatched = false;
					if (rightHand.rotation != 0) {
						rightHand.x += 30;
						rightHand.y -= 10;
						rightHand.rotation = 0;
					}
				}
				else {
					
					if (rotation == 0) {
						rightHand.rotation = ( -30) * Math.PI / 180;
						rightHand.x -= 30;
						rightHand.y += 10;
					}
					
					var point_hand_x:Number = rightHand.x + 25;
					var point_hand_y:Number = rightHand.y - 0;
				
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
					
					var point_hand_x:Number = rightHand.x + 25;
					var point_hand_y:Number = rightHand.y - 0;
				
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
					
					var point_hand_x:Number = leftHand.x + leftHand.width - 25;
					var point_hand_y:Number = leftHand.y - 0;
				
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
					
					var point_hand_x:Number = leftHand.x + leftHand.width - 25;
					var point_hand_y:Number = leftHand.y - 0;
				
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
		
	}
	
}