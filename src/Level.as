package  
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
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
	import starling.display.BlendMode;
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
		
		private var gitanada:Boolean = false;
		
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
		public var SoundSecretary:Sound = new Assets.SoundSecretary() as Sound;
		public var SoundBoss:Sound = new Assets.SoundBoss() as Sound;
		public var SoundKey:Sound = new Assets.SoundKey() as Sound;
		public var SoundClick:Sound = new Assets.SoundClick() as Sound;
		public var SoundSlurp:Sound = new Assets.SoundSlurp() as Sound;
		public var SoundMumble1:Sound = new Assets.SoundMumble1() as Sound;
		public var SoundMumble3:Sound = new Assets.SoundMumble3() as Sound;
		public var SoundMumble4:Sound = new Assets.SoundMumble4() as Sound;
		public var SoundPunchKeyboard:Sound = new Assets.SoundPunchKeyboard() as Sound;
		
		private var capa0:Sprite;
		private var capa0_ruido:MovieClip;
		private var capa1:Sprite;
		private var capa1_careto:Sprite;
		private var capa1_ruido:MovieClip;
		private var capa1_raja:Sprite;
		private var capa2:Sprite;
		
		
		// ATRIBUTOS PROPORCIONADOS POR CAPA 0
		
		public const LEVELS_0:int = 4;
		public const TRACKS_0:int  = 3;
		
		public var FrogDead:Sound = new Assets.FrogDeath() as Sound;
		public var FrogMove:Sound = new Assets.FrogMove() as Sound;
		public var FrogTick:Sound = new Assets.FrogTick() as Sound;
		public var OfficeSound:Sound = new Assets.OfficeSound() as Sound;
		private var FrogIntro:Sound = new Assets.FrogIntro() as Sound;
		
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
		private var intro:MovieClip;
		private var bombsAway:Array;
		private var widthCapa0:Number;
		private var heightCapa0:Number;
		private var mouth0:Image;
		private var mouth1:Image;
		private var mouth2:Image;
		private var screen:Image;
		private var death0:MovieClip;
		private var death1:MovieClip;
		private var death2:MovieClip;
		private var secs:Number = 4;
		private var initFrog:Boolean;
		private var frogRunning:Boolean;
		private var copyText:TextField;
		private var numBombs:Number;
		private var bombScore:TextField;
		private var bombScoreCopy:TextField;
		private var pressText:TextField;
		private var pressTextCopy:TextField;
		
		private var muertisimo:Boolean = false;
		
		// ATRIBUTOS PROPORCIONADOS POR CAPA 1
		
		public var channel_SCA_Main:SoundChannel = new SoundChannel();
		public var SCA_Main:Sound = new Assets.SCA_Main() as Sound;
		
		public var powerUp:Sound = new Assets.PowerUp() as Sound;
		public var buttonPushed:Sound = new Assets.ButtonSound() as Sound;
		
		public var step1:Sound = new Assets.Step1() as Sound;
		public var step2:Sound = new Assets.Step2() as Sound;
		
		public var StartUp:Sound = new Assets.StartUp() as Sound;
		public var BugSound:Sound = new Assets.BugSound() as Sound;
		public var JumpSound:Sound = new Assets.JumpSound() as Sound;
		public var HurtSound:Sound = new Assets.HurtSound() as Sound;
		public var DeathSound:Sound = new Assets.DeathSound() as Sound;
		public var LaserSound:Sound = new Assets.LaserSound() as Sound;
		
		public var umad1:Sound = new Assets.umad1() as Sound;
		public var umad2:Sound = new Assets.umad2() as Sound;
		public var umad3:Sound = new Assets.umad3() as Sound;
		public var umad4:Sound = new Assets.umad4() as Sound;
		public var SoundFired:Sound = new Assets.SoundFired() as Sound;
		
		public var SnowmanExplodes:Sound = new Assets.SnowmanExplodes() as Sound;
		
		
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
		
		private var stepDelay:Number;
		private var stepBool:Boolean;
		
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
		
		private var pcLoading:Boolean;
		
		private var loadGame1Screen:Sprite;
		private var loadGame1Title:MovieClip;
		private var loadGame1Timer:Number;
		
		
		
		
		// PC
		private var loadScreen:MovieClip;
		private var visibleLoadScreen:MovieClip;
		private var loadStaticScreen:Sprite;
		private var wallpaper:Sprite;
		private var txtIcon:Sprite;
		private var txtInfo:Sprite;
		private var theInternet:MovieClip;
		private var txtClose:Sprite;
		private var gameIcon:Sprite;
		private var cursor:Sprite;
		private var internetIcon:Sprite;
		
		//Sounds
		

		
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
		private var leftHandAnnoyed:Sprite;
		private var leftHandFist:Sprite;
		private var leftHandGrab:Sprite;
		private var leftHandPhoneCall:Sprite;
		private var leftHandPhone:Sprite;
		private var leftHandTaza1:Sprite;
		private var leftHandTaza2:Sprite;
		private var leftHandTaza3:Sprite;
		private var leftHandPalm1:Sprite;
		private var leftHandPalm2:Sprite;
		private var cercaTaza:Sprite;
		private var leftShirt:Sprite;
		
		private var rightHand1:Sprite;
		private var rightHand2:Sprite;
		private var rightHandMouse1:Sprite;
		private var rightHandMouse2:Sprite;
		private var rightHandAnnoyed:Sprite;
		private var rightHandFist:Sprite;
		private var rightHandSnowMan:Sprite;
		private var rightHandPalm1:Sprite;
		private var rightHandPalm2:Sprite;
		private var rightShirt:Sprite;
		
		private var computer:Sprite;
		private var keyboard:Sprite;
		private var keyboard_down:Sprite;
		private var keyboard_left:Sprite;
		private var keyboard_right:Sprite;
		private var keyboard_up:Sprite;
		private var keyboard_space:Sprite;
		
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
		private var phoneCall:Sprite;
		private var phoneCatched:Boolean = false;
		
		private var phoneEvent:Number = 0;
		private var phoneBronca:Number = 1;
		private var phoneTalking:Number = 0;
		private var leftHandMovingX:Number = 0;
		private var leftHandMovingY:Number = 0;
		
		private var areaCoffe:Sprite;
		private var coffe:Sprite;
		private var coffe2:Sprite;
		private var coffe3:Sprite;
		private var coffeCatched:Boolean = false;
		
		private var coffeAmount:Number = 2;
		private var coffeEvent:Number = 0;
		
		private var test_F_IZQ:Sprite;
		private var test_F_DER:Sprite;
		private var test_F_ARR:Sprite;
		private var test_F_ABA:Sprite;
		private var test_ESP:Sprite;
		private var test_BOOT:Sprite;
		
		private var textIra:TextField;
		private var textTime:TextField;
		private var globalTime:Number = 0;
		
		
		private var snowmanCooldown:Number = 100;
		private var snowmanBroken:Boolean;
		
		private var snDeskWarning:Sprite;
		private var snDeskExplode:Sprite;
		
		private var snHandWarning:Sprite;
		private var snHandExplode:Sprite;
		
		private var ojos:MovieClip;
		private var title:MovieClip;
		private var titleBackground:Sprite;
		private var ojosEnd:MovieClip;
		
		private var SCORE:TextField;
		
		private var raja:Sprite;
		
		//Rubén, ratón
		private var clickScreenButton:Boolean;
		
		// ATRIBUTOS PROPORCIONADOS GLOBALMENTE
		
		private var debug:Boolean = false;
		private var ira:Number = 0;
		private var fired:Boolean = false;
		private var rageSoft:Boolean = false;
		private var rageHard:Boolean = false;
		private var timeRageSoft:Number = 0;
		private var timeRageHard:Number = 0;
		private var punchTazaTime:Boolean = false;
		private var punchKeyboardTime:Boolean = false;
		private var punchScreenTime:Boolean = false;
		private var brokenScreen:Number = 0;
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
			Mouse.hide();
			

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

			var i:Image;
			capa0 = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("capa0"));
			capa0.addChild(i);
			i.visible = false;
			capa0.scaleX = 1.01;
			capa0.scaleY = 1.01;
			addChild(capa0);
			capa0.x = GAME.true_width/2 - capa0.width/2;
			capa0.y = 57;
			
			capa0_ruido= new MovieClip(Assets.getAtlas().getTextures("DETB0"), 5);
			starling.core.Starling.juggler.add(capa0_ruido);
			capa0_ruido.x = capa0.x + 2;
			capa0_ruido.y = capa0.y +2; 
			addChild(capa0_ruido);
			capa0_ruido.visible = false;
			
			capa1 = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("capa1"));
			i.visible = false;
			capa1.addChild(i);
			addChild(capa1);
			capa1.x = GAME.true_width/2 - capa1.width/2;
			capa1.y = 41;
			
			capa1_careto = new Sprite();
			addChild(capa1_careto);
			capa1_careto.x = GAME.true_width/2 - capa1.width/2;
			capa1_careto.y = 41;
			
			
			capa1_ruido = new MovieClip(Assets.getAtlas().getTextures("SCANoise"), 10);
			starling.core.Starling.juggler.add(capa1_ruido);
			capa1_ruido.x = capa1.x-2;
			capa1_ruido.y = capa1.y;
			capa1_ruido.scaleX = 4;
			capa1_ruido.scaleY = 4;
			addChild(capa1_ruido);
			capa1_ruido.visible = false;
			
			capa1_raja = new Sprite();
			addChild(capa1_raja);
			capa1_raja.x = GAME.true_width/2 - capa1.width/2;
			capa1_raja.y = 41;

			
			capa2 = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("capa2"));
			capa2.addChild(i);
			addChild(capa2);
			capa2.x = 0;
			capa2.y = 0;
			
			//**************** CAPA 0 ******************
			widthCapa0 = capa0.width;
			heightCapa0 = capa0.height;
			
			frogRunning = false;
			
			// ****************** CAPA 1 ******************
			widthCapa1 = capa1.width;
			heightCapa1 = capa1.height;
			
			pcLoading = false;
			pcRunning = false;
			game1Running = false;
			
					
			// *********************** CAPA 2 ***********************
			raja = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("SCA_screen_broken_02"));
			raja.addChild(i);
			
			computer = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_computer"));
			computer.addChild(i);
			capa2.addChild(computer);
			
			keyboard = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_keyboard"));
			keyboard.addChild(i);
			capa2.addChild(keyboard);
			
			keyboard_down = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_key_down"));
			keyboard_down.addChild(i);
			capa2.addChild(keyboard_down);
			
			keyboard_left = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_key_left"));
			keyboard_left.addChild(i);
			capa2.addChild(keyboard_left);
			
			keyboard_right = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_key_right"));
			keyboard_right.addChild(i);
			capa2.addChild(keyboard_right);
			
			keyboard_up = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_key_up"));
			keyboard_up.addChild(i);
			capa2.addChild(keyboard_up);
			
			keyboard_space = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_key_space"));
			keyboard_space.addChild(i);
			capa2.addChild(keyboard_space);
			capa2.addChild(keyboard_space);
			
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
			i = new Image(Assets.getAtlas2().getTexture("mouse"));
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
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_snowman"));
			snowMan.addChild(i);
			capa2.addChild(snowMan);
			//snowMan.x = areaSnowMan.x + areaSnowMan.width/2 - snowMan.width/2;
			//snowMan.y = areaSnowMan.y + areaSnowMan.height / 2 - snowMan.height / 2;
			
			snDeskWarning = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("SNDeskWarning"));
			i.blendMode = BlendMode.SCREEN;
			snDeskWarning.addChild(i);
			snDeskWarning.x = snowMan.x;
			snDeskWarning.y = snowMan.y;
			capa2.addChild(snDeskWarning);
			
			snDeskExplode = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_snowman_headless"));
			snDeskExplode.addChild(i);
			snDeskExplode.x = snowMan.x;
			snDeskExplode.y = snowMan.y;
			capa2.addChild(snDeskExplode);
			
			areaPhone = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("area_mouse"));
			areaPhone.addChild(i);
			capa2.addChild(areaPhone);
			if (debug) areaPhone.alpha = 0.2;
			else areaPhone.alpha = 0;
			areaPhone.x = 0;
			areaPhone.y = 225;
			
			phone_base = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_telefone_base"));
			phone_base.addChild(i);
			capa2.addChild(phone_base);
			phone_base.x = areaPhone.x + areaPhone.width/2 - phone_base.width/2 -32;
			phone_base.y = areaPhone.y + areaPhone.height / 2 - phone_base.height / 2;
			
			phone = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_telefone_01"));
			phone.addChild(i);
			capa2.addChild(phone);
			phone.x = areaPhone.x + areaPhone.width/2 - phone.width/2 -32;
			phone.y = areaPhone.y + areaPhone.height / 2 - phone.height / 2;
			
			phoneCall = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_telefone_02"));
			phoneCall.addChild(i);
			capa2.addChild(phoneCall);
			phoneCall.x = areaPhone.x + areaPhone.width/2 - phone.width/2 -32;
			phoneCall.y = areaPhone.y + areaPhone.height / 2 - phone.height / 2;
			
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
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_taza_01"));
			coffe.addChild(i);
			capa2.addChild(coffe);
			
			coffe2 = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_taza_02"));
			coffe2.addChild(i);
			capa2.addChild(coffe2);
			
			coffe3 = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_taza_03"));
			coffe3.addChild(i);
			capa2.addChild(coffe3);
			
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
			test_ESP.scaleY = 1.3;
			test_ESP.x = 165;
			test_ESP.y = 470 +30 +33 / 2 -test_ESP.height / 2;
			
			test_BOOT = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("test"));
			test_BOOT.addChild(i);
			capa2.addChild(test_BOOT);
			if (debug) test_BOOT.alpha = 0.4;
			else test_BOOT.alpha = 0;
			test_BOOT.x = 381;
			test_BOOT.y = 373;
			
			leftHand1 = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_hand_click_01"));
			i.scaleX *= -1;
			leftHand1.addChild(i);
			capa2.addChild(leftHand1);
			leftHand1.x = CAPA_2_LEFT_MOUSE_X;
			leftHand1.y = CAPA_2_LEFT_MOUSE_Y;
			
			leftHand2 = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_hand_click_02"));
			i.scaleX *= -1;
			leftHand2.addChild(i);
			capa2.addChild(leftHand2);
			
			leftHandAnnoyed = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_hand_annoyed"));
			i.scaleX *= -1;
			leftHandAnnoyed.addChild(i);
			capa2.addChild(leftHandAnnoyed);
			
			leftHandFist = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_hand_fist"));
			i.scaleX *= -1;
			leftHandFist.addChild(i);
			capa2.addChild(leftHandFist);
			
			leftHandGrab = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_hand_grab"));
			i.scaleX *= -1;
			leftHandGrab.addChild(i);
			capa2.addChild(leftHandGrab);
			
			leftHandPhoneCall = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_telefone_hand_01"));
			leftHandPhoneCall.addChild(i);
			capa2.addChild(leftHandPhoneCall);
			
			leftHandPhone = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_telefone_hand_02"));
			leftHandPhone.addChild(i);
			capa2.addChild(leftHandPhone);
			
			leftHandTaza1 = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_taza_hand_01"));
			leftHandTaza1.addChild(i);
			capa2.addChild(leftHandTaza1);
			
			leftHandTaza2 = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_taza_hand_02"));
			leftHandTaza2.addChild(i);
			capa2.addChild(leftHandTaza2);
			
			leftHandTaza3 = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_taza_hand_03"));
			leftHandTaza3.addChild(i);
			capa2.addChild(leftHandTaza3);
			
			leftHandPalm1 = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_hand_palm_01"));
			i.scaleX *= -1;
			leftHandPalm1.addChild(i);
			capa2.addChild(leftHandPalm1);
			
			leftHandPalm2 = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_hand_palm_02"));
			i.scaleX *= -1;
			leftHandPalm2.addChild(i);
			capa2.addChild(leftHandPalm2);
				
			leftShirt = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_shirt"));
			i.scaleX *= -1;
			leftShirt.addChild(i);
			capa2.addChild(leftShirt);
			

			rightHand1 = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_hand_click_01"));
			rightHand1.addChild(i);
			capa2.addChild(rightHand1);
			GLOBAL_MOUSE_X = GAME.true_width / 2 + GAME.true_width / 4;

			GLOBAL_MOUSE_Y = 500;	
			
			rightHand2 = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_hand_click_02"));
			rightHand2.addChild(i);
			capa2.addChild(rightHand2);
			
			rightHandMouse1 = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_hand_mouse_01"));
			rightHandMouse1.addChild(i);
			rightHandMouse1.rotation = ( -30) * Math.PI / 180;
			capa2.addChild(rightHandMouse1);
			rightHandMouse1.x = GLOBAL_MOUSE_X;
			rightHandMouse1.y = GLOBAL_MOUSE_Y;
			
			rightHandMouse2 = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_hand_mouse_02"));
			rightHandMouse2.addChild(i);
			rightHandMouse2.rotation = ( -30) * Math.PI / 180;
			capa2.addChild(rightHandMouse2);
			rightHandMouse2.x = rightHandMouse1.x;
			rightHandMouse2.y = rightHandMouse1.y;
			
			rightHandAnnoyed = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_hand_annoyed"));
			rightHandAnnoyed.addChild(i);
			capa2.addChild(rightHandAnnoyed);
			
			rightHandFist = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_hand_fist"));
			rightHandFist.addChild(i);
			capa2.addChild(rightHandFist);
			
			rightHandSnowMan = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_snowman_hand"));
			rightHandSnowMan.addChild(i);
			capa2.addChild(rightHandSnowMan);
			
			rightHandPalm1 = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_hand_palm_01"));
			rightHandPalm1.addChild(i);
			capa2.addChild(rightHandPalm1);
			
			rightHandPalm2 = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_hand_palm_02"));
			rightHandPalm2.addChild(i);
			capa2.addChild(rightHandPalm2);
			
			snHandWarning = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("SNHandWarning"));
			i.blendMode = BlendMode.SCREEN;
			snHandWarning.addChild(i);
			snHandWarning.x = rightHandSnowMan.x;
			snHandWarning.y = rightHandSnowMan.y;
			capa2.addChild(snHandWarning);
			
			snHandExplode = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_snowman_death"));
			snHandExplode.addChild(i);
			snHandExplode.x = rightHandSnowMan.x;
			snHandExplode.y = rightHandSnowMan.y;
			capa2.addChild(snHandExplode);
			
			rightShirt = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_shirt"));
			rightShirt.addChild(i);
			capa2.addChild(rightShirt);
			
			cercaTaza = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_taza_cerca"));
			cercaTaza.addChild(i);
			cercaTaza.y = 200;
			capa2.addChild(cercaTaza);

			textIra = new TextField(200, 50, "", "RetroFont", 48);
			capa2.addChild(textIra);
			textIra.x = 630;
			textIra.hAlign = "left";
			textTime = new TextField(200, 50, "", "RetroFont", 48);
			capa2.addChild(textTime);
			textTime.x = 630;
			textTime.y = 30;
			textTime.hAlign = "left";
			
			snowmanBroken = false;
			
			titleBackground = new Sprite();
			i = new Image(Assets.getAtlas2().getTexture("OFFICE_intro_01"));
			titleBackground.addChild(i);
			capa2.addChild(titleBackground);
			titleBackground.x = 0;
			titleBackground.y = 0;
			titleBackground.scaleX = 2;
			titleBackground.scaleY = 2;
			
			
			title = new MovieClip(Assets.getAtlas2().getTextures("OFFICE_title"), 0.25);
			Starling.juggler.add(title);
			capa2.addChild(title);
			title.loop = false;
			
			title.addEventListener(Event.COMPLETE, titleCompleted);
			
			ojosEnd = new MovieClip(Assets.getAtlas2().getTextures("OFFICE_intro_07"), 12);
			Starling.juggler.add(ojosEnd);
			capa2.addChild(ojosEnd);
			ojosEnd.scaleX = 2;
			ojosEnd.scaleY = 2;
			ojosEnd.addFrame(Assets.getAtlas2().getTexture("OFFICE_intro_06"), null, 1 / 12);
			ojosEnd.addFrame(Assets.getAtlas2().getTexture("OFFICE_intro_05"), null, 1 / 12);
			ojosEnd.addFrame(Assets.getAtlas2().getTexture("OFFICE_intro_04"), null, 1 / 12);
			ojosEnd.addFrame(Assets.getAtlas2().getTexture("OFFICE_intro_03"), null, 1 / 12);
			ojosEnd.addFrame(Assets.getAtlas2().getTexture("OFFICE_intro_02"), null, 1 / 12);
			ojosEnd.addFrame(Assets.getAtlas2().getTexture("OFFICE_intro_01"), null, 1 / 12);
			ojosEnd.stop();
			ojosEnd.visible = false;
			ojosEnd.loop = false;
		}
		
		private function titleCompleted(event:Event):void {
			title.stop();
			title.visible = false;
			titleBackground.visible = false;
			capa2.removeChild(title);
			capa2.removeChild(titleBackground);
			
			ojos = new MovieClip(Assets.getAtlas2().getTextures("OFFICE_intro"), 12);
			Starling.juggler.add(ojos);
			capa2.addChild(ojos);
			ojos.x = 0;
			ojos.y = 0;
			ojos.scaleX = 2;
			ojos.scaleY = 2;
			ojos.loop = false;
			
			ojos.addEventListener(Event.COMPLETE, ojosCompleted);
		}
		
		private function ojosCompleted(event:Event):void {
			ojos.stop();
			ojos.visible = false;
			capa2.removeChild(ojos);
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
				if (mouseCatched) { 
					CAPA_2_MOUSE_CLICKED = true; 
					SoundClick.play(0, 0, new SoundTransform(1, 1));
					}
			
					
			}
			if (touch && touch.phase == TouchPhase.ENDED) {
				if (snowManCatched) { Squeaky2(); }
				GLOBAL_MOUSE_MANTAINED = false;
			}
		}
		
		private function onEnterFrame(e:EnterFrameEvent):void {
			
			globalTime+= e.passedTime;
			textIra.text = "Stress: " + int(ira);
			textTime.text = "Time:   " + int(globalTime);
			
			if (brokenScreen == 0 && ira >= 75) {
				punchScreenTime = true;
			}
			else if (brokenScreen == 1 && ira >= 100) {
				punchScreenTime = true;
			}
			
			if (timeRageSoft > 0) {
				timeRageSoft -= e.passedTime;
				if (timeRageSoft <= 0) {
					timeRageSoft = 0;
					rageSoft = false;
				}
			}
			if (timeRageHard > 0) {
				timeRageHard -= e.passedTime;
				if (timeRageHard <= 0) {
					timeRageHard = 0;
					rageHard = false;
				}
			}
			
			if (Input.isPressed(Input.SPACE))
			{
				GLOBAL_BOTON_ESPACIO = true;
			}
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
				if (snowManCatched && snowmanCooldown > 0) {
					
					if (ira >= 5) { ira -= 5; }
					Squeaky();
					snowmanCooldown -= 10;
				}
				var point_handX:Number = rightHand1.x +50;
				var point_handY:Number = rightHand1.y +185;
				if (point_handX >= test_BOOT.x && point_handX <= test_BOOT.x + test_BOOT.width &&
				point_handY >= test_BOOT.y && point_handY <= test_BOOT.y + test_BOOT.height) {
					clickScreenButton = true;
				}
			}
			
			
			keyboard_space.visible = true;
			

			
			if (GLOBAL_MOUSE_MANTAINED) {
				if (GLOBAL_MOUSE_X >= test_F_ARR.x && GLOBAL_MOUSE_X <= test_F_ARR.x + test_F_ARR.width &&
				GLOBAL_MOUSE_Y >= test_F_ARR.y && GLOBAL_MOUSE_Y <= test_F_ARR.y + test_F_ARR.height) {
					CAPA_2_BOTON_FLECHA_ARR = true;
					
					if (keyboard_up.visible) { SoundKey.play(0, 0, new SoundTransform(1, 0)); }
					
					keyboard_up.visible = false;
					
					keyboard_down.visible = true;
					keyboard_left.visible = true;
					keyboard_right.visible = true;
				}
				else if (GLOBAL_MOUSE_X >= test_F_ABA.x && GLOBAL_MOUSE_X <= test_F_ABA.x + test_F_ABA.width &&
				GLOBAL_MOUSE_Y >= test_F_ABA.y && GLOBAL_MOUSE_Y <= test_F_ABA.y + test_F_ABA.height) {
					CAPA_2_BOTON_FLECHA_ABA = true;
					
					if (keyboard_down.visible) { SoundKey.play(0, 0, new SoundTransform(1, 0)); }
					
					keyboard_down.visible = false;
					
					keyboard_left.visible = true;
					keyboard_right.visible = true;
					keyboard_up.visible = true;
				}
				else if (GLOBAL_MOUSE_X >= test_F_IZQ.x && GLOBAL_MOUSE_X <= test_F_IZQ.x + test_F_IZQ.width &&
				GLOBAL_MOUSE_Y >= test_F_IZQ.y && GLOBAL_MOUSE_Y <= test_F_IZQ.y + test_F_IZQ.height) {
					CAPA_2_BOTON_FLECHA_IZQ = true;
					
					if (keyboard_left.visible) { SoundKey.play(0, 0, new SoundTransform(1, 0)); }
					
					keyboard_left.visible = false;
					
					keyboard_down.visible = true;
					keyboard_right.visible = true;
					keyboard_up.visible = true;
				}
				else if (GLOBAL_MOUSE_X >= test_F_DER.x && GLOBAL_MOUSE_X <= test_F_DER.x + test_F_DER.width &&
				GLOBAL_MOUSE_Y >= test_F_DER.y && GLOBAL_MOUSE_Y <= test_F_DER.y + test_F_DER.height) {
					CAPA_2_BOTON_FLECHA_DER = true;
					
					if (keyboard_right.visible) { SoundKey.play(0, 0, new SoundTransform(1, 0)); }
					
					keyboard_right.visible = false;
					
					keyboard_down.visible = true;
					keyboard_left.visible = true;
					keyboard_up.visible = true;
				}

			}
			else {
				keyboard_down.visible = true;
				keyboard_right.visible = true;
				keyboard_up.visible = true;
				keyboard_left.visible = true;
			}
						
			if(frogRunning) updateCapa0(e.passedTime);
			
			// ****************** CAPA 2 ******************

			if (Input.isDown(Input.SPACE)) {
				if (CAPA_2_LEFT_MOUSE_X >= test_ESP.x && CAPA_2_LEFT_MOUSE_X <= test_ESP.x + test_ESP.width &&
				CAPA_2_LEFT_MOUSE_Y >= test_ESP.y && CAPA_2_LEFT_MOUSE_Y <= test_ESP.y + test_ESP.height) {
					keyboard_space.visible = false;
				}
				if (phoneCatched && phoneEvent < 0 && !muertisimo) {
					phoneEvent = 30 + Math.random()*10;
					channel_phone.soundTransform = new SoundTransform(0, -1);
					if (phoneBronca < 3) {
						//HABLA LA SECRETARIA
						phoneTalking = 5;
						SoundSecretary.play(0, 0, new SoundTransform(1.5, -1));
					}
					else {
						//HABLA EL BOSS
						phoneTalking = 5;
						SoundBoss.play(0, 0, new SoundTransform(1.5, -1));
					}
					ira += phoneBronca * 5 + phoneBronca * 2;
					checkRage(false);
					phoneBronca = 1;
				}
				if (coffeCatched && coffeEvent <= 0 && coffeAmount > 0 && !muertisimo) {
					coffeAmount--;
					coffeEvent = 3;
					SoundSlurp.play(0, 0, new SoundTransform(1, 0));
				}
				
			}
			
			
			
			if (Input.isDown(Input.SPACE) && gitanada) {
				gitanada = false;
				
				if (muertisimo) {
					ch1.stop();			
					channel_SCA_Main.stop();
					channel_office.stop();
					channel_phone.stop();
					//death0.stop();
					//death1.stop();
					//death2.stop();
					
					GAME.reset();
				}
				
				if (CAPA_2_LEFT_MOUSE_X >= test_ESP.x && CAPA_2_LEFT_MOUSE_X <= test_ESP.x + test_ESP.width &&
				CAPA_2_LEFT_MOUSE_Y >= test_ESP.y && CAPA_2_LEFT_MOUSE_Y <= test_ESP.y + test_ESP.height) {
					CAPA_2_BOTON_ESPACIO = true;
					SoundKey.play(0, 0, new SoundTransform(1, 0));
				}
			}
			
			if (!Input.isDown(Input.SPACE)) {
				gitanada = true;
			}


			
			// ****************** CAPA 0 ******************
			
			
			// ****************** CAPA 1 ******************
			
			if (pcRunning) updatePC(e.passedTime);
			if (game1Running) updateGame1(e.passedTime);
			
		
			
			// ****************** CAPA 2 ******************
			
			if (coffeEvent > 0) {
				coffeEvent -= e.passedTime;
				if (coffeEvent > 1) {
					leftHandMovingX -= e.passedTime * 400;
					leftHandMovingY += e.passedTime * 200;
					if (leftHandMovingX < -400) leftHandMovingX = -400;
					if (leftHandMovingY > 200) leftHandMovingY = 200;
					
					if (coffeEvent <= 2 && coffeEvent >= 1.5) {
						cercaTaza.y -= e.passedTime * 350;
					}
					else if (coffeEvent <= 1.5) {
						cercaTaza.y += e.passedTime * 350;
					}
					
				}
				else {
					leftHandMovingX += e.passedTime * 400;
					leftHandMovingY -= e.passedTime * 200;
					cercaTaza.y = 200;
				}
				if (coffeEvent <= 0) {
					ira -= 30;
				}
			}
			
			phoneTalking -= e.passedTime;
			if (phoneTalking <= 0) {
				phoneEvent -= e.passedTime;
				if (coffeEvent <= 0) {
					leftHandMovingX = 0;
					leftHandMovingY = 0;
				}
			}
			else {
				if (phoneTalking > 2) {
					leftHandMovingX -= e.passedTime * 200;
					leftHandMovingY += e.passedTime * 100;
					if (leftHandMovingX < -400) leftHandMovingX = -400;
					if (leftHandMovingY > 200) leftHandMovingY = 200;
				}
				else {
					leftHandMovingX += e.passedTime * 200;
					leftHandMovingY -= e.passedTime * 100;
				}
				
			}
			checkPhoneEvent();
			
			if (coffeEvent <= 0) {
				if (coffeAmount > 0) {
					coffe.visible = true;
					
					coffe2.visible = false;
					coffe3.visible = false;
				}
				else {
					coffe2.visible = true;
					
					coffe.visible = false;
					coffe3.visible = false;
				}
			}
			
			moveLeftHand(e.passedTime);
			moveRightHand(e.passedTime);
			checkMouse();
			checkSnowMan();
			checkPhone();
			checkCoffe();
			
			checkLeftVisibility();
			checkRightVisibility();
			
			//IRA GLOBAL
			if (!fired) {
				ira += e.passedTime / 4 * globalTime/10;
			}
			else  {
				ira += e.passedTime * 10;
			}
				
			//SNOWMAN COOLDOWN
			if (snowmanCooldown > 0 && snowmanCooldown <= 100)
			{
				snowmanCooldown += 0.1;
				snDeskExplode.visible = false;
			}
				
			else if(snowmanCooldown<=0 && snowmanBroken == false)
			{
				snowmanBroken = true;
				snDeskExplode.visible = true;
				snowMan.visible = false;
				snDeskWarning.visible = false;
				SnowmanExplodes.play(0,1, new SoundTransform(3,1));//reproducir explosion
			}
				
			snDeskWarning.alpha = 0 + ((100 - snowmanCooldown)/100);
			snHandWarning.alpha = 0 + ((100 - snowmanCooldown) / 100);
			
			snHandWarning.x = rightHandSnowMan.x;
			snHandWarning.y = rightHandSnowMan.y;
			
			snHandExplode.x = rightHandSnowMan.x;
			snHandExplode.y = rightHandSnowMan.y;
			
			shakeHands(( -1.05 + Math.pow(1.05, ira)) / 4);
			
			if (punchTazaTime) {
				var target_x:Number = 50;
				var target_y:Number = 500;
				var aux_speed:Number = 200;
				
				if (Math.abs(CAPA_2_LEFT_MOUSE_X - target_x) < 10 && Math.abs(CAPA_2_LEFT_MOUSE_Y - target_y) < 10) {
					punchTazaTime = false;
				}
				else {
					if (CAPA_2_LEFT_MOUSE_X != target_x) {
						if (CAPA_2_LEFT_MOUSE_X > target_x) {
							CAPA_2_LEFT_MOUSE_X -= e.passedTime * aux_speed;
							if (CAPA_2_LEFT_MOUSE_X < target_x) {
								CAPA_2_LEFT_MOUSE_X = target_x;
							}
						}
						else if (CAPA_2_LEFT_MOUSE_X < target_x) {
							CAPA_2_LEFT_MOUSE_X += e.passedTime * aux_speed;
							if (CAPA_2_LEFT_MOUSE_X > target_x) {
								CAPA_2_LEFT_MOUSE_X = target_x;
							}
						}
					}
					if (CAPA_2_LEFT_MOUSE_Y != target_y) {			
						if (CAPA_2_LEFT_MOUSE_Y > target_y) {
							CAPA_2_LEFT_MOUSE_Y -= e.passedTime * aux_speed;
							if (CAPA_2_LEFT_MOUSE_Y < target_y) {
								CAPA_2_LEFT_MOUSE_Y = target_y;
							}
						}
						else if (CAPA_2_LEFT_MOUSE_Y < target_y) {
							CAPA_2_LEFT_MOUSE_Y += e.passedTime * aux_speed;
							if (CAPA_2_LEFT_MOUSE_Y > target_y) {
								CAPA_2_LEFT_MOUSE_Y = target_y;
							}
						}	
					}
				}
			}
			else if (punchKeyboardTime) {
				target_x = 200;
				target_y= 500;
				aux_speed = 750;
				
				if (Math.abs(CAPA_2_LEFT_MOUSE_X - target_x) < 100 && Math.abs(CAPA_2_LEFT_MOUSE_Y - target_y) < 100) {
					punchKeyboardTime = false;
					SoundPunchKeyboard.play(0, 0, new SoundTransform(2, -0.5));
				}
				else {
					if (CAPA_2_LEFT_MOUSE_X != target_x) {
						if (CAPA_2_LEFT_MOUSE_X > target_x) {
							CAPA_2_LEFT_MOUSE_X -= e.passedTime * aux_speed;
							if (CAPA_2_LEFT_MOUSE_X < target_x) {
								CAPA_2_LEFT_MOUSE_X = target_x;
							}
						}
						else if (CAPA_2_LEFT_MOUSE_X < target_x) {
							CAPA_2_LEFT_MOUSE_X += e.passedTime * aux_speed;
							if (CAPA_2_LEFT_MOUSE_X > target_x) {
								CAPA_2_LEFT_MOUSE_X = target_x;
							}
						}
					}
					if (CAPA_2_LEFT_MOUSE_Y != target_y) {			
						if (CAPA_2_LEFT_MOUSE_Y > target_y) {
							CAPA_2_LEFT_MOUSE_Y -= e.passedTime * aux_speed;
							if (CAPA_2_LEFT_MOUSE_Y < target_y) {
								CAPA_2_LEFT_MOUSE_Y = target_y;
							}
						}
						else if (CAPA_2_LEFT_MOUSE_Y < target_y) {
							CAPA_2_LEFT_MOUSE_Y += e.passedTime * aux_speed;
							if (CAPA_2_LEFT_MOUSE_Y > target_y) {
								CAPA_2_LEFT_MOUSE_Y = target_y;
							}
						}	
					}
				}
			}
			else if (punchScreenTime) {
				var target_x:Number = GAME.true_width/2;
				var target_y:Number = GAME.true_height/2 - 150;
				var aux_speed:Number = 1500;
				
				if (Math.abs(CAPA_2_LEFT_MOUSE_X - target_x) < 50 && Math.abs(CAPA_2_LEFT_MOUSE_Y - target_y) < 50) {
					punchScreenTime = false;
					SoundPunchKeyboard.play(0, 0, new SoundTransform(2, -0.5));
					brokenScreen++;
					if (brokenScreen >= 2) { gameOver(); }
					else if (brokenScreen >= 1) { breakScreen(); }
				}
				else {
					if (CAPA_2_LEFT_MOUSE_X != target_x) {
						if (CAPA_2_LEFT_MOUSE_X > target_x) {
							CAPA_2_LEFT_MOUSE_X -= e.passedTime * aux_speed;
							if (CAPA_2_LEFT_MOUSE_X < target_x) {
								CAPA_2_LEFT_MOUSE_X = target_x;
							}
						}
						else if (CAPA_2_LEFT_MOUSE_X < target_x) {
							CAPA_2_LEFT_MOUSE_X += e.passedTime * aux_speed;
							if (CAPA_2_LEFT_MOUSE_X > target_x) {
								CAPA_2_LEFT_MOUSE_X = target_x;
							}
						}
					}
					if (CAPA_2_LEFT_MOUSE_Y != target_y) {			
						if (CAPA_2_LEFT_MOUSE_Y > target_y) {
							CAPA_2_LEFT_MOUSE_Y -= e.passedTime * aux_speed;
							if (CAPA_2_LEFT_MOUSE_Y < target_y) {
								CAPA_2_LEFT_MOUSE_Y = target_y;
							}
						}
						else if (CAPA_2_LEFT_MOUSE_Y < target_y) {
							CAPA_2_LEFT_MOUSE_Y += e.passedTime * aux_speed;
							if (CAPA_2_LEFT_MOUSE_Y > target_y) {
								CAPA_2_LEFT_MOUSE_Y = target_y;
							}
						}	
					}
				}
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
			
			if (clickScreenButton)
			{
				if(!game1Running && !pcRunning && !pcLoading) loadPC();
				else if(!pcLoading)
				{
					shutdownPC();
					shutdownGame1();
					capa1_ruido.visible = false;
					
				}
				clickScreenButton = false;
			}
		}
		
		// PC
		
		private function loadPC():void {
			var img:Image;
			StartUp.play();
			
			capa1_ruido.visible = true;
			
			pcLoading = true;
			
			
			loadStaticScreen = new Sprite();
			img = new Image(Assets.getAtlas().getTexture("SCA_pc_loadscreen"));
			loadStaticScreen.addChild(img);
			capa1.addChild(loadStaticScreen);
			loadStaticScreen.x = 0;
			loadStaticScreen.y = 0;
			loadScreen = new MovieClip(Assets.getAtlas().getTextures("SCA_hero_idle_"), 0.8);
			loadScreen.play();
			loadScreen.pivotX = loadScreen.width / 2;
			loadScreen.pivotY = loadScreen.height / 2;
			loadScreen.x = widthCapa1 / 2;
			loadScreen.y = heightCapa1/2
			starling.core.Starling.juggler.add(loadScreen);
			capa1.addChild(loadScreen);
			loadScreen.loop = false;
			loadScreen.visible = false;
			loadScreen.addEventListener(Event.COMPLETE, loadCompleted);
			
			visibleLoadScreen = new MovieClip(Assets.getAtlas().getTextures("SCA_pc_loadicon_"), 4);
			visibleLoadScreen.play();
			starling.core.Starling.juggler.add(visibleLoadScreen);
			loadScreen.x = widthCapa1 / 2;
			loadScreen.y = heightCapa1 / 2
			capa1.addChild(visibleLoadScreen);
			
		}
		
		private function loadCompleted(event:Event):void
		{
			visibleLoadScreen.stop();
			visibleLoadScreen.visible = false;
			pcLoading = false;
			loadStaticScreen.visible = false;
			loadScreen.visible = false;
			loadScreen.stop();
			initPC();
		}
		
		private function initPC():void {
			
			capa1_ruido.visible = true;
			
			var img: Image;
			
			wallpaper = new Sprite();
			img = new Image(Assets.getAtlas().getTexture("SCA_escritorio"));
			wallpaper.addChild(img);
			capa1.addChild(wallpaper);
			
			gameIcon = new Sprite();
			img = new Image(Assets.getAtlas().getTexture("SCA_icono_game"));
			gameIcon.addChild(img);
			capa1.addChild(gameIcon);
			gameIcon.x = 45;
			gameIcon.y = 125;
			gameIcon.pivotX = gameIcon.width / 2;
			gameIcon.pivotY = gameIcon.height / 2;
			
			txtIcon = new Sprite();
			img = new Image(Assets.getAtlas().getTexture("SCA_icono_readme"));
			txtIcon.addChild(img);
			capa1.addChild(txtIcon);
			txtIcon.x = 45;
			txtIcon.y = 45;
			txtIcon.pivotX = txtIcon.width / 2;
			txtIcon.pivotY = txtIcon.height / 2;
			
			internetIcon = new Sprite();
			img = new Image(Assets.getAtlas().getTexture("SCA_icono_internet"));
			internetIcon.addChild(img);
			capa1.addChild(internetIcon);
			internetIcon.x = 45;
			internetIcon.y = 205;
			internetIcon.pivotX = txtIcon.width / 2;
			internetIcon.pivotY = txtIcon.height / 2;
			
			
			txtInfo = new Sprite();
			img = new Image(Assets.getAtlas().getTexture("SCA_readme"));
			txtInfo.addChild(img);
			capa1.addChild(txtInfo);
			txtInfo.visible = false;
			
			theInternet = new MovieClip(Assets.getAtlas().getTextures("Kittens"));
			starling.core.Starling.juggler.add(theInternet);
			capa1.addChild(theInternet);
			theInternet.scaleX = 2;
			theInternet.scaleY = 2;
			theInternet.visible = false;
			theInternet.stop();
			
			txtClose = new Sprite();
			img = new Image(Assets.getTexture("closeIcon"));
			txtClose.addChild(img);
			capa1.addChild(txtClose);
			txtClose.scaleX = 0.1;
			txtClose.scaleY = 0.1;
			txtClose.x = widthCapa1 - txtClose.width*1.25;
			txtClose.y = txtClose.height/4;
			txtClose.pivotX = txtClose.width / 2;
			txtClose.pivotY = txtClose.height / 2;	
			txtClose.visible = false;
			
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
			
			if ( txtInfo.visible == false && theInternet.visible == false && Math.abs(gameIcon.x - cursor.x) < gameIcon.width/2 && Math.abs(gameIcon.y - cursor.y) < gameIcon.height/2)  {
				shutdownPC();
				loadGame1();
			}
			if ( txtInfo.visible == false && Math.abs(txtIcon.x - cursor.x) < txtIcon.width/2 && Math.abs(txtIcon.y - cursor.y) < txtIcon.height/2)  {
				txtInfo.visible = true;
				txtClose.visible = true;
			}
			
			if ( txtInfo.visible == true && Math.abs(txtClose.x+txtClose.width/2 - cursor.x) < txtClose.width/2 && Math.abs(txtClose.y+txtClose.height/2 - cursor.y) < txtClose.height/2)  {
				txtInfo.visible = false;
				txtClose.visible = false;
			}
		
			if (txtInfo.visible == false && theInternet.visible == false && Math.abs(internetIcon.x - cursor.x) < internetIcon.width/2 && Math.abs(internetIcon.y - cursor.y) < internetIcon.height/2)  {
				theInternet.visible = true;
				theInternet.play();
				txtClose.visible = true;
			}
			
			if (theInternet.visible == true && Math.abs(txtClose.x+txtClose.width/2 - cursor.x) < txtClose.width/2 && Math.abs(txtClose.y+txtClose.height/2 - cursor.y) < txtClose.height/2)  {
				theInternet.visible = false;
				theInternet.stop();
				txtClose.visible = false;
			}
		}
		
		
		private function shutdownPC():void {
			capa1.removeChildren();
			pcRunning = false;
		}
		
		// GAME1
		
		private function loadGame1():void {
			
			channel_SCA_Main = SCA_Main.play(0, 999999, new SoundTransform(0.4, 0));
			var img:Image;
			loadGame1Screen = new Sprite();
			img = new Image(Assets.getAtlas().getTexture("capa1"));
			loadGame1Screen.addChild(img);
			capa1.addChild(loadGame1Screen);
			
			loadGame1Title = new MovieClip(Assets.getAtlas().getTextures("SCA_Title"), 0.33);
			starling.core.Starling.juggler.add(loadGame1Title);
			capa1.addChild(loadGame1Title);
			loadGame1Title.pivotX = loadGame1Title.width / 2;
			loadGame1Title.pivotY = loadGame1Title.height / 2;
			loadGame1Title.x = widthCapa1 / 2;
			loadGame1Title.y = heightCapa1 / 2;
			loadGame1Title.play();
			loadGame1Title.loop = false;
			loadGame1Title.addEventListener(Event.COMPLETE, loadGame1TitleCompleted);
		}
		
		private function loadGame1TitleCompleted(event:Event):void {
			capa1.removeChildren();
			initGame1();
		}
		
		private function initGame1():void {
			
			stepBool = true;
			stepDelay = 0;
			
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
			img = new Image(Assets.getAtlas().getTexture("SCA_button_right"));
			RB.addChild(img);
			capa1.addChild(RB);
			RB.x = widthCapa1 / 2 + 30;
			RB.y = heightCapa1 / 2 + 100+6 ;
			RB.pivotX = RB.width / 2;
			RB.pivotY = RB.height / 2;
			//RB.scaleX = 0.2;
			//RB.scaleY = 0.1;
			
			LB = new Sprite();
			img = new Image(Assets.getAtlas().getTexture("SCA_button_left"));
			LB.addChild(img);
			capa1.addChild(LB);
			LB.x = widthCapa1 / 2 - 49;
			LB.y = heightCapa1 / 2 + 63+6;
			LB.pivotX = LB.width / 2;
			LB.pivotY = LB.height / 2;
			//LB.scaleX = 0.15;
			//LB.scaleY = 0.08;
			
			RBdt = 0;
			LBdt = 0;
			
			
			character = new MovieClip(Assets.getAtlas().getTextures("SCA_hero_idle"), 8);
			starling.core.Starling.juggler.add(character);
			capa1.addChild(character);
			character.x = widthCapa1/2;
			character.y = heightCapa1 - 50;
			character.pivotX = character.width / 2;
			character.pivotY = character.height / 2;
			character.visible = true;
			
			characterWalk = new MovieClip(Assets.getAtlas().getTextures("SCA_hero_walk"), 8);
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
			characterDeath.addFrameAt(0, Assets.getAtlas().getTexture("SCA_hero_hurt_01"), null, 2 / 3);
			characterDeath.x = character.x;
			characterDeath.y = character.y;
			characterDeath.pivotX = character.width / 2;
			characterDeath.pivotY = character.height / 2;
			characterDeath.visible = false;
			characterDeath.stop();
			
			oversize = new MovieClip(Assets.getAtlas().getTextures("SCA_hero_face"), 3);
			starling.core.Starling.juggler.add(oversize);
			capa1_careto.addChild(oversize);
			oversize.x = widthCapa1 / 2;
			oversize.y = heightCapa1 + oversize.height + 50;
			oversize.pivotX = oversize.width / 2;
			oversize.pivotY = oversize.height / 2;
			
			glassface = new Sprite();
			img = new Image(Assets.getAtlas().getTexture("SCA_hero_glassface"));
			glassface.addChild(img);
			capa1_careto.addChild(glassface);
			glassface.x = widthCapa1 / 2;
			glassface.y = heightCapa1 / 2;
			glassface.pivotX = glassface.width / 2;
			glassface.pivotY = glassface.height / 2;
			glassface.visible = false;
			
			
			enemySplash = new MovieClip(Assets.getAtlas().getTextures("SCA_bug_explode"),6);
			starling.core.Starling.juggler.add(enemySplash);
			capa1.addChild(enemySplash);
			enemySplash.pivotX = enemySplash.width / 2;
			enemySplash.pivotY = enemySplash.height / 2;
			enemySplash.visible = false;
			enemySplash.stop();
			
			
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
			
			initGame0();
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
							
							if (stepDelay >= 0) stepDelay -= dt;
							else {
								if (stepBool) {
									step1.play(0,1,new SoundTransform(0.25,0));
									stepBool = false;
								}
								else {
									step2.play(0,1,new SoundTransform(0.25,0));
									stepBool = true;
								}
								stepDelay = 1 / 8;
							}
							
						}
						
						characterWalk.scaleX = character.scaleX;
						characterWalk.scaleY = character.scaleY;
					}
					
					else if (CAPA_2_BOTON_FLECHA_IZQ) {
						if (character.x - character.width/4 > 0) {
							character.x -= 160*dt;
							if (characterWalk.visible == false) {
								characterWalk.visible = true;
								character.visible = false;
							}
							if (character.scaleX < 0) character.scaleX *= -1;
							characterWalk.scaleX = character.scaleX;
							
							if (stepDelay >= 0) stepDelay -= dt;
							else {
								if (stepBool) {
									step1.play(0,1,new SoundTransform(0.25,0));
									stepBool = false;
								}
								else {
									step2.play(0,1,new SoundTransform(0.25,0));
									stepBool = true;
								}
								stepDelay = 1 / 8;
							}
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
							
							if (stepDelay >= 0) stepDelay -= dt;
							else {
								if (stepBool) {
									step1.play(0,1,new SoundTransform(0.25,0));
									stepBool = false;
								}
								else {
									step2.play(0,1,new SoundTransform(0.25,0));
									stepBool = true;
								}
								stepDelay = 1 / 8;
							}
						}
						
						characterWalk.scaleX = character.scaleX;
						characterWalk.scaleY = character.scaleY;
					}
					
					else if (CAPA_2_BOTON_FLECHA_DER) {
						if (character.x + character.width/4 < widthCapa1) {
							character.x += 160*dt;
							if (characterWalk.visible == false) {
								characterWalk.visible = true;
								character.visible = false;
							}
							if (character.scaleX > 0) character.scaleX *= -1;
							characterWalk.scaleX = character.scaleX;
							
							if (stepDelay >= 0) stepDelay -= dt;
							else {
								if (stepBool) {
									step1.play(0,1,new SoundTransform(0.25,0));
									stepBool = false;
								}
								else {
									step2.play(0,1,new SoundTransform(0.25,0));
									stepBool = true;
								}
								stepDelay = 1 / 8;
							}
						}
					}
					else stepDelay = 0;
					
					characterWalk.x = character.x;
					characterWalk.y = character.y;
				}
				
				// Salto Personaje
				if (CAPA_2_BOTON_ESPACIO && !pisotoneando && !hurt) {
					pisotoneando = true;
					character.visible = false;
					characterWalk.visible = false;
					characterJump.x = character.x;
					characterJump.y = character.y;
					characterJump.scaleX = character.scaleX;
					characterJump.scaleY = character.scaleY;
					characterJump.visible = true;
					
					characterJump.play();
					JumpSound.play(0,1,new SoundTransform(0.6,0));
					var img:Image;
					if (Math.abs(RB.x - character.x) < RB.width/2 && Math.abs(RB.y - character.y -23) < RB.height/2+5)
					{
						buttonPushed.play();
						/*
						RB.removeChildren();
						img = new Image(Assets.getTexture("RBP"));
						RB.addChild(img)
						*/
						RB.visible = false;
						RBPressed = true;
						CAPA_1_BOTON_DER = true;
					}
					else if (Math.abs(LB.x - character.x) < LB.width/2 && Math.abs(LB.y - character.y -21) < LB.height/2+1)
					{
						buttonPushed.play();
						/*
						LB.removeChildren();
						img = new Image(Assets.getTexture("LBP"));
						LB.addChild(img);
						*/
						LB.visible = false;
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
						/*
						RB.removeChildren();
						img = new Image(Assets.getAtlas().getTexture("SCA_button_right"))
						RB.addChild(img);
						*/
						RB.visible = true;
						 
						RBdt = 0;
					}
				}
				
				if (LBPressed) {
					LBdt += dt;
					if (LBdt >= 0.5) {
						LBPressed = false;
						/*
						LB.removeChildren();
						img = new Image(Assets.getAtlas().getTexture("SCA_button_right"))
						LB.addChild(img);*/
						LB.visible = true;
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
							if (enemyArray[i].y < character.y && capa1.getChildIndex(enemyArray[i]) > capa1.getChildIndex(character)) {
								capa1.swapChildren(enemyArray[i], characterDeath);
								capa1.swapChildren(enemyArray[i], characterHurt);
								capa1.swapChildren(enemyArray[i], characterJump);
								capa1.swapChildren(enemyArray[i], characterWalk);
								capa1.swapChildren(enemyArray[i], character);
							}
						}
					}
					else {
						if (enemyArray[i].x >= widthCapa1) {
							capa1.removeChild(enemyArray[i]);
							enemyArray.splice(i, 1);
							if (i>0) i--;
						}
						else {
							enemyArray[i].x += 80 * dt;
							if (enemyArray[i].y < character.y && capa1.getChildIndex(enemyArray[i]) > capa1.getChildIndex(character)) {
								capa1.swapChildren(enemyArray[i], characterDeath);
								capa1.swapChildren(enemyArray[i], characterHurt);
								capa1.swapChildren(enemyArray[i], characterJump);
								capa1.swapChildren(enemyArray[i], characterWalk);
								capa1.swapChildren(enemyArray[i], character);
							}
						}
					}
				}
				
				enemyCollision();
				
				updateLifeUp(dt);
				
			}
			else {
				game1overDelay -= dt;
				if (game1overDelay <= 1) {
					if (characterDeath.visible) characterDeath.visible = false;
					else characterDeath.visible = true;
				}
				if (game1overDelay <= 0) {
					game1overDelay = 2;
					game1Running = false;
					game1over = false;
					shutdownGame1();
					loadGame1();
				}
			}
			
		}
		
		private function addEnemy():void {
			BugSound.play();
			newEnemy = new MovieClip(Assets.getAtlas().getTextures("SCA_bug_walk"), 6);
			starling.core.Starling.juggler.add(newEnemy);
			capa1.addChild(newEnemy);
			capa1.swapChildren(newEnemy, fairy_laser);
			capa1.swapChildren(newEnemy, fairy);
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
				if ( Math.sqrt(Math.pow((enemyArray[i].x - character.x), 2) + Math.pow((enemyArray[i].y - character.y-10), 2)) < 24) {
					enemySplash.x = enemyArray[i].x;
					enemySplash.y = enemyArray[i].y;
					enemySplash.visible = true;
					enemySplash.play();
					enemySplash.addEventListener(Event.COMPLETE, endEnemySplash);
					capa1.removeChild(enemyArray[i]);
					enemyArray.splice(i, 1);
					BugSound.play();
					HurtSound.play(0, 1, new SoundTransform(40, 0));
					
					switch (Math.round(Math.random()*3.5+0.5)) 
					{
						case 1:
							umad1.play(0, 1, new SoundTransform(1, 0));
						break;
						
						case 2:
							umad2.play(0, 1, new SoundTransform(1.5, 0));
						break;
						
						case 3:
							umad3.play(0, 1, new SoundTransform(1.5, 0));
						break;
						
						case 4:
							umad4.play(0, 1, new SoundTransform(2.5, 0));
						break;
						
						default:
							umad3.play(0, 1, new SoundTransform(1.5, 0));
					}
					
					loseLife();
				}
			}
		}
		
		private function endEnemySplash(event:Event):void {
			enemySplash.visible = false;
			enemySplash.stop();
		}
		
		private function checkGame1Click():void {
			
			if ( Math.sqrt(Math.pow((closeIcon.x - fairy.x+20), 2) + Math.pow((closeIcon.y - fairy.y), 2)) < closeIcon.width)  {
				shutdownGame1();
				initPC();
			}
			else {
				laserTimer = 0.25;
				fairy_laser.x = fairy.x;
				fairy_laser.y = fairy.y;
				fairy_laser.visible = true;
				LaserSound.play(0.2,1,new SoundTransform(0.6,0));
			}
			
			var i:Number;
			for (i = 0; i < enemyArray.length; i++) {
				if ( Math.sqrt(Math.pow((enemyArray[i].x - (fairy.x)), 2) + Math.pow((enemyArray[i].y - (fairy.y)), 2)) < 25)  {
					if (lifeUp == null && Math.round(Math.random() * 1) == 0) spawnLife(enemyArray[i].x, enemyArray[i].y);
					enemySplash.x = enemyArray[i].x;
					enemySplash.y = enemyArray[i].y;
					enemySplash.visible = true;
					enemySplash.play();
					enemySplash.addEventListener(Event.COMPLETE, endEnemySplash);
					capa1.removeChild(enemyArray[i]);
					enemyArray.splice(i, 1);
					if (ira >= 5) { ira -= 5; }
				}
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
			ira += 5;
			checkRage(true);
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
				DeathSound.play(0,1,new SoundTransform(30,0));
				game1over = true;
				ira += 15;
				checkRage(true);
			}
		}
		
		private function gainLife():void {
			powerUp.play();
			if(lifes < 3){
				lifes += 1;
				//ira -= 5;
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
		
		private function initGame0():void
		{	
			capa0_ruido.visible = true;
			
			copyText = new TextField(150, 180 , "" , "RetroFont", 36, 0x8dab89);
			copyText.x = 2;
			copyText.y = 2;
			capa0.addChild(copyText);
			secsPassed = 0;
			currentTrack = 0;
			genSecs = 0;
			secs = 4;
			deathSecs = 0;
			highScore = 0;
			frogPoints = 0;
			customDt = 0;
			increasement = 0;
			frogRunning = true;
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
			
			matrixText = new TextField(150, 180 ,test , "RetroFont", 36, 0x000000);
			matrixText.x = 0;
			matrixText.y = 0;
			matrixText.border = false;
			capa0.addChild(matrixText);
								
			copyText = new TextField(150, 180 , "" , "RetroFont", 36, 0x8dab89);
			copyText.x = 2;
			copyText.y = 2;
			capa0.addChild(copyText);
			
			numBombs = 0;
			var bombScoreString:String = "" + numBombs;
			
			bombScore = new TextField(120, 20, bombScoreString, "RetroFont", 36, 0x000000);
			bombScore.hAlign = "left";
			bombScore.x = 102;
			bombScore.y = 10;
			capa0.addChild(bombScore);
			
			bombScore.visible = false;
			

			bombScoreCopy = new TextField(120, 20, bombScoreString, "RetroFont", 36, 0x8dab89);
			bombScoreCopy.hAlign = "left";
			bombScoreCopy.x = 104;
			bombScoreCopy.y = 12;
			capa0.addChild(bombScoreCopy);
			
			bombScoreCopy.visible = false;
			
			pressText= new TextField(150, 80, "Press any\nButton", "RetroFont", 30, 0x000000);
			//pressText.hAlign = "left";
			//pressText.x = 10;
			pressText.y = 118;
			capa0.addChild(pressText);
			
			pressTextCopy= new TextField(150, 80, "Press any\nButton", "RetroFont", 30, 0xe5eee5);
			//pressTextCopy.hAlign = "left";
			pressTextCopy.x = 2;
			pressTextCopy.y = 116;
			capa0.addChild(pressTextCopy);
			
			pressTextCopy.visible = false;
		}
		
		private function shutdownGame1():void {
			channel_SCA_Main.stop();
			shutDownFrog();
			capa1.removeChildren();
			capa1_careto.removeChildren();
			game1Running = false;
		}
		
		// GAME 0
		
		private function updateCapa0(dt:Number):void
		{	
			if (initiated)
			{	
				if (CAPA_1_BOTON_DER)
				{
					CAPA_1_BOTON_DER = false;
					secsPassed = 1;
				}
				if (CAPA_1_BOTON_IZQ)
				{
					 CAPA_1_BOTON_IZQ = false;
					 secsPassed = 1;
				}
				
				matrixText.visible = false;
				
				intro.visible = true;
				
				pressText.visible = true;
				pressTextCopy.visible = true;
		
				if (secsPassed == 1)
				{
					FrogIntro.play();
					secsPassed = 0;
					initiated = false;
					matrixText.visible = false;
					intro.visible = false;
					screen.visible = true;
					character1.visible = true;
					pressText.visible = false;
					pressTextCopy.visible = false;
				}
			}
			
			else if(!dead)
			{
				customDt = dt + increasement;
				frogPoints += customDt;
				
				if (int(frogPoints) == 15) increasement = 0.005;
				if (int(frogPoints) == 30) increasement = 0.01;
				if (int(frogPoints) == 50) increasement = 0.015;
				if (int(frogPoints) == 75) increasement = 0.025;
				
				
				frogPoints += dt;
				
				if (CAPA_1_BOTON_DER && currentPos < 2)
				{	
					CAPA_1_BOTON_DER = false;
					gameMatrix[3][currentPos] = 0;
					currentPos++;
					changeSprite0();
					if (gameMatrix[3][currentPos] == 1)
					{
						dead = true;
						ira += 10;
						checkRage(true);
					}
					gameMatrix[3][currentPos] = 2;
					FrogMove.play();
				}
				
				if (CAPA_1_BOTON_IZQ && currentPos > 0)
				{	
					CAPA_1_BOTON_IZQ = false;
					gameMatrix[3][currentPos] = 0;
					currentPos--;
					changeSprite0();
					if (gameMatrix[3][currentPos] == 1) 
					{
						dead = true;
						ira += 10;
						checkRage(true);
					}
					gameMatrix[3][currentPos] = 2;
					FrogMove.play();
				}
				
				
				if (generated)
				{
					secsPassed += customDt;
				
					if (secsPassed >= 1.2)
					{	
						FrogTick.play();
							
						for (var i:int = LEVELS_0-1; i >= 0; i--)
						{
							for (var j:int = TRACKS_0-1; j >=0 ; j--)
							{
								if (gameMatrix[i][j] == 1) 
								{
									gameMatrix[i][j] = 0;
									if (i + 1 <4)
									{
										if (gameMatrix[i + 1][j] == 2)
										{
											dead = true;
											ira += 10;
											checkRage(true);
										}
										else 
										{
											gameMatrix[i + 1][j] = 1;
											updateSprites0();
											changeSprite0();
										}
									}
									else {
										numBombs++;
										if (ira >= 7) { ira -= 7; }
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
					if (probabilidad <= 1 && frogPoints>25 && frogPoints<40) generateEnemy();
					if (probabilidad <= 3 && frogPoints>40) generateEnemy();
					genSecs = 0;
					generated = true;
					
					FrogTick.play();
					
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
				//matrixText.fontSize = 48;
				matrixText.text = test;
				
				bombScore.visible = true;
				bombScore.text = ""+numBombs;
				bombScoreCopy.visible = true;
				bombScoreCopy.text = ""+numBombs;
			}	
			
			if (dead)
			{
				
				var selectAni:Boolean = true;
				deathSecs += dt;		
				
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
				
				if (currentPos == 0 && selectAni)
				{
					death0.visible = true;
					death0.play();
					selectAni = false;
				}
				
				if (currentPos == 1 && selectAni)
				{
					death1.visible = true;
					death1.play();
					selectAni = false;
				}
				
				if (currentPos == 2 && selectAni)
				{
					death2.visible = true;
					death2.play();
					selectAni = false;
				}
				
				if(deathSecs >= 3.25)
				{		
					bombScore.visible = false;
					bombScoreCopy.visible = false;
					matrixText.visible = true;
					death0.visible = false;
					death0.stop();
					death1.visible = false;
					death1.stop();
					death2.visible = false;
					death2.stop();
					
					if (numBombs > highScore) highScore = numBombs;
					secs -= dt;
					genSecs = 0;
					secsPassed = 0;
					generated = false;
					test = "Score: " + numBombs;
					test += "\n";
					test += "Best: " + int(highScore);
					test += "\n\n";
					test += "Next in: " + int(secs);
					
					
					copyText.text = test;
					copyText.visible = true;
					
					
					for (t = 0; t < LEVELS_0; t++)
					{	
						for (u = 0; u < TRACKS_0; u++)
						{
							gameMatrix[t][u] = 0;
						}
					}
					
					
					matrixText.text = test;
					
				}
				
				if (deathSecs >= 6.25)
				{
					gameMatrix[3][1] = 2;
					currentPos = 1;
					character1.visible = true;
					dead = false;
					deathSecs = 0;
					frogPoints = 0;
					increasement = 0;
					matrixText.visible = false;
					copyText.visible = false;
					secs = 4;
					numBombs = 0;
					initiated = true;
				}
			}
		}
		
		private function generateEnemy():void
		{
			currentTrack = Math.random() * 3;
			while(gameMatrix[0][currentTrack] ==1) currentTrack = Math.random() * 3;
			gameMatrix[0][currentTrack] = 1;
			
			updateSprites0();
		}
		
		private function drawCapa0():void
		{
			screen = new Image(Assets.getAtlas().getTexture("capa0"));
			capa0.addChild(screen);
			screen.visible = false;
			
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
			character1.visible = false;
			
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
			
			intro = new MovieClip(Assets.getAtlas().getTextures("DETB_Intro_"),3);
			starling.core.Starling.juggler.add(intro);
			capa0.addChild(intro);
			intro.visible = false;
			
			death0 = new MovieClip(Assets.getAtlas().getTextures("DETB_Left_Ex"), 2);
			starling.core.Starling.juggler.add(death0);
			capa0.addChild(death0);
			death0.x = 0;
			death0.y = heightCapa0 - death0.height-3;
			death0.visible = false;
			death0.addFrameAt(0, Assets.getAtlas().getTexture("DETB_Left_Explosion_01"), null, 0.75);
			death0.addFrameAt(2, Assets.getAtlas().getTexture("DETB_Left_Explosion_02"),FrogDead, 0.01);
			death0.stop();
		
			death1 = new MovieClip(Assets.getAtlas().getTextures("DETB_Front_Ex"), 2);
			starling.core.Starling.juggler.add(death1);
			capa0.addChild(death1);
			death1.x = 50;
			death1.y = heightCapa0 - death1.height-3;
			death1.visible = false;
			death1.addFrameAt(0, Assets.getAtlas().getTexture("DETB_Front_Explosion_01"), null, 0.75);
			death1.addFrameAt(2, Assets.getAtlas().getTexture("DETB_Left_Explosion_02"),FrogDead, 0.01);
			death1.stop();
			
			death2 = new MovieClip(Assets.getAtlas().getTextures("DETB_Right_Ex"), 2);
			starling.core.Starling.juggler.add(death2);
			capa0.addChild(death2);
			death2.x = 100;
			death2.y = heightCapa0 - death2.height-3;
			death2.visible = false;
			death2.addFrameAt(0, Assets.getAtlas().getTexture("DETB_Right_Explosion_01"), null, 0.75);
			death2.addFrameAt(2, Assets.getAtlas().getTexture("DETB_Left_Explosion_02"),FrogDead, 0.01);
			
			death2.stop();
	
		}
		
		private function changeSprite0():void
		{	
			if (currentPos == 0)
			{
				if (gameMatrix[2][currentPos] == 1)
				{
					//trace("aquí");
					
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
				if (gameMatrix[2][currentPos] == 1) 
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
				if (gameMatrix[2][currentPos] == 1) 
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
			}
			
			bombsAway = new Array();
			
			for (var t:int = 0; t < LEVELS_0; t++)
			{	
				for (var u:int= 0; u < TRACKS_0; u++)
				{
					if (gameMatrix[t][u] == 1)
					{
						var bomb:MovieClip = new MovieClip(Assets.getAtlas().getTextures("DETB_Bomb"), 3);
						bomb.x = 50 * u +16;
						bomb.y = 40 * t;
						bombsAway.push(bomb);

					}
				}
			}	
			
			for (i = 0; i < bombsAway.length; i++)
			{	
				starling.core.Starling.juggler.add(bombsAway[i]);
				capa0.addChild(bombsAway[i]);
				capa0.swapChildren(bombsAway[i], bombScoreCopy);
				capa0.swapChildren(bombsAway[i], bombScore);
			}
		}
		
		private function shutDownFrog():void
		{
			bombsAway = new Array();
			capa0.removeChildren();
			frogRunning = false;
			capa0_ruido.visible = false;
		}
				
		private function moveLeftHand(dt:Number):void {
			
			// MOVE LEFT HAND
			var new_x:Number = CAPA_2_LEFT_MOUSE_X;
			var new_y:Number = CAPA_2_LEFT_MOUSE_Y;
			var speed_leftHand:Number = 500;
			
			if (!Input.isDown(Input.SPACE) && phoneTalking <= 0 && coffeEvent <= 0 && !punchTazaTime && !punchKeyboardTime && !punchScreenTime) {
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
			
			if (!punchScreenTime) {
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
			}
			
			
			if (!punchScreenTime) {
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
			}
			
			
			
			
			CAPA_2_LEFT_MOUSE_X = new_x;
			CAPA_2_LEFT_MOUSE_Y = new_y;
			
			leftHand1.x = CAPA_2_LEFT_MOUSE_X +35;
			leftHand1.y = CAPA_2_LEFT_MOUSE_Y -130 -55;
			leftHand2.x = leftHand1.x;
			leftHand2.y = leftHand1.y;
			leftHandAnnoyed.x = leftHand1.x;
			leftHandAnnoyed.y = leftHand1.y;
			leftHandFist.x = leftHand1.x + leftHandMovingX;
			leftHandFist.y = leftHand1.y + leftHandMovingY;
			leftHandGrab.x = leftHand1.x + leftHandMovingX;
			leftHandGrab.y = leftHand1.y + leftHandMovingY;
			leftHandPhoneCall.x = leftHand1.x -leftHand1.width + leftHandMovingX;
			leftHandPhoneCall.y = leftHand1.y + leftHandMovingY;
			leftHandPhone.x = leftHand1.x -leftHand1.width + leftHandMovingX;
			leftHandPhone.y = leftHand1.y +leftHandMovingY;
			leftHandTaza1.x = leftHand1.x -leftHand1.width + leftHandMovingX -46;
			leftHandTaza1.y = leftHand1.y +leftHandMovingY;
			leftHandTaza2.x = leftHand1.x -leftHand1.width + leftHandMovingX -46;
			leftHandTaza2.y = leftHand1.y +leftHandMovingY;
			leftHandTaza3.x = leftHand1.x -leftHand1.width + leftHandMovingX -46;
			leftHandTaza3.y = leftHand1.y +leftHandMovingY;
			leftHandPalm1.x = leftHand1.x;
			leftHandPalm1.y = leftHand1.y;
			leftHandPalm2.x = leftHand1.x;
			leftHandPalm2.y = leftHand1.y;
			
			//trace("X: " + CAPA_2_LEFT_MOUSE_X +"// Y: " + CAPA_2_LEFT_MOUSE_Y);
			
			leftShirt.x = leftHand1.x -120 + leftHandMovingX;
			leftShirt.y = leftHand1.y +310 + leftHandMovingY;

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
			rightHandAnnoyed.x = rightHand1.x;
			rightHandAnnoyed.y = rightHand1.y;
			rightHandFist.x = rightHand1.x;
			rightHandFist.y = rightHand1.y;
			rightHandSnowMan.x = rightHand1.x;
			rightHandSnowMan.y = rightHand1.y;
			rightHandPalm1.x = rightHand1.x;
			rightHandPalm1.y = rightHand1.y;
			rightHandPalm2.x = rightHand1.x;
			rightHandPalm2.y = rightHand1.y;
			
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
				
				else if (snHandExplode.visible)
					snowManCatched = false;
				
			}
			else {
				
				if (GLOBAL_MOUSE_X >= areaSnowMan.x && GLOBAL_MOUSE_X <= areaSnowMan.x + areaSnowMan.width &&
				GLOBAL_MOUSE_Y >= areaSnowMan.y && GLOBAL_MOUSE_Y <= areaSnowMan.y + areaSnowMan.height && snowmanCooldown > 0) {
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
				
				phone.visible = false;
				phoneCall.visible = true;
				phoneCall.x = areaPhone.x + areaPhone.width/2 - phone.width/2 -32 +(Math.random()*2 -1)*1;
				phoneCall.y = areaPhone.y + areaPhone.height / 2 - phone.height / 2 +(Math.random()*2 -1)*1;
				if (phoneCall.rotation == 0) {
					
				}
				else {
					phoneCall.rotation = 0;
				}
				
				if (channel_phone.soundTransform.volume == 0) {
					channel_phone = SoundPhone.play(0, 9999);
					channel_phone.soundTransform = new SoundTransform(0.8, -1);
				}
				
				
				if (phoneEvent <= -(3 + phoneBronca*3)) {
					
					phoneEvent = 30 + Math.random()*10;
					channel_phone.soundTransform = new SoundTransform(0, -1);
					phoneBronca++;
					
					if (phoneBronca > 3) {
						
						phoneBronca = -999999;
						SoundFired.play(0, 0, new SoundTransform(5, 0));
						fired = true;
						
					}
					
				}
			}
			else {
				phone.visible = true;
				phoneCall.visible = false;
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
			else SoundSqueak10_01.play(0,1,new SoundTransform(0.7,1));
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
			else SoundSqueak10_02.play(0, 1, new SoundTransform(0.7, 1));
		}
		
		private function checkRage(canPunch:Boolean):void {
			
			/*
			if (coffeAmount <= 0) {
				punchTazaTime = 2;
			}
			*/
			if (canPunch && Math.random() > 0.8) {
				punchKeyboardTime = true;
			}
			
			var aux_volumen:Number = 2;
			
			if (ira <= 50) {
				if (Math.random() > 0) {
					rageSoft = true;
					timeRageSoft = 0.5;
					var aux_whatever:Number = Math.random();
					if (aux_whatever > 0.66) {
						SoundMumble1.play(0, 0, new SoundTransform(aux_volumen, 0));
					}
					else if (aux_whatever > 0.33) {
						SoundMumble3.play(0, 0, new SoundTransform(aux_volumen, 0));
					}
					else {
						SoundMumble4.play(0, 0, new SoundTransform(aux_volumen, 0));
					}
				}
			}
			else {
				if (Math.random() > 0) {
					rageHard = true;
					timeRageHard = 0.5;
					aux_whatever = Math.random();
					if (aux_whatever > 0.66) {
						SoundMumble1.play(0, 0, new SoundTransform(aux_volumen, 0));
					}
					else if (aux_whatever > 0.33) {
						SoundMumble3.play(0, 0, new SoundTransform(aux_volumen, 0));
					}
					else {
						SoundMumble4.play(0, 0, new SoundTransform(aux_volumen, 0));
					}
				}
			}
		}
		
		private function checkRightVisibility():void {
			
			if (mouseCatched) {
				if (GLOBAL_MOUSE_MANTAINED) {
					rightHandMouse2.visible = true;
					//snowMan.visible = true;
					
					if (snowmanBroken)
					{
						snHandExplode.visible = true;
						snHandExplode.visible = false;
						rightHandSnowMan.visible = false;
					}
					
					else 
					{
						snHandExplode.visible = false;
						rightHandSnowMan.visible = true;
					}
					
					snHandWarning.visible = true;
					
					rightHand1.visible = false;
					rightHand2.visible = false;
					rightHandMouse1.visible = false;
					rightHandAnnoyed.visible = false;
					rightHandFist.visible = false;
					rightHandSnowMan.visible = false;
					snHandExplode.visible = false;
					rightHandPalm1.visible = false;
					rightHandPalm2.visible = false;
					snHandWarning.visible = false;
				}
				else {
					rightHandMouse1.visible = true;
					//snowMan.visible = true;
					
					if (snowmanBroken)
					{
						snHandExplode.visible = true;
						rightHandSnowMan.visible = false;
						
					}
					
					else 
					{
						snHandExplode.visible = false;
						rightHandSnowMan.visible = true;
					}
					
					snHandWarning.visible = true;
					
					rightHand1.visible = false;
					rightHand2.visible = false;
					rightHandMouse2.visible = false;
					rightHandAnnoyed.visible = false;
					rightHandFist.visible = false;
					rightHandSnowMan.visible = false;
					snHandExplode.visible = false;
					rightHandPalm1.visible = false;
					rightHandPalm2.visible = false;
					snHandWarning.visible = false;
				}
			}
			else if (snowManCatched) {
				if (GLOBAL_MOUSE_MANTAINED) {
					rightHandFist.visible = true;
					
					if (snowmanBroken)
					{
						snHandExplode.visible = true;
						rightHandSnowMan.visible = false;
						
					}
					
					else 
					{
						snHandExplode.visible = false;
						rightHandSnowMan.visible = true;
					}
					
					snHandWarning.visible = true;
					
					rightHand1.visible = false;
					rightHand2.visible = false;
					rightHandMouse1.visible = false;
					rightHandMouse2.visible = false;
					rightHandAnnoyed.visible = false;
					snowMan.visible = false;
					rightHandPalm1.visible = false;
					rightHandPalm2.visible = false;
					snDeskWarning.visible = false;
				}
				else {
					rightHandAnnoyed.visible = true;
					
					if (snowmanBroken)
					{
						snowMan.visible = false;
						snDeskWarning.visible = false;
						
					}
					
					else 
					{
						snowMan.visible = true;
						snDeskWarning.visible = true;
					}
					
					rightHand1.visible = false;
					rightHand2.visible = false;
					rightHandMouse1.visible = false;
					rightHandMouse2.visible = false;
					rightHandFist.visible = false;
					rightHandSnowMan.visible = false;
					snHandExplode.visible = false;
					rightHandPalm1.visible = false;
					rightHandPalm2.visible = false;
					snHandWarning.visible = false;
				}
			}
			else if (rageSoft || rageHard) {
				if (ira <= 50) {
					rightHandAnnoyed.visible = true;
					rightHandPalm1.visible = false;
				}
				else {
					rightHandPalm1.visible = true;
					rightHandAnnoyed.visible = false;
				}
				//snowMan.visible = true;
				
				rightHand1.visible = false;
				rightHand2.visible = false;
				rightHandMouse1.visible = false;
				rightHandMouse2.visible = false;
				rightHandFist.visible = false;
				rightHandSnowMan.visible = false;
				snHandExplode.visible = false;
				rightHandPalm2.visible = false;
			}
			else {
				if (GLOBAL_MOUSE_MANTAINED) {
					rightHand2.visible = true;
					//snowMan.visible = true;
					//snDeskWarning.visible = true;
					
					rightHand1.visible = false;
					rightHandMouse1.visible = false;
					rightHandMouse2.visible = false;
					rightHandAnnoyed.visible = false;
					rightHandFist.visible = false;
					rightHandSnowMan.visible = false;
					snHandExplode.visible = false;
					rightHandPalm1.visible = false;
					rightHandPalm2.visible = false;
					snHandWarning.visible = false;
				}
				else {
					rightHand1.visible = true;
					//snowMan.visible = true;
					//snDeskWarning.visible = true;
					
					rightHand2.visible = false;
					rightHandMouse1.visible = false;
					rightHandMouse2.visible = false;
					rightHandAnnoyed.visible = false;
					rightHandFist.visible = false;
					rightHandSnowMan.visible = false;
					snHandExplode.visible = false;
					rightHandPalm1.visible = false;
					rightHandPalm2.visible = false;
					snHandWarning.visible = false;
				}
			}
			
		}
		
		private function checkLeftVisibility():void {
			
			if (punchTazaTime || punchKeyboardTime || punchScreenTime) {
				if (coffeEvent > 0) { coffeEvent = 0; coffeAmount++; }
				if (phoneTalking > 0) { phoneTalking = 0; }
				
				if (punchScreenTime) {
					leftHandFist.visible = true;
					leftShirt.visible = true;
					
					leftHandGrab.visible = false;
					leftHandPhoneCall.visible = false;
					leftHand1.visible = false;
					leftHand2.visible = false;
					leftHandAnnoyed.visible = false;
					phone.visible = true;
					leftHandPhone.visible = false;
					leftHandTaza1.visible = false;
					leftHandTaza2.visible = false;
					leftHandTaza3.visible = false;
					leftHandPalm1.visible = false;
					leftHandPalm2.visible = false;
				}
				else if (punchKeyboardTime) {
					leftHandFist.visible = true;
					leftShirt.visible = true;
					
					leftHandGrab.visible = false;
					leftHandPhoneCall.visible = false;
					leftHand1.visible = false;
					leftHand2.visible = false;
					leftHandAnnoyed.visible = false;
					phone.visible = true;
					leftHandPhone.visible = false;
					leftHandTaza1.visible = false;
					leftHandTaza2.visible = false;
					leftHandTaza3.visible = false;
					leftHandPalm1.visible = false;
					leftHandPalm2.visible = false;
				}
				else if (punchTazaTime) {
					
				}
			}
			else if (coffeEvent > 0) {
				
				if (coffeAmount <= 0) {
					if (coffeEvent >= 1.5) {
						leftHandTaza1.visible = true;
						
						leftHandTaza2.visible = false;
						leftHandTaza3.visible = false;
					}
					else {
						leftHandTaza2.visible = true;
						
						leftHandTaza1.visible = false;
						leftHandTaza3.visible = false;
					}
				}
				else {
					leftHandTaza1.visible = true;
					leftHandTaza2.visible = false;
					leftHandTaza3.visible = false;
				}
				
				leftHandFist.visible = true;
				leftShirt.visible = true;
				
				leftHand1.visible = false;
				leftHand2.visible = false;
				leftHandAnnoyed.visible = false;
				leftHandGrab.visible = false;
				leftHandPhone.visible = false;
				leftHandPhoneCall.visible = false;
				coffe.visible = false;
				leftHandPalm1.visible = false;
				leftHandPalm2.visible = false;
			}
			else if (phoneTalking > 0) {
				leftHandGrab.visible = true;
				leftHandPhoneCall.visible = true;
				leftShirt.visible = true;
				
				leftHand1.visible = false;
				leftHand2.visible = false;
				leftHandAnnoyed.visible = false;
				leftHandFist.visible = false;
				phone.visible = false;
				leftHandPhone.visible = false;
				leftHandTaza1.visible = false;
				leftHandTaza2.visible = false;
				leftHandTaza3.visible = false;
				leftHandPalm1.visible = false;
				leftHandPalm2.visible = false;
			}
			else if (phoneCatched && phoneEvent < 0) {
				leftHandAnnoyed.visible = true;
				leftShirt.visible = true;
				
				leftHand1.visible = false;
				leftHand2.visible = false;
				leftHandFist.visible = false;
				leftHandGrab.visible = false;
				leftHandPhoneCall.visible = false;
				leftHandPhone.visible = false;
				leftHandTaza1.visible = false;
				leftHandTaza2.visible = false;
				leftHandTaza3.visible = false;
				leftHandPalm1.visible = false;
				leftHandPalm2.visible = false;
			}
			else if (coffeCatched && coffeAmount > 0) {
				if (Input.isDown(Input.SPACE)) {
					leftHandFist.visible = true;
					leftShirt.visible = true;
				
					leftHand1.visible = false;
					leftHand2.visible = false;
					leftHandAnnoyed.visible = false;
					leftHandGrab.visible = false;
					leftHandPhoneCall.visible = false;
					leftHandPhone.visible = false;
					leftHandTaza1.visible = false;
					leftHandTaza2.visible = false;
					leftHandTaza3.visible = false;
					leftHandPalm1.visible = false;
					leftHandPalm2.visible = false;
				}
				else {
					leftHandAnnoyed.visible = true;
					leftShirt.visible = true;
				
					leftHand1.visible = false;
					leftHand2.visible = false;
					leftHandFist.visible = false;
					leftHandGrab.visible = false;
					leftHandPhoneCall.visible = false;
					leftHandPhone.visible = false;
					leftHandTaza1.visible = false;
					leftHandTaza2.visible = false;
					leftHandTaza3.visible = false;
					leftHandPalm1.visible = false;
					leftHandPalm2.visible = false;
				}
			}
			else if (rageSoft || rageHard) {
				if (ira <= 50) {
					leftHandAnnoyed.visible = true;
					leftHandPalm1.visible = false;
				}
				else {
					leftHandPalm1.visible = true;
					leftHandAnnoyed.visible = false;
				}
				leftShirt.visible = true;
				
				
				leftHand2.visible = false;
				leftShirt.visible = false;
				leftHand1.visible = false;
				leftHandFist.visible = false;
				leftHandGrab.visible = false;
				leftHandPhoneCall.visible = false;
				leftHandPhone.visible = false;
				leftHandTaza1.visible = false;
				leftHandTaza2.visible = false;
				leftHandTaza3.visible = false;
				leftHandPalm2.visible = false;
			}
			else {
				if (Input.isDown(Input.SPACE)) {
					leftHand2.visible = true;
					leftShirt.visible = true;
					
					leftHand1.visible = false;
					leftHandAnnoyed.visible = false;
					leftHandFist.visible = false;
					leftHandGrab.visible = false;
					leftHandPhoneCall.visible = false;
					leftHandPhone.visible = false;
					leftHandTaza1.visible = false;
					leftHandTaza2.visible = false;
					leftHandTaza3.visible = false;
					leftHandPalm1.visible = false;
					leftHandPalm2.visible = false;
				}
				else {
					leftHand1.visible = true;
					leftShirt.visible = true;
					
					leftHand2.visible = false;
					leftHandAnnoyed.visible = false;
					leftHandFist.visible = false;
					leftHandGrab.visible = false;
					leftHandPhoneCall.visible = false;
					leftHandPhone.visible = false;
					leftHandTaza1.visible = false;
					leftHandTaza2.visible = false;
					leftHandTaza3.visible = false;
					leftHandPalm1.visible = false;
					leftHandPalm2.visible = false;
				}
			}
			
		}
		
		private function gameOver():void {
			ojosEnd.visible = true;
			ojosEnd.play();
			ojosEnd.addEventListener(Event.COMPLETE, ojosEndCompleted);
		}
		
		private function ojosEndCompleted(event:Event):void {
			SCORE = new TextField(300, 200, "GAME OVER\nSCORE: " + int(globalTime) + "\n\nPRESS SPACE", "RetroFont", 64, 0xFFFFFF, true);
			SCORE.x = 250;
			SCORE.y = 100;
			this.addChild(SCORE);
			
			shutDownFrog();
			shutdownGame1();
			shutdownPC();
			capa0.removeFromParent();
			capa1.removeFromParent();
			pcLoading = false;
			pcRunning = false;
			game1Running = false;
			capa1_ruido.removeFromParent();
			capa0_ruido.removeFromParent();
			capa2.removeChildren();
			capa1_raja.removeFromParent();
			
			ch1.stop();
			channel_SCA_Main.stop();
			channel_office.stop();
			channel_phone.stop();
			//death0.stop();
			//death1.stop();
			//death2.stop();
			
			muertisimo = true;
			//trace(muertisimo);
		}
		
		private function breakScreen():void {
			capa1_raja.addChild(raja);
		}
		
		
	}
	
}