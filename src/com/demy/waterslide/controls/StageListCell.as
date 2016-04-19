package com.demy.waterslide.controls 
{
	import com.demy.waterslide.ThemeSettings;
	import com.demy.waterslide.model.GameStage;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import starling.display.Quad;
	
	/**
	 * ...
	 * @author 
	 */
	public class StageListCell extends DefaultListItemRenderer 
	{
		private static const WIDTH:Number = 80;
		private static const HEIGHT:Number = 90;
		
		public function StageListCell() 
		{
			labelFactory = stageLabelFactory;
			
			defaultSkin = new Quad(1, 1, ThemeSettings.SECONDARY_COLOR);
			defaultSelectedSkin = new Quad(1, 1, ThemeSettings.LIGHT_MAIN_COLOR);
		}
		
		private function stageLabelFactory():ITextRenderer 
		{
			const label:TextFieldTextRenderer = new TextFieldTextRenderer();
			label.textFormat = new TextFormat(ThemeSettings.FONT, ThemeSettings.SMALL_TEXT_SIZE, 
				ThemeSettings.FIRST_TEXT_COLOR);
			label.textFormat.align = TextFormatAlign.CENTER;
			label.wordWrap = true;
			label.width = WIDTH * 0.8;
			label.height = HEIGHT * 0.8;
			return label;
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_isToggle = true;
			
			width = WIDTH;
			height = HEIGHT;
		}
		
		override protected function commitData():void 
		{
			super.commitData();
			
			const item:GameStage = data as GameStage;
			if (!item) return;
			
			label = item.name;
		}
		
	}

}