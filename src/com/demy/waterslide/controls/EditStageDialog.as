package com.demy.waterslide.controls
{
	import com.demy.waterslide.GameStage;
	import feathers.controls.Button;
	import feathers.controls.Panel;
	import feathers.controls.TextInput;
	import feathers.skins.IStyleProvider;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author
	 */
	public class EditStageDialog extends Panel
	{
		private var _item:GameStage;
		private var nameInput:TextInput;
		
		public static var globalStyleProvider:IStyleProvider;
		
		public function EditStageDialog(item:GameStage)
		{
			_item = item;
			
			createNameInput();
			createOkButton();
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			title = "Имя сцены:";
		}
		
		private function createNameInput():void 
		{
			nameInput = new TextInput();
			nameInput.text = _item.name;
			addChild(nameInput);
		}
		
		private function createOkButton():void
		{
			const okButton:Button = new Button();
			okButton.label = "OK";
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
		
		override protected function get defaultStyleProvider():IStyleProvider
		{
			return EditStageDialog.globalStyleProvider;
		}
	
	}

}