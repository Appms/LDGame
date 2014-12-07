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
		private var character0:Image;
		private var bombsAway:Array;

		
		// ATRIBUTOS PROPORCIONADOS POR CAPA 1
		
		private var CAPA_1_BOTON_IZQ:Boolean = false;
		private var CAPA_1_BOTON_DER:Boolean = false;
		
		private var lifes:Number;
		private var lifesArray:Array;
		private var lifeUp:Sprite;
		private var lifeUpDt:Number;
		private var character:Sprite;
		private var fairy:Sprite;
		private var fairy_displacement:Point;
		private var newEnemy:Sprite;
		private var enemyArray:Array = new Array();
		private var enemySpawner:Number = 0;
		private var widthCapa1:Number;
		private var heightCapa1:Number;
		
		// ATRIBUTOS PROPORCIONADOS POR CAPA 2
		
		private var CAPA_2_BOTON_ESPACIO:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_IZQ:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_DER:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_ARR:Boolean = false;
		private var CAPA_2_BOTON_FLECHA_ABA:Boolean = false;
		private var CAPA_2_MOUSE_CLICKED:Boolean = false;
		
		private var leftHand:Sprite;
		private var rightHand:Sprite;
		private var mouseCatched:Boolean = false;
		
		private var areaMouse:Sprite;
		private var areaNeutral:Sprite;
		private var mouse:Sprite;
		
		private var areaSnowMan:Sprite;
		
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
			//ch1 = SoundMenu.play(0, 9999);
			
			capa0 = new Sprite();
			var i:Image = new Image(Assets.getAtlas().getTexture("capa0"));
			capa0.addChild(i);
			capa0.scaleX = 1.01;
			capa0.scaleY = 1.01;
			addChild(capa0);
			capa0.x = GAME.true_width/2 - capa0.width/2;
			capa0.y = 56;
			
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
			
			//**************** CAPA 0 ******************
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
			matrixText.border = true;
			capa0.addChild(matrixText);
			
			
			// ****************** CAPA 1 ******************
			widthCapa1 = capa1.width;
			heightCapa1 = capa1.height;
			
			lifes = 3;
			lifesArray = new Array();
			drawLifes();
			lifeUpDt = 0;
			
			character = new Sprite();
			i = new Image(Assets.getTexture("character"));
			character.addChild(i);
			capa1.addChild(character);
			character.x = widthCapa1/2;
			character.y = heightCapa1/2+100;
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
			
			addEnemy();
			
			// *********************** CAPA 2 ***********************
			
			areaMouse = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("area_mouse"));
			areaMouse.addChild(i);
			areaMouse.x = 570;
			areaMouse.y = 425;
			
			areaNeutral = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("area_neutral"));
			areaNeutral.addChild(i);
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
			areaSnowMan.x = 600;
			areaSnowMan.y = 225;
			
			leftHand = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("lefthand"));
			leftHand.addChild(i);
			capa2.addChild(leftHand);
			leftHand.x = GAME.true_width / 2 - GAME.true_width / 4;
			leftHand.y = 500;
			

			rightHand = new Sprite();
			i = new Image(Assets.getAtlas().getTexture("righthand"));
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

				//trace("X: " + GLOBAL_MOUSE_X + "// Y: " + GLOBAL_MOUSE_Y);
			}
			if (touch && touch.phase == TouchPhase.BEGAN) {
				GLOBAL_MOUSE_CLICKED = true;
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
				trace ("CLICKED");
				checkEnemyClick();
			}
			
			updateCapa0(e.passedTime);
			updateCapa1(e.passedTime);
			
			// ****************** CAPA 2 ******************
			

			moveLeftHand(e.passedTime);
			moveRightHand(e.passedTime);
			checkMouse();
			
			
			GLOBAL_BOTON_ESPACIO = false;
			GLOBAL_BOTON_W = false;
			GLOBAL_BOTON_A = false;
			GLOBAL_BOTON_S = false;
			GLOBAL_BOTON_D = false;
			GLOBAL_MOUSE_CLICKED = false;
		}
		
	
		
		
		private function updateCapa1(dt:Number):void {
			
			// Movimiento Personaje
			if (GLOBAL_BOTON_W) character.y -= 60*dt;
			else if (GLOBAL_BOTON_A) {
				character.x -= 80*dt;
				if (character.scaleX > 0) character.scaleX *= -1;
			}
			else if (GLOBAL_BOTON_S) character.y += 60*dt;
			else if (GLOBAL_BOTON_D) {
				character.x += 80*dt;
				if (character.scaleX < 0) character.scaleX *= -1;
			}
			
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
				if (enemyArray[i].y < character.y) enemyArray[i].y += 60*dt;
				if (enemyArray[i].y > character.y) enemyArray[i].y -= 60*dt;
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
				if ( Math.sqrt(Math.pow((enemyArray[i].x - (fairy.x/*GLOBAL_MOUSE_X-capa1.x*/)), 2) + Math.pow((enemyArray[i].y - (fairy.y/*GLOBAL_MOUSE_Y-capa1.y*/)), 2)) < 25)  {
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
				updateSprites0();
				customDt = dt + increasement;
				frogPoints += customDt;
				
				if (int(frogPoints) == 15) increasement = 0.012;
				if (int(frogPoints) == 25) increasement = 0.016;
				if (int(frogPoints) == 40) increasement = 0.024;
				if (int(frogPoints) == 60) increasement = 0.035;
				
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
					secsPassed += customDt;

					if (secsPassed >= 1.2)
					{	
						for (var i:int = LEVELS_0-1; i >= 0; i--)
						{
							for (var j:int = TRACKS_0-1; j >=0 ; j--)
							{
								if (gameMatrix[i][j] == 1) 
								{
									trace("found");
									gameMatrix[i][j] = 0;
									if (i + 1 <4)
									{
										if (gameMatrix[i+1][j] == 2) dead = true;
										gameMatrix[i+1][j] = 1;
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
			var screen:Image = new Image(Assets.getTexture("Screen"));
			capa0.addChild(screen);
			
			character0 = new Image(Assets.getTexture("Character0"));
			capa0.addChild(character0);
			//character.x = capa0.width / 2 - character.width / 2;
			character0.y = capa0.height - character0.height;
			character0.visible = false;
		}
		
		private function updateSprites0():void
		{
			for (var t:int = 0; t < LEVELS_0; t++)
			{	
				for (var u:int = 0; u < TRACKS_0; u++)
				{
					if (gameMatrix[t][u] == 2)
					{
						character0.visible = true; 
						trace(u * 50);
						character0.x = u*50;
					}
				}
			}
			
			for (var i:int = 0; i < bombsAway.length; i++)
			{
				capa0.removeChild(bombsAway[i]);
				bombsAway.splice(i, 1);
			}
			
			for (t = 0; t < LEVELS_0; t++)
			{	
				for (u= 0; u < TRACKS_0; u++)
				{
					if (gameMatrix[t][u] == 1)
					{
						var bomb:Image = new Image(Assets.getTexture("Bomb"));
						capa0.addChild(bomb);
						bomb.x = 50 * u;
						bomb.y = 45 * t;
						bombsAway.push(bomb);
					}
				}
			}
					
		}
				
		private function moveLeftHand(dt:Number):void {
			
			// MOVE LEFT HAND
			var new_x:Number = leftHand.x;
			var new_y:Number = leftHand.y;
			var speed_leftHand:Number = 500;
			
			if (GLOBAL_BOTON_W) {
				new_y -= dt * speed_leftHand;
				if (new_x + leftHand.width > capa1.x && new_y < capa1.y + heightCapa1) { new_y = capa1.y + heightCapa1; }
			}
			if (GLOBAL_BOTON_S) {
				new_y += dt * speed_leftHand;
			}
			if (GLOBAL_BOTON_A) {
				new_x -= dt * speed_leftHand;
			}
			if (GLOBAL_BOTON_D) {
				new_x += dt * speed_leftHand;
				if (new_x + leftHand.width > capa1.x && new_y < capa1.y + heightCapa1) { new_x = capa1.x - leftHand.width; }
			}
			
			if ((new_x + leftHand.width) > GAME.true_width / 2) {
				new_x = GAME.true_width / 2 - leftHand.width;
			}
			if (new_x < -leftHand.width/2) {
				new_x = -leftHand.width/2;
			}
			if (new_y > GAME.true_height - leftHand.height/2) {
				new_y = GAME.true_height - leftHand.height/2;
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
				
				/*
				var point_hand_x:Number = rightHand.x + 25;
				var point_hand_y:Number = rightHand.y - 0;
				
				//mouse.x = point_hand_x;
				//mouse.y = point_hand_y;			
				
				var point_mouse_x:Number = point_hand_x + mouse.width/2;
				var point_mouse_y:Number = point_hand_y + mouse.height/2;
				*/
				
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
				
				//var point_hand_x:Number = rightHand.x + rightHand.width/2;
				//var point_hand_y:Number = rightHand.y + rightHand.height/2;
				/*
				if (point_hand_x >= areaMouse.x && point_hand_x <= areaMouse.x + areaMouse.width &&
				point_hand_y >= areaMouse.y && point_hand_y <= areaMouse.y + areaMouse.height) {
					mouseCatched = true;
				}
				*/
				
				if (GLOBAL_MOUSE_X >= areaMouse.x && GLOBAL_MOUSE_X <= areaMouse.x + areaMouse.width &&
				GLOBAL_MOUSE_Y >= areaMouse.y && GLOBAL_MOUSE_Y <= areaMouse.y + areaMouse.height) {
					mouseCatched = true;
				}
				
			}

			
		}
		
	}
	
}