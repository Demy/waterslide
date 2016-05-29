package com.demy.waterslide.controls 
{
	import com.demy.waterslide.ThemeSettings;
	import feathers.controls.Button;
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
	public class AddStageButton extends Button 
	{
		public static var globalStyleProvider:IStyleProvider;
		
		public function AddStageButton() 
		{		
		}
		
		override protected function get defaultStyleProvider():IStyleProvider
		{
			return AddStageButton.globalStyleProvider;
		}
	}

}