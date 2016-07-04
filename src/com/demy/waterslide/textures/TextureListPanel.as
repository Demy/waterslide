package com.demy.waterslide.textures 
{
	import com.demy._test.textures.TextureListPanelTest;
	import feathers.controls.Panel;
	import feathers.skins.IStyleProvider;
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author 
	 */
	public class TextureListPanel extends Panel 
	{		
		public static var globalStyleProvider:IStyleProvider;
		static private const TILE_SIZE:Number = 60;
		
		private var _isLoading:Boolean;
		
		private var loader:LocalImageLoader;
		
		public function TextureListPanel() 
		{
			_isLoading = false;
			
			title = "Библиотека";
		}
		
		public function load():void
		{
			_isLoading = true;
			
			loader = new LocalImageLoader();
			loader.addEventListener(Event.COMPLETE, showLoadedTexturesInList);
			loader.load(LocalImageLoader.getImagesFromFolder(LocalImageLoader.IMAGES_FOLDER));
		}
		
		private function showLoadedTexturesInList(e:Event):void 
		{
			_isLoading = false;
			dispatchEventWith(Event.COMPLETE);
		
			addImages(loader.getTextureNames());
			
			invalidate(INVALIDATION_FLAG_ALL);
		}
		
		private function addImages(names:Vector.<String>):void 
		{
			var size:int = names.length;
			var tile:DisplayObject;
			for (var i:int = 0; i < size; i++)
			{
				tile = createTile(names[i]);
				addChild(tile);
			}
		}
		
		private function createTile(name:String):DisplayObject 
		{
			var result:TextureListItem = new TextureListItem(name, loader.getTexture(name), TILE_SIZE);
			return result;
		}
		
		public function get isLoading():Boolean 
		{
			return _isLoading;
		}
		
		override protected function get defaultStyleProvider():IStyleProvider
		{
			return TextureListPanel.globalStyleProvider;
		}
		
	}

}