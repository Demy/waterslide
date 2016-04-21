package com.demy._test 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flexunit.framework.TestCase;
	import org.flexunit.async.Async;
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
		
		public static function executeAfter(time:Number, handler:Function, test:Object):void
		{
			const timer:Timer = new Timer(time, 1);
			Async.handleEvent(test, timer, TimerEvent.TIMER_COMPLETE, handler);
			timer.start();
		}
		
	}

}