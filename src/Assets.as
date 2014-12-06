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
		
<<<<<<< HEAD
		[Embed(source = "../media/graphics/screen.jpg")]
		public static const Screen:Class;
=======
		// ****************** CAPA 1 ******************
		[Embed(source = "../media/graphics/crusader.png")]
		public static const character:Class;
		
		[Embed(source = "../media/graphics/Fairy.png")]
		public static const fairy:Class;
		
		[Embed(source = "../media/graphics/beetle.png")]
		public static const enemy:Class;
		
		[Embed(source = "../media/graphics/heart.png")]
		public static const heart:Class;
		
		//[Embed(source = "../media/graphics/mosaic_ground.png")]
		//public static const AtlasTextureGame2:Class;
>>>>>>> origin/master
		
		[Embed(source = "../media/graphics/character.png")]
		public static const Character:Class;
		
		[Embed(source = "../media/graphics/bomb.png")]
		public static const Bomb:Class;
		

		
		[Embed(source = "../media/graphics/mySpriteSheet.xml", mimeType = "application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
	
		[Embed(source="../media/sounds/menu.mp3")]
		public static const SoundMenu:Class;
	
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