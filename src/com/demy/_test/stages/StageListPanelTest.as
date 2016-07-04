package com.demy._test.stages 
{
	import com.demy._test.TestMain;
	import com.demy._test.TestUtils;
	import com.demy.waterslide.stages.EditStageDialog;
	import com.demy.waterslide.GameStage;
	import com.demy.waterslide.stages.StageListPanel;
	import feathers.controls.List;
	import feathers.core.PopUpManager;
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
			testListPanel.addAndSelectStage(testStage);
			
			TestUtils.executeAfterTimeout(checkListChanged, this);
		}
		
		[Test(async)]
		public function ifUISelectEventThenDispatchesSelect():void
		{
			eventCought = false;
			
			const testStage:GameStage = new GameStage(TestUtils.getRandomName());
			testListPanel.addAndSelectStage(testStage);
			
			testListPanel.addEventListener(Event.SELECT, listEventHandler);
			const list:List = findList(testListPanel);
			list.selectedIndex = 0;
			list.dispatchEventWith(Event.SELECT);
			
			TestUtils.executeAfterTimeout(checkItemSelected, this);
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
		
		[Test(async)]
		public function ifButtonPressedThenDialogPopsUp():void
		{
			Assert.assertFalse(TestUtils.hasTopLevelPopup());
			
			TestUtils.findButton(testListPanel).dispatchEventWith(Event.TRIGGERED);
			TestUtils.executeAfterTimeout(checkPopupExists, this);
		}
		
		private function checkPopupExists(event:TimerEvent, data:Object = null):void 
		{
			Assert.assertTrue(TestUtils.hasTopLevelPopup());
			PopUpManager.removePopUp(TestUtils.getTopLevelPopup());
		}
		
		[Test(async)]
		public function ifListDoublePressedThenDialogWithSelectedItemPopsUp():void
		{
			Assert.assertFalse(TestUtils.hasTopLevelPopup());
			
			testListPanel.addAndSelectStage(new GameStage(TestUtils.getRandomName()));
			findList(testListPanel).dispatchEventWith(StageListPanel.EDIT);
			TestUtils.executeAfterTimeout(checkPopupHasSelectedItem, this);
		}
		
		private function checkPopupHasSelectedItem(event:TimerEvent, data:Object = null):void 
		{
			const dialog:EditStageDialog = TestUtils.getTopLevelPopup() as EditStageDialog;
			PopUpManager.removePopUp(TestUtils.getTopLevelPopup());
			Assert.assertEquals(dialog.item, findList(testListPanel).selectedItem);
		}
		
		[After]
		public function cleanup():void
		{
			testListPanel.removeFromParent(true);
			testListPanel = null;
		}
		
	}

}