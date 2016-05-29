package com.demy.waterslide.theme 
{
	import com.demy.waterslide.controls.AddStageButton;
	import com.demy.waterslide.controls.EditStageDialog;
	import com.demy.waterslide.controls.StageList;
	import com.demy.waterslide.controls.StageListCell;
	import com.demy.waterslide.controls.StageListPanel;
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.List;
	import feathers.controls.Panel;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalLayout;
	import feathers.themes.AeonDesktopTheme;
	import starling.display.Quad;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author 
	 */
	public class WaterSlideAeonTheme extends AeonDesktopTheme 
	{
		
		public function WaterSlideAeonTheme() 
		{
			
		}
		
		override protected function initializeStyleProviders():void
		{
			super.initializeStyleProviders();
		 
			this.getStyleProviderForClass( AddStageButton ).defaultStyleFunction = 
				this.setAddStageButtonStyles;
			this.getStyleProviderForClass( StageListCell ).defaultStyleFunction = 
				this.setStageListCellStyles;
				
			this.getStyleProviderForClass( StageListPanel ).defaultStyleFunction = 
				this.setStageListPanelStyles;
			this.getStyleProviderForClass( EditStageDialog ).defaultStyleFunction = 
				this.setEditStageDialogStyles;
				
			this.getStyleProviderForClass( StageList ).defaultStyleFunction = 
				this.setAddStageListStyles;
		}
		
		private function setAddStageButtonStyles(button:Button):void 
		{
			setButtonStyles(button);
			
			button.width = 32;
			button.height = 32;
			
			const icon:Sprite = new Sprite();
			const horizontalLine:Quad = new Quad(15, 5);
			horizontalLine.y = 5;
			icon.addChild(horizontalLine);
			const verticalLine:Quad = new Quad(5, 15);
			verticalLine.x = 5;
			icon.addChild(verticalLine);
			button.defaultIcon = icon;
		}
		
		private function setStageListCellStyles(button:StageListCell):void 
		{
			setItemRendererStyles(button);
			
			button.width = 60;
			button.height = 30;
		}
		
		private function setStageListPanelStyles(panel:Panel):void 
		{
			setPanelStyles(panel);
			
			panel.autoSizeMode = Panel.AUTO_SIZE_MODE_CONTENT;
			
			const horizontalLayout:HorizontalLayout = new HorizontalLayout();
			horizontalLayout.padding = 0;
			horizontalLayout.gap = 3;
			panel.layout = horizontalLayout;
			
			panel.headerProperties.titleAlign = Header.TITLE_ALIGN_PREFER_LEFT;
		}
		
		private function setEditStageDialogStyles(panel:Panel):void 
		{
			setPanelStyles(panel);
			
			const verticalLayout:VerticalLayout = new VerticalLayout();
			verticalLayout.padding = 0;
			verticalLayout.gap = 3;
			verticalLayout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
			panel.layout = verticalLayout;
		}
		
		private function setAddStageListStyles(list:List):void 
		{
			setListStyles(list);
			
			list.backgroundSkin.alpha = 0;
			
			const horizontalLayout:HorizontalLayout = new HorizontalLayout();
			horizontalLayout.padding = 0;
			horizontalLayout.paddingBottom = 10;
			horizontalLayout.gap = 3;
			list.layout = horizontalLayout;
		}
	}

}