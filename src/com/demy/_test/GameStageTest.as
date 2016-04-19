package com.demy._test 
{
	import com.demy.waterslide.model.GameStage;
	import org.flexunit.Assert;
	/**
	 * ...
	 * @author 
	 */
	public class GameStageTest 
	{
		
		public function GameStageTest() 
		{
			
		}
		
		[Test]
		public function whenCreatedWithNameReturnsSameName():void
		{
			const name:String = TestUtils.getRandomName();
			const testStage:GameStage = new GameStage(name);
			Assert.assertEquals(name, testStage.name);
		}
		
	}

}