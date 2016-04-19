package com.demy.waterslide.model 
{
	/**
	 * ...
	 * @author 
	 */
	public class GameStage 
	{
		private var _name:String;
		
		public function GameStage(name:String) 
		{
			_name = name;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
	}

}