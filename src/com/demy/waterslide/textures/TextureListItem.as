package com.demy.waterslide.textures 
{
	import com.demy.waterslide.ThemeSettings;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author 
	 */
	public class TextureListItem extends Sprite 
	{
		private var title:TextField;
		private var image:Image;
		private var tileSize:Number;
		
		public function TextureListItem(name:String, texture:Texture, tileSize:Number) 
		{
			this.tileSize = tileSize;
			image = addImage(texture, tileSize);
			title = addTitle(name);
		}
		
		private function addImage(texture:Texture, tileSize:Number):Image 
		{
			var image:Image = new Image(texture);
			image.scaleX = image.scaleY = Math.min(tileSize / texture.width, tileSize / texture.height);
			addChild(image);
			return image;
		}
		
		private function addTitle(name:String):TextField 
		{
			var result:TextField = new TextField(tileSize, ThemeSettings.SMALL_TEXT_SIZE * 2, name, 
				ThemeSettings.FONT, ThemeSettings.SMALL_TEXT_SIZE);
			addChild(result);
			return result;
		}
		
	}

}