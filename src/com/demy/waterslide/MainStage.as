package com.demy.waterslide 
{
	import com.demy.waterslide.controls.StageListPanel;
	import com.demy.waterslide.model.GameStage;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author 
	 */
	public class MainStage extends Sprite 
	{
		
		public function MainStage() 
		{
			var testPanel:StageListPanel = new StageListPanel();
			testPanel.addAndSelectStage(new GameStage("test"));
			testPanel.addAndSelectStage(new GameStage("test"));
			testPanel.addAndSelectStage(new GameStage("test"));
			testPanel.addAndSelectStage(new GameStage("test"));
			testPanel.addAndSelectStage(new GameStage("test"));
			addChild(testPanel);
			testPanel.width = 200;
		}
		
	}

}