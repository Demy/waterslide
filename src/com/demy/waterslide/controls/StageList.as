package com.demy.waterslide.controls 
{
	import feathers.controls.List;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.ILayout;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author 
	 */
	public class StageList extends List 
	{
		private static const GAP:Number = 3;
		
		private var lastTappedIndex:int;
		
		public function StageList() 
		{
			layout = createHorizontalLayout();
			
			itemRendererType = StageListCell;
			
			addEventListener(Event.TRIGGERED, dispatchEditOnDoubleTap);
		}
		
		private function createHorizontalLayout():ILayout 
		{
			const layout:HorizontalLayout = new HorizontalLayout();
			layout.gap = GAP;
			return layout;
		}
		
		private function dispatchEditOnDoubleTap(e:Event):void 
		{
			if (lastTappedIndex == selectedIndex) 
				dispatchEventWith(StageListPanel.EDIT);
			lastTappedIndex = selectedIndex;
		}
		
	}

}