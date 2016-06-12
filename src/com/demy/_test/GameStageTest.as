package com.demy._test 
{
	import com.demy._test.TestUtils;
	import com.demy.waterslide.GameStage;
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
		
		[Test]
		public function whenSetNameReturnsSameName():void
		{
			const testStage:GameStage = new GameStage(TestUtils.getRandomName());
			const newName:String = TestUtils.getRandomName();
			testStage.setName(newName);
			Assert.assertEquals(newName, testStage.name);
		}
		
	}

}