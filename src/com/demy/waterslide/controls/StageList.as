package com.demy.waterslide.controls 
{
	import feathers.controls.List;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.ILayout;
	
	/**
	 * ...
	 * @author 
	 */
	public class StageList extends List 
	{
		
		public function StageList() 
		{
			layout = createHorizontalLayout();
			
			itemRendererType = StageListCell;
		}
		
		private function createHorizontalLayout():ILayout 
		{
			const layout:HorizontalLayout = new HorizontalLayout();
			return layout;
		}
		
	}

}