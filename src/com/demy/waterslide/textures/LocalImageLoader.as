package com.demy.waterslide.textures 
{
	import flash.filesystem.File;
	import starling.events.Event;
	import starling.events.EventDispatcher;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	/**
	 * ...
	 * @author 
	 */
	public class LocalImageLoader extends EventDispatcher
	{
		public static const IMAGES_FOLDER:String = "waterslide";
		
		private var loader:AssetManager;
		
		public function LocalImageLoader() 
		{
		}
		
		public function load(imagePaths:Vector.<String>):void
		{
			loadImagesAsAssets(imagePaths);
		}
		
		private function loadImagesAsAssets(imagePaths:Vector.<String>):void 
		{
			const assetManager:AssetManager = new AssetManager();
			var i:int = imagePaths.length;
			
			if (i == 0) 
			{
				endLoading(assetManager);
				return;
			}
				
			while (i--) assetManager.enqueue(imagePaths[i]);
			assetManager.loadQueue(function (progress:Number):void {
				dispatchEventWith(Event.CHANGE, false, progress);
				if (progress == 1) 
				{
					endLoading(assetManager);
				}
			});
		}
		
		private function endLoading(assetManager:AssetManager):void 
		{
			loader = assetManager;
			dispatchEventWith(Event.COMPLETE);
		}
		
		public static function getImagesFromFolder(path:String):Vector.<String> 
		{
			var result:Vector.<String> = new Vector.<String>();
			var desktop:File = File.userDirectory.resolvePath(path);
			if (desktop.exists) 
			{
				var getfiles:Array = desktop.getDirectoryListing();
				 
				for (var i:int = 0; i < getfiles.length; i++) 
				{ 			  	 			  
					result.push(getfiles[i].nativePath);   
				}
			}
			return result;
		}
		
		public function getTexture(name:String):Texture
		{
			return loader.getTexture(name);
		}
		
		public function getTextureNames():Vector.<String>
		{
			return loader.getTextureNames();
		}
		
		public function isReady():Boolean
		{
			return loader != null;
		}
		
	}

}