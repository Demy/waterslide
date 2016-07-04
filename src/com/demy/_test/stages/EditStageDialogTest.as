package com.demy._test.stages 
{
	import com.demy._test.TestUtils;
	import com.demy.waterslide.stages.EditStageDialog;
	import com.demy.waterslide.GameStage;
	import feathers.controls.TextInput;
	import flash.events.TimerEvent;
	import org.flexunit.Assert;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	/**
	 * ...
	 * @author 
	 */
	public class EditStageDialogTest 
	{
		private var dialog:EditStageDialog;
		private var newName:String;
		private var name:String;
		private var stage:GameStage;
		
		public function EditStageDialogTest() 
		{
			
		}
		
		[Before]
		public function setup():void
		{
			stage = new GameStage(TestUtils.getRandomName());
			dialog = new EditStageDialog(stage);
		}
		
		[Test(async)]
		public function testNameDispatched():void 
		{
			dialog.addEventListener(Event.COMPLETE, saveName);
			TestUtils.findButton(dialog).dispatchEventWith(Event.TRIGGERED);

			TestUtils.executeAfterTimeout(checkNameDispatched, this);	
		}
		
		private function checkNameDispatched(event:TimerEvent, data:Object = null):void 
		{
			Assert.assertEquals(stage.name, name);
		}
		
		private function saveName(e:Event):void 
		{
			name = String(e.data.name);
		}
		
		[Test(async)]
		public function testNewNameDispatched():void 
		{
			dialog.addEventListener(Event.COMPLETE, saveName);
			newName = TestUtils.getRandomName();
			findInput(dialog).text = newName;
			TestUtils.findButton(dialog).dispatchEventWith(Event.TRIGGERED);
			
			TestUtils.executeAfterTimeout(checkNewNameDispatched, this);	
		}
		
		private function checkNewNameDispatched(event:TimerEvent, data:Object = null):void 
		{
			Assert.assertEquals(newName, name);
		}
		
		private function findInput(container:DisplayObjectContainer):TextInput 
		{
			var i:int = container.numChildren;
			while (i--) if (container.getChildAt(i) is TextInput) return container.getChildAt(i) as TextInput;
			return new TextInput();
		}
		
		[After]
		public function cleanup():void
		{
			dialog.dispose();
			dialog = null;
		}
		
	}

}