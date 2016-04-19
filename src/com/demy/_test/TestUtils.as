package com.demy._test 
{
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
		
	}

}