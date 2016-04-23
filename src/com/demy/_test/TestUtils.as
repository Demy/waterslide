package com.demy._test 
{
	import feathers.controls.Button;
	import feathers.core.PopUpManager;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flexunit.framework.TestCase;
	import org.flexunit.async.Async;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author 
	 */
	public class TestUtils 
	{
		
		public function TestUtils() 
		{
			
		}
		
		public static function getRandomName():String
		{
			return "testItem".concat(Math.round(Math.random() * 100).toString());
		}
		
		public static function getRandomNumber(max:Number = 100):Number
		{
			return Math.random() * max;
		}
		
		public static function executeAfterTimeout(handler:Function, test:Object, time:Number = 10):void
		{
			const timer:Timer = new Timer(time, 1);
			Async.handleEvent(test, timer, TimerEvent.TIMER_COMPLETE, handler);
			timer.start();
		}
		
		public static function findButton(container:DisplayObjectContainer):Button 
		{
			var i:int = container.numChildren;
			while (i--) if (container.getChildAt(i) is Button) return container.getChildAt(i) as Button;
			return new Button();
		}
		
		public static function hasTopLevelPopup():Boolean
		{
			return getTopLevelPopup().parent != null;
		}
		
		public static function getTopLevelPopup():DisplayObject
		{
			var i:int = Starling.current.stage.numChildren;
			var popup:DisplayObject;
			while (i--)
			{
				popup = Starling.current.stage.getChildAt(i);
				if (PopUpManager.isTopLevelPopUp(popup)) return popup;
			}
			return new Sprite();
		}
		
	}

}