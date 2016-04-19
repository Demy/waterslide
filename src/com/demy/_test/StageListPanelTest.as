package com.demy._test 
{
	import com.demy.waterslide.model.GameStage;
	import com.demy.waterslide.controls.StageListPanel;
	import flexunit.framework.Assert;
	/**
	 * ...
	 * @author 
	 */
	public class StageListPanelTest 
	{
		private var testListPanel:StageListPanel;
		
		public function StageListPanelTest() 
		{
			
		}
		
		[Before]
		public function setup():void
		{
			testListPanel = new StageListPanel();
		}
		
		[Test]
		public function whenItemAddedThenNoError():void
		{
			const firstStage:GameStage = new GameStage(TestUtils.getRandomName());
			testListPanel.addStage(firstStage);
			
			const secondStage:GameStage = new GameStage(TestUtils.getRandomName());
			testListPanel.addStage(secondStage);
		}
		
		[After]
		public function cleanup():void
		{
			testListPanel = null;
		}
		
	}

}