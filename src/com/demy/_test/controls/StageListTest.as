package com.demy._test.controls 
{
	import com.demy.waterslide.controls.StageList;
	import org.flexunit.Assert;
	/**
	 * ...
	 * @author 
	 */
	public class StageListTest 
	{
		private var testList:StageList;
		
		public function StageListTest() 
		{
			
		}
		
		[Before]
		public function setup():void
		{
			testList = new StageList();
		}
		
		[Test]
		public function checkIfHasLayout():void
		{
			Assert.assertNotNull(testList.layout);
		}
		
		[After]
		public function cleanup():void
		{
			if (testList)
			{
				testList.dispose();
				testList = null;
			}
		}
		
	}

}