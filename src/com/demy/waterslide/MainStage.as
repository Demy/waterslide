package com.demy.waterslide 
{
	import com.demy.waterslide.stages.StageListPanel;
	import com.demy.waterslide.GameStage;
	import com.demy.waterslide.textures.LocalImageLoader;
	import com.demy.waterslide.textures.TextureListPanel;
	import com.demy.waterslide.theme.WaterSlideAeonTheme;
	import starling.core.Starling;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author 
	 */
	public class MainStage extends Sprite 
	{
		
		public function MainStage() 
		{
			new WaterSlideAeonTheme();
			
			var textureList:TextureListPanel = new TextureListPanel();
			textureList.load();
			addChild(textureList);
		}
		
	}

}