package com.demy.waterslide.stages 
{
	import com.demy.waterslide.ThemeSettings;
	import com.demy.waterslide.GameStage;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import feathers.skins.IStyleProvider;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import starling.display.Quad;
	
	/**
	 * ...
	 * @author 
	 */
	public class StageListCell extends DefaultListItemRenderer 
	{
		public static var globalStyleProvider:IStyleProvider;
		
		public function StageListCell() 
		{
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_isToggle = true;
		}
		
		override protected function commitData():void 
		{
			super.commitData();
			
			const item:GameStage = data as GameStage;
			if (!item) return;
			
			label = item.name;
		}
		
		override protected function get defaultStyleProvider():IStyleProvider
		{
			return StageListCell.globalStyleProvider;
		}
		
	}

}