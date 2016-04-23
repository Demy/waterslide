package com.demy._test.controls 
{
	import com.demy._test.TestUtils;
	import com.demy.waterslide.controls.StageList;
	import com.demy.waterslide.controls.StageListPanel;
	import com.demy.waterslide.model.GameStage;
	import feathers.controls.Button;
	import feathers.controls.supportClasses.ListDataViewPort;
	import feathers.data.ListCollection;
	import starling.events.Event;
	import flash.events.TimerEvent;
	import org.flexunit.Assert;
	/**
	 * ...
	 * @author 
	 */
	public class StageListTest 
	{
		private var testList:StageList;
		private var eventCaught:Boolean;
		
		public function StageListTest() 
		{
			
		}
		
		[Before]
		public function setup():void
		{
			testList = new StageList();
		}
		
		[Test]
		public function checkIfHasLayout():void
		{
			Assert.assertNotNull(testList.layout);
		}
		
		[Test(async)]
		public function ifListDoubleSelectedDispatchEdit():void
		{
			eventCaught = false;
			testList.dataProvider = new ListCollection([
				new GameStage(TestUtils.getRandomName()), new GameStage(TestUtils.getRandomName())
			]);
			testList.validate();
			testList.addEventListener(StageListPanel.EDIT, recordEvent);
			const cell:Button = (testList.getChildAt(0) as ListDataViewPort).getChildAt(0) as Button;
			cell.dispatchEventWith(Event.TRIGGERED);
			cell.dispatchEventWith(Event.TRIGGERED);
			
			TestUtils.executeAfterTimeout(checkEventCaught, this);
		}
		
		private function checkEventCaught(event:TimerEvent, data:Object = null):void 
		{
			Assert.assertTrue(eventCaught);
		}
		
		private function recordEvent(e:Event):void 
		{
			eventCaught = true;
		}
		
		[After]
		public function cleanup():void
		{
			if (testList)
			{
				testList.dispose();
				testList = null;
			}
		}
		
	}

}