package com.demy._test.stages 
{
	import com.demy._test.TestMain;
	import com.demy._test.TestUtils;
	import com.demy.waterslide.stages.AddStageButton;
	import flash.events.TimerEvent;
	import org.flexunit.Assert;
	import starling.events.Event;
	/**
	 * ...
	 * @author 
	 */
	public class AddStageButtonTest 
	{
		private var buttonAddedToStage:Boolean;
		
		public function AddStageButtonTest() 
		{
			
		}
		
		[Test(async)]
		public function addingToStageTest():void
		{
			buttonAddedToStage = false;
			const testButton:AddStageButton = new AddStageButton();
			testButton.addEventListener(Event.ADDED_TO_STAGE, onButtonAddedToStage);
			TestMain.container.addChild(testButton);
			
			TestUtils.executeAfterTimeout(checkAdded, this);
		}
		
		private function checkAdded(event:TimerEvent, data:Object = null):void 
		{
			Assert.assertTrue(buttonAddedToStage);
		}
		
		private function onButtonAddedToStage(e:Event):void 
		{
			e.currentTarget.removeEventListener(Event.ADDED_TO_STAGE, onButtonAddedToStage);
			buttonAddedToStage = true;
		}
		
	}

}