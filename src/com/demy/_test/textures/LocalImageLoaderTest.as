package com.demy._test.textures 
{
	import com.demy.waterslide.textures.LocalImageLoader;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import org.flexunit.Assert;
	/**
	 * ...
	 * @author 
	 */
	public class LocalImageLoaderTest 
	{
		private static const EXITING_IMAGE:String = "check_mini.png";
		
		public function LocalImageLoaderTest() 
		{
			
		}
		
		public function afterLoadWithNoItemsIsReady():void
		{
			var loader:LocalImageLoader = new LocalImageLoader();
			loader.load(new Vector.<String>());
			Assert.assertTrue(loader.isReady());
		}
		
		[Test]
		public function whenJustCreatedNotReady():void
		{
			Assert.assertFalse(new LocalImageLoader().isReady());
		}
		
		[Test(async)]
		public function whenLoadImageSendsChangeAndCompleteEvents():void
		{
			var loader:LocalImageLoader = new LocalImageLoader();
			var vector:Vector.<String> = new Vector.<String>();
			vector.push(EXITING_IMAGE);
			loader.load(vector);
			
			// TODO: finish test with starling async
		}
		
		[Test(async)]
		public function whenLoadImageIsReadyAfterComplete():void
		{
			var loader:LocalImageLoader = new LocalImageLoader();
			var vector:Vector.<String> = new Vector.<String>();
			vector.push(EXITING_IMAGE);
			loader.load(vector);
			
			// TODO: finish test with starling async
		}
		
		[Test]
		public function ifGetImagesFromNonexistantFolderThenVoidVector():void
		{
			Assert.assertEquals(LocalImageLoader.getImagesFromFolder("test path").length, 0);
		}
		
		[Test]
		public function whenGetImagesFromFolderReturnsItsContents():void
		{
			const tempFolderName:String = "tempTestFolder";
			var desktop:File = File.userDirectory.resolvePath(tempFolderName);
			desktop.createDirectory();
			var testFile:File = File.userDirectory.resolvePath(tempFolderName.concat("/temp.txt"));
			var fileStream:FileStream = new FileStream();
			fileStream.open(testFile, FileMode.WRITE);
			fileStream.writeUTF('temp file contents');
			fileStream.close();
			
			Assert.assertEquals(LocalImageLoader.getImagesFromFolder(tempFolderName)[0], testFile.nativePath);
			
			desktop.deleteDirectory(true);
		}
	}

}