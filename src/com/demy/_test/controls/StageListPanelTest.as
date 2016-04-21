package com.demy._test.controls 
{
	import com.demy._test.TestMain;
	import com.demy._test.TestUtils;
	import com.demy.waterslide.model.GameStage;
	import com.demy.waterslide.controls.StageListPanel;
	import feathers.controls.List;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flexunit.framework.Assert;
	import org.flexunit.async.Async;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	import starling.events.EventDispatcher;
	/**
	 * ...
	 * @author 
	 */
	public class StageListPanelTest 
	{
		private var testListPanel:StageListPanel;
		
		private var eventCought:Boolean;
		private var eventData:Object;
		
		public function StageListPanelTest() 
		{
			
		}
		
		[Before]
		public function setup():void
		{
			testListPanel = new StageListPanel();
			TestMain.container.addChild(testListPanel);
		}
		
		[Test(async)]
		public function whenItemAddedThenNoError():void
		{
			eventCought = false;
			testListPanel.addEventListener(Event.CHANGE, listEventHandler);
			
			const testStage:GameStage = new GameStage(TestUtils.getRandomName());
			testListPanel.addStage(testStage);
			
			TestUtils.executeAfter(100, checkListChanged, this);
		}
		
		[Test(async)]
		public function ifUISelectEventThenDispatchesSelect():void
		{
			eventCought = false;
			
			const testStage:GameStage = new GameStage(TestUtils.getRandomName());
			testListPanel.addStage(testStage);
			
			testListPanel.addEventListener(Event.SELECT, listEventHandler);
			const list:List = findList(testListPanel);
			list.selectedIndex = 0;
			list.dispatchEventWith(Event.SELECT);
			
			TestUtils.executeAfter(100, checkItemSelected, this);
		}
		
		private function findList(container:DisplayObjectContainer):List 
		{
			var child:List;
			var i:int = container.numChildren;
			while (i--)
			{
				child = container.getChildAt(i) as List;
				if (child) return child;
			}
			return null;
		}
		
		private function checkItemSelected(event:TimerEvent, data:Object = null):void 
		{
			Assert.assertNotNull(eventData);
		}
		
		private function listEventHandler(e:Event):void 
		{
			eventCought = true;
			eventData = e.data;
			testListPanel.removeEventListener(e.type, listEventHandler);
		}
		
		private function checkListChanged(event:TimerEvent, data:Object = null):void 
		{
			Assert.assertTrue(eventCought);
		}
		
		[After]
		public function cleanup():void
		{
			testListPanel.removeFromParent(true);
			testListPanel = null;
		}
		
	}

}