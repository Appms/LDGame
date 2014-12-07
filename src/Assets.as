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
		
		//[Embed(source = "../media/graphics/diary.png")]
		//public static const AtlasTextureGame3:Class;
		
		[Embed(source = "../media/graphics/mySpriteSheet.xml", mimeType = "application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		//[Embed(source = "../media/graphics/mosaic_ground.xml", mimeType = "application/octet-stream")]
		//public static const AtlasXmlGame2:Class;
		
		//[Embed(source = "../media/graphics/diary.xml", mimeType = "application/octet-stream")]
		//public static const AtlasXmlGame3:Class;
		/*
		[Embed(source="../media/sounds/viento_tenebroso.mp3")]
		public static const SoundViento:Class;
		
		[Embed(source="../media/sounds/llamas.mp3")]
		public static const SoundLlamas:Class;
		
		[Embed(source="../media/sounds/pisadas.mp3")]
		public static const SoundPisadas:Class;
		
		[Embed(source="../media/sounds/llamas2.mp3")]
		public static const SoundLlamas2:Class;
		
		[Embed(source="../media/sounds/explosion.mp3")]
		public static const SoundExplosion:Class;
		
		[Embed(source="../media/sounds/roto.mp3")]
		public static const SoundRoto:Class;
		
		[Embed(source="../media/sounds/roto2.mp3")]
		public static const SoundRoto2:Class;
		
		[Embed(source="../media/sounds/roto3.mp3")]
		public static const SoundRoto3:Class;
		
		[Embed(source="../media/sounds/huron_comer_1.mp3")]
		public static const SoundRecoger:Class;
		
		[Embed(source="../media/sounds/huron_comer_2.mp3")]
		public static const SoundRecoger2:Class;
		
		[Embed(source="../media/sounds/spider_chasquido.mp3")]
		public static const SoundSpiderAttack:Class;
		
		[Embed(source="../media/sounds/spider_chirrido.mp3")]
		public static const SoundSpiderAttack2:Class;
		
		[Embed(source="../media/sounds/huron_cazado.mp3")]
		public static const SoundHuronCazado:Class;
		*/
		[Embed(source="../media/sounds/menu.mp3")]
		public static const SoundMenu:Class;
		/*
		[Embed(source="../media/sounds/hoja1.mp3")]
		public static const SoundHoja1:Class;
		
		[Embed(source="../media/sounds/hoja2.mp3")]
		public static const SoundHoja2:Class;
		
		[Embed(source="../media/sounds/pasarhojas.mp3")]
		public static const SoundHojas:Class;
		
		[Embed(source="../media/sounds/movecursor.mp3")]
		public static const SoundMoveCursor:Class;
		
		[Embed(source="../media/sounds/seleccionar.mp3")]
		public static const SoundSeleccionar:Class;
		
		[Embed(source="../media/sounds/scratch_1.mp3")]
		public static const SoundScratch1:Class;
		
		[Embed(source="../media/sounds/scratch_2.mp3")]
		public static const SoundScratch2:Class;
		
		[Embed(source="../media/sounds/scratch_3.mp3")]
		public static const SoundScratch3:Class;
		
		[Embed(source="../media/sounds/muerte_1.mp3")]
		public static const SoundMuerte1:Class;
		
		[Embed(source="../media/sounds/muerte_2.mp3")]
		public static const SoundMuerte2:Class;
		
		[Embed(source="../media/sounds/muerte_3.mp3")]
		public static const SoundMuerte3:Class;
		*/
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