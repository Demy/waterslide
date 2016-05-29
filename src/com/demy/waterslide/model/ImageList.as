package com.demy.waterslide.model 
{
	import flash.filesystem.File;
	import starling.utils.AssetManager;
	/**
	 * ...
	 * @author 
	 */
	public class ImageList 
	{
		private static const IMAGE_FOLDER:String = "waterslide";
		
		public function ImageList() 
		{
			loadImagesAsAssets(getLocalImages());
		}
		
		private function loadImagesAsAssets(localImages:Vector.<String>):void 
		{
			const assetManager:AssetManager = new AssetManager();
			var i:int = imagePaths.length;
			while (i--) assetManager.enqueue(imagePaths[i]);
			assetManager.loadQueue(function (progress:Number):void {
				if (progress == 1) endLoading(assetManager);
			});
		}
		
		private function endLoading(assetManager:AssetManager):void 
		{
			// TODO: make unit test for these functions. I sadly didn't use TDD while creating them
		}
		
		public static function getLocalImages():Vector.<String> 
		{
			var result:Vector.<String> = new Vector.<String>();
			var desktop:File = File.userDirectory.resolvePath(IMAGE_FOLDER);
			if (!desktop.exists) desktop.createDirectory();
			 
			var getfiles:Array = desktop.getDirectoryListing();
			 
			for (var i:int = 0; i < getfiles.length; i++) 
			{ 			  	 			  
				result.push(getfiles[i].nativePath);   
			}
			return result;
		}
		
	}

}