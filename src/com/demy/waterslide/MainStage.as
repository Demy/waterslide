package com.demy.waterslide 
{
	import com.demy.waterslide.controls.StageListPanel;
	import com.demy.waterslide.model.GameStage;
	import com.demy.waterslide.model.ImageList;
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
			
			var testPanel:StageListPanel = new StageListPanel();
			testPanel.setWidth(Starling.current.stage.stageWidth * 0.625);
			testPanel.addAndSelectStage(new GameStage("test"));
			testPanel.addAndSelectStage(new GameStage("test"));
			testPanel.addAndSelectStage(new GameStage("test"));
			testPanel.addAndSelectStage(new GameStage("test"));
			testPanel.addAndSelectStage(new GameStage("test"));
			addChild(testPanel);
			
			new ImageList();
		}
		
	}

}