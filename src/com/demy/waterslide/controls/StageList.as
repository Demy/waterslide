package com.demy.waterslide.controls 
{
	import feathers.controls.List;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.ILayout;
	import feathers.skins.IStyleProvider;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author 
	 */
	public class StageList extends List 
	{		
		private var lastTappedIndex:int;
		
		public static var globalStyleProvider:IStyleProvider;
		
		public function StageList() 
		{			
			itemRendererType = StageListCell;
			
			addEventListener(Event.TRIGGERED, dispatchEditOnDoubleTap);
		}
		
		private function dispatchEditOnDoubleTap(e:Event):void 
		{
			if (lastTappedIndex == selectedIndex) 
				dispatchEventWith(StageListPanel.EDIT);
			lastTappedIndex = selectedIndex;
		}
		
		override protected function get defaultStyleProvider():IStyleProvider
		{
			return StageList.globalStyleProvider;
		}
		
	}

}