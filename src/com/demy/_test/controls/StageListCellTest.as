package com.demy._test.controls 
{
	import com.demy._test.TestUtils;
	import com.demy.waterslide.model.GameStage;
	import com.demy.waterslide.controls.StageListCell;
	import feathers.controls.List;
	import feathers.core.FeathersControl;
	import feathers.data.ListCollection;
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import starling.core.Starling;
	/**
	 * ...
	 * @author 
	 */
	public class StageListCellTest 
	{
		private var testCell:StageListCell;
		
		public function StageListCellTest() 
		{
			
		}
		
		[Before]
		public function setup():void
		{
			testCell = new StageListCell();
			Starling.current.stage.addChild(testCell);
		}
		
		[Test]
		public function drawsStageWhenInList():void
		{
			const testList:List = new List();
			testList.itemRendererType = StageListCell;
			testList.dataProvider = new ListCollection([ new GameStage(TestUtils.getRandomName()) ]);
			Starling.current.stage.addChild(testList);
			
			const name:String = TestUtils.getRandomName();
			testList.dataProvider.addItem(new GameStage(name));
			testList.invalidate(FeathersControl.INVALIDATION_FLAG_DATA);
			testList.validate();
			
			testList.removeFromParent(true);
		}
		
		[Test]
		public function stageNameEqualsCellLabel():void
		{
			const name:String = TestUtils.getRandomName();
			testCell.data = new GameStage(name);
			testCell.invalidate(FeathersControl.INVALIDATION_FLAG_DATA);
			testCell.validate();
			Assert.assertEquals(name, testCell.label);
		}
		
		[After]
		public function cleanup():void
		{
			if (testCell)
			{
				testCell.removeFromParent(true);
				testCell = null;
			}
		}
		
	}

}