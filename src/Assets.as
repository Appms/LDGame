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
		/*
		private static var gameTextures2:Dictionary = new Dictionary();
		private static var gameTextureAtlas2:TextureAtlas;
		private static var gameTextures3:Dictionary = new Dictionary();
		private static var gameTextureAtlas3:TextureAtlas;
		*/
		
		[Embed(source = "../media/graphics/mySpriteSheet.png")]
		public static const AtlasTextureGame:Class;
		
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
		
		//[Embed(source = "../media/graphics/mosaic_ground.png")]
		//public static const AtlasTextureGame2:Class;

		
		[Embed(source = "../media/graphics/character.png")]
		public static const Character0:Class;
		
		[Embed(source = "../media/graphics/bomb.png")]
		public static const Bomb:Class;
		
		[Embed(source = "../media/graphics/DETB_BG.png")]
		public static const DETB_BG:Class;
		

		
		[Embed(source = "../media/graphics/mySpriteSheet.xml", mimeType = "application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
	
		[Embed(source="../media/sounds/menu.mp3")]
		public static const SoundMenu:Class;
		
		[Embed(source="../media/sounds/squeak1.mp3")]
		public static const SoundSqueak1:Class;
		
		[Embed(source="../media/sounds/squeak2.mp3")]
		public static const SoundSqueak2:Class;
		
		[Embed(source="../media/sounds/squeak3.mp3")]
		public static const SoundSqueak3:Class;
		
		[Embed(source="../media/sounds/squeak4.mp3")]
		public static const SoundSqueak4:Class;
		
		[Embed(source="../media/sounds/squeak5.mp3")]
		public static const SoundSqueak5:Class;
		
		[Embed(source="../media/sounds/squeak6.mp3")]
		public static const SoundSqueak6:Class;
		
		[Embed(source="../media/sounds/squeak7.mp3")]
		public static const SoundSqueak7:Class;
		
		[Embed(source="../media/sounds/squeak8.mp3")]
		public static const SoundSqueak8:Class;
		
		[Embed(source="../media/sounds/squeak9.mp3")]
		public static const SoundSqueak9:Class;
		
		[Embed(source="../media/sounds/squeak10.mp3")]
		public static const SoundSqueak10:Class;
		
		[Embed(source="../media/sounds/squeak11.mp3")]
		public static const SoundSqueak11:Class;
		
		[Embed(source="../media/sounds/squeak12.mp3")]
		public static const SoundSqueak12:Class;
		
		[Embed(source="../media/sounds/squeak13.mp3")]
		public static const SoundSqueak13:Class;
		
		[Embed(source="../media/sounds/squeak14.mp3")]
		public static const SoundSqueak14:Class;
		
		[Embed(source="../media/sounds/squeak15.mp3")]
		public static const SoundSqueak15:Class;
		
		[Embed(source="../media/sounds/squeak16.mp3")]
		public static const SoundSqueak16:Class;
		
		[Embed(source="../media/sounds/squeak17.mp3")]
		public static const SoundSqueak17:Class;
		
		[Embed(source="../media/sounds/squeak18.mp3")]
		public static const SoundSqueak18:Class;
		
		[Embed(source="../media/sounds/squeak19.mp3")]
		public static const SoundSqueak19:Class;
		
		[Embed(source="../media/sounds/squeak20.mp3")]
		public static const SoundSqueak20:Class;
		
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
	
		public static function getAtlas():TextureAtlas {
			if (gameTextureAtlas == null) {
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML = XML(new AtlasXmlGame());
				gameTextureAtlas = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas;
		}
		/*
		public static function getAtlas2():TextureAtlas {
			if (gameTextureAtlas2 == null) {
				var texture:Texture = getTexture("AtlasTextureGame2");
				var xml:XML = XML(new AtlasXmlGame2());
				gameTextureAtlas2 = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas2;
		}
		*/
		
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
		/*
		public static function getTexture2(name:String):Texture {
			if (gameTextures2[name] == undefined) {
				var bitmap:Bitmap = new Assets[name]();
				gameTextures2[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures2[name];
		}
		
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