package com.demy.waterslide.controls 
{
	import com.demy.waterslide.controls.StageList;
	import com.demy.waterslide.model.GameStage;
	import feathers.controls.Panel;
	import feathers.data.ListCollection;
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
			addChild(listView);
		}
		
		public function addStage(stage:GameStage):void
		{
			listView.dataProvider.addItem(stage);
			updateList();
		}
		
		private function updateList():void 
		{
			listView.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		private function disposeListView():void 
		{
			if (listView)
			{
				listView.dispose();
				listView = null;
			}
		}
		
		override public function dispose():void 
		{
			disposeListView();
			
			super.dispose();
		}
		
	}

}