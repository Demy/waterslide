package com.demy.waterslide.controls 
{
	import com.demy.waterslide.controls.StageList;
	import com.demy.waterslide.model.GameStage;
	import feathers.controls.Panel;
	import feathers.data.ListCollection;
	import starling.events.Event;
	/**
	 * ...
	 * @author 
	 */
	public class StageListPanel extends Panel
	{		
		private var listView:StageList;
		
		public function StageListPanel() 
		{			
			listView = new StageList();
			listView.dataProvider = new ListCollection([]);
			listView.addEventListener(Event.SELECT, selectStage);
			addChild(listView);
		}
		
		private function selectStage(e:Event = null):void 
		{
			dispatchEventWith(Event.SELECT, false, listView.selectedItem);
		}
		
		public function addStage(stage:GameStage):void
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
			super.width = value;
			listView.width = width;
		}
		
		override public function dispose():void 
		{
			disposeListView();
			
			super.dispose();
		}
		
	}

}