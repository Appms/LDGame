package  
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author Ruvipls
	 */
	public class Assets 
	{
		
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		private static var gameTextures2:Dictionary = new Dictionary();
		private static var gameTextureAtlas2:TextureAtlas;
		/*
		private static var gameTextures3:Dictionary = new Dictionary();
		private static var gameTextureAtlas3:TextureAtlas;
		*/
		
		[Embed(source = "../media/graphics/mySpriteSheet.png")]
		public static const AtlasTextureGame:Class;
		
		[Embed(source = "../media/graphics/mySpriteSheet2.png")]
		public static const AtlasTextureGame2:Class;
		
		[Embed(source = "../media/graphics/screen.jpg")]
		public static const Screen:Class;
		
		// ****************** CAPA 1 ******************
		[Embed(source = "../media/graphics/crusader.png")]
		public static const character:Class;
		[Embed(source = "../media/graphics/crusader_jump.png")]
		public static const character_jump:Class;
		
		[Embed(source = "../media/graphics/Fairy.png")]
		public static const fairy:Class;
		
		[Embed(source = "../media/graphics/beetle.png")]
		public static const enemy:Class;
		
		[Embed(source = "../media/graphics/heart.png")]
		public static const heart:Class;
		
		[Embed(source = "../media/graphics/gamepad.png")]
		public static const gamepad:Class;
		
		[Embed(source = "../media/graphics/LB.png")]
		public static const LB:Class;
		[Embed(source = "../media/graphics/LBP.png")]
		public static const LBP:Class;
		[Embed(source = "../media/graphics/RB.png")]
		public static const RB:Class;
		[Embed(source = "../media/graphics/RBP.png")]
		public static const RBP:Class;
		
		[Embed(source = "../media/graphics/closeIcon.png")]
		public static const closeIcon:Class;
		
		[Embed(source = "../media/graphics/wallpaper.jpg")]
		public static const wallpaper:Class;
		
		[Embed(source = "../media/graphics/txtIcon.png")]
		public static const txtIcon:Class;
		
		[Embed(source = "../media/graphics/txtInfo.png")]
		public static const txtInfo:Class;
		
		[Embed(source = "../media/graphics/txtInfo2.png")]
		public static const textInfo2:Class;
		
		[Embed(source = "../media/graphics/txtClose.png")]
		public static const txtClose:Class;
		
		[Embed(source = "../media/graphics/gameIcon.png")]
		public static const gameIcon:Class;
		
		[Embed(source = "../media/graphics/cursor.png")]
		public static const cursor:Class;
		
		[Embed(source = "../media/graphics/loadScreen.jpg")]
		public static const LoadScreen:Class;
		
		//[Embed(source = "../media/graphics/mosaic_ground.png")]
		//public static const AtlasTextureGame2:Class;

		
		[Embed(source = "../media/graphics/character.png")]
		public static const Character0:Class;
		
		[Embed(source = "../media/graphics/bomb.png")]
		public static const Bomb:Class;
		
		[Embed(source = "../media/graphics/mySpriteSheet.xml", mimeType = "application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		[Embed(source = "../media/graphics/mySpriteSheet2.xml", mimeType = "application/octet-stream")]
		public static const AtlasXmlGame2:Class;
		
	
		[Embed(source="../media/sounds/menu.mp3")]
		public static const SoundMenu:Class;
		
		[Embed(source="../media/sounds/squeak1_01.mp3")]
		public static const SoundSqueak1_01:Class;
		
		[Embed(source="../media/sounds/squeak1_02.mp3")]
		public static const SoundSqueak1_02:Class;
		
		[Embed(source="../media/sounds/squeak2_01.mp3")]
		public static const SoundSqueak2_01:Class;
		
		[Embed(source="../media/sounds/squeak2_02.mp3")]
		public static const SoundSqueak2_02:Class;
		
		[Embed(source="../media/sounds/squeak3_01.mp3")]
		public static const SoundSqueak3_01:Class;
		
		[Embed(source="../media/sounds/squeak3_02.mp3")]
		public static const SoundSqueak3_02:Class;
		
		[Embed(source="../media/sounds/squeak4_01.mp3")]
		public static const SoundSqueak4_01:Class;
		
		[Embed(source="../media/sounds/squeak4_02.mp3")]
		public static const SoundSqueak4_02:Class;
		
		[Embed(source="../media/sounds/squeak5_01.mp3")]
		public static const SoundSqueak5_01:Class;
		
		[Embed(source="../media/sounds/squeak5_02.mp3")]
		public static const SoundSqueak5_02:Class;
		
		[Embed(source="../media/sounds/squeak6_01.mp3")]
		public static const SoundSqueak6_01:Class;
		
		[Embed(source="../media/sounds/squeak6_02.mp3")]
		public static const SoundSqueak6_02:Class;
		
		[Embed(source="../media/sounds/squeak7_01.mp3")]
		public static const SoundSqueak7_01:Class;
		
		[Embed(source="../media/sounds/squeak7_02.mp3")]
		public static const SoundSqueak7_02:Class;
		
		[Embed(source="../media/sounds/squeak8_01.mp3")]
		public static const SoundSqueak8_01:Class;
		
		[Embed(source="../media/sounds/squeak8_02.mp3")]
		public static const SoundSqueak8_02:Class;
		
		[Embed(source="../media/sounds/squeak9_01.mp3")]
		public static const SoundSqueak9_01:Class;
		
		[Embed(source="../media/sounds/squeak9_02.mp3")]
		public static const SoundSqueak9_02:Class;
		
		[Embed(source="../media/sounds/squeak10_01.mp3")]
		public static const SoundSqueak10_01:Class;
		
		/*
		[Embed(source="../media/sounds/squeak20.mp3")]
		public static const SoundSqueak20:Class;
		*/
		
		[Embed(source="../media/sounds/tick.mp3")]
		public static const FrogTick:Class;
		
		[Embed(source="../media/sounds/death.mp3")]
		public static const FrogDeath:Class;
		
		[Embed(source="../media/sounds/move.mp3")]
		public static const FrogMove:Class;
		
		[Embed(source="../media/sounds/office.mp3")]
		public static const OfficeSound:Class;
		
		[Embed(source="../media/sounds/frogIntro.mp3")]
		public static const FrogIntro:Class;
		
		[Embed(source = "../media/graphics/retroFont.ttf", fontFamily ="RetroFont", embedAsCFF = false)]
		public static const RetroFont:Class;

		[Embed(source="../media/sounds/squeak10_02.mp3")]
		public static const SoundSqueak10_02:Class;
		
		[Embed(source="../media/sounds/click.mp3")]
		public static const SoundClick:Class;
		
		[Embed(source="../media/sounds/key.mp3")]
		public static const SoundKey:Class;
		
		[Embed(source="../media/sounds/office.mp3")]
		public static const SoundOffice:Class;
		
		[Embed(source="../media/sounds/phone_call.mp3")]
		public static const SoundPhone:Class;
		
		[Embed(source = "../media/sounds/startup.mp3")]
		public static const StartUp:Class;
		
		[Embed(source="../media/sounds/SECRETARY.mp3")]
		public static const SoundSecretary:Class;
		
		[Embed(source="../media/sounds/BOSS.mp3")]
		public static const SoundBoss:Class;
		
		[Embed(source="../media/sounds/coffee.mp3")]
		public static const SoundSlurp:Class;
		
		[Embed(source="../media/sounds/Mumble_01.mp3")]
		public static const SoundMumble1:Class;
		
		[Embed(source="../media/sounds/Mumble_03.mp3")]
		public static const SoundMumble3:Class;
		
		[Embed(source="../media/sounds/Mumble_04.mp3")]
		public static const SoundMumble4:Class;
		
		

		
		//***************Sounds Capa 1****************
		
		[Embed(source = "../media/sounds/SCA_Main.mp3")]
		public static const SCA_Main:Class;
		
		[Embed(source = "../media/sounds/powerUp.mp3")]
		public static const PowerUp:Class;
		
		[Embed(source = "../media/sounds/button_pushed.mp3")]
		public static const ButtonSound:Class;
		
		//[Embed(source = "../media/sounds/bug.mp3")]
		//public static const BugSound:Class;
		


	
		public static function getAtlas():TextureAtlas {
			if (gameTextureAtlas == null) {
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML = XML(new AtlasXmlGame());
				gameTextureAtlas = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas;
		}
		
		public static function getAtlas2():TextureAtlas {
			if (gameTextureAtlas2 == null) {
				var texture:Texture = getTexture("AtlasTextureGame2");
				var xml:XML = XML(new AtlasXmlGame2());
				gameTextureAtlas2 = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas2;
		}
		
		
		/*
		public static function getAtlas3():TextureAtlas {
			if (gameTextureAtlas3 == null) {
				var texture:Texture = getTexture("AtlasTextureGame3");
				var xml:XML = XML(new AtlasXmlGame3());
				gameTextureAtlas3 = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas3;
		}
		*/
		
		public static function getTexture(name:String):Texture {
			if (gameTextures[name] == undefined) {
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
		
		public static function getTexture2(name:String):Texture {
			if (gameTextures2[name] == undefined) {
				var bitmap:Bitmap = new Assets[name]();
				gameTextures2[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures2[name];
		}
		/*
		public static function getTexture3(name:String):Texture {
			if (gameTextures3[name] == undefined) {
				var bitmap:Bitmap = new Assets[name]();
				gameTextures3[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures3[name];
		}
		*/
		
		public function Assets() 
		{
			
		}
		
	}

}