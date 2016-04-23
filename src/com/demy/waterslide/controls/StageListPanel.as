package com.demy.waterslide.controls 
{
	import com.demy.waterslide.controls.StageList;
	import com.demy.waterslide.model.GameStage;
	import feathers.controls.Button;
	import feathers.controls.Panel;
	import feathers.core.PopUpManager;
	import feathers.data.ListCollection;
	import feathers.layout.HorizontalLayout;
	import starling.events.Event;
	/**
	 * ...
	 * @author 
	 */
	public class StageListPanel extends Panel
	{		
		public static const EDIT:String = "edit stage";
		
		private static const NEW_STAGE_NAME:String = "New stage";
		
		private static const PADDING:Number = 10;
		
		private var listView:StageList;
		private var addButton:Button;
		
		public function StageListPanel() 
		{			
			createLayout();
			createAndAddList();
			createAndAddButton();
			validate();
		}
		
		private function createLayout():void 
		{
			const layout:HorizontalLayout = new HorizontalLayout();
			layout.verticalAlign = HorizontalLayout.VERTICAL_ALIGN_MIDDLE;
			layout.gap = PADDING;
			layout.padding = PADDING;
			this.layout = layout;
		}
		
		private function createAndAddList():void 
		{
			listView = new StageList();
			listView.dataProvider = new ListCollection([]);
			listView.addEventListener(Event.SELECT, selectStage);
			listView.addEventListener(EDIT, showEditStageDialog);
			addChild(listView);
		}
		
		private function selectStage(e:Event = null):void 
		{
			dispatchEventWith(Event.SELECT, false, listView.selectedItem);
		}
		
		private function showEditStageDialog(e:Event):void 
		{
			showEditDialog(listView.selectedItem as GameStage);
		}
		
		private function createAndAddButton():void 
		{
			addButton = new AddStageButton();
			addChild(addButton);
			addButton.addEventListener(Event.TRIGGERED, showAddStageDialog);
		}
		
		private function showAddStageDialog(e:Event):void 
		{
			showEditDialog(new GameStage(NEW_STAGE_NAME));
		}
		
		private function showEditDialog(gameStage:GameStage):void 
		{
			const dialog:Panel = new EditStageDialog(gameStage);
			PopUpManager.addPopUp(dialog);
			dialog.addEventListener(Event.COMPLETE, updateItem);
		}
		
		private function updateItem(e:Event):void 
		{
			listView.dataProvider.updateItemAt(listView.selectedIndex);
		}
		
		public function addAndSelectStage(stage:GameStage):void
		{
			listView.dataProvider.addItem(stage);
			listView.selectedIndex = listView.dataProvider.length - 1;
			updateList();
			selectStage();
		}
		
		private function updateList():void 
		{
			listView.invalidate(INVALIDATION_FLAG_DATA);
			dispatchEventWith(Event.CHANGE);
		}
		
		private function disposeListView():void 
		{
			if (listView)
			{
				listView.removeEventListener(Event.SELECT, selectStage);
				listView.dispose();
				listView = null;
			}
		}
		
		override public function set width(value:Number):void 
		{
			listView.width = value - PADDING * 3 - addButton.width;
			super.width = value;
		}
		
		override public function dispose():void 
		{
			disposeListView();
			
			super.dispose();
		}
		
	}

}