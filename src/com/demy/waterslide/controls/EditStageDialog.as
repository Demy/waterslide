package com.demy.waterslide.controls
{
	import com.demy.waterslide.model.GameStage;
	import feathers.controls.Button;
	import feathers.controls.Panel;
	import feathers.controls.TextInput;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author
	 */
	public class EditStageDialog extends Panel
	{
		private var _item:GameStage;
		private var nameInput:TextInput;
		
		public function EditStageDialog(item:GameStage)
		{
			_item = item;
			
			createNameInput();
			createOkButton();
		}
		
		private function createNameInput():void 
		{
			nameInput = new TextInput();
			addChild(nameInput);
		}
		
		private function createOkButton():void
		{
			const okButton:Button = new Button();
			addChild(okButton);
			okButton.addEventListener(Event.TRIGGERED, dispatchSave);
		}
		
		private function dispatchSave(e:Event):void
		{
			saveData();
			
			dispatchEventWith(Event.COMPLETE, false, item);
		}
		
		private function saveData():void 
		{
			item.setName(nameInput.text);
		}
		
		public function get item():GameStage 
		{
			return _item;
		}
	
	}

}