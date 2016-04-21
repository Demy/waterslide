package com.demy.waterslide.controls 
{
	import com.demy.waterslide.ThemeSettings;
	import feathers.controls.Button;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import starling.display.Quad;
	
	/**
	 * ...
	 * @author 
	 */
	public class AddStageButton extends Button 
	{
		
		public function AddStageButton() 
		{
			
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			defaultSkin = new Quad(1, 1, ThemeSettings.LIGHT_MAIN_COLOR);
			
			labelFactory = createPlusLabel;
			label = "+";
			
			width = ThemeSettings.BIG_TEXT_SIZE;
			height = ThemeSettings.BIG_TEXT_SIZE;
		}
		
		private function createPlusLabel():ITextRenderer 
		{
			const label:TextFieldTextRenderer = new TextFieldTextRenderer();
			label.textFormat = new TextFormat(ThemeSettings.FONT, ThemeSettings.SMALL_TEXT_SIZE);
			label.textFormat.align = TextFormatAlign.CENTER;
			label.wordWrap = true;
			return label;
		}
	}

}