package com.workspace
{
	import flash.display.Sprite;
	import com.Block;
	import com.blocks.Generate;
	import com.PopUpContainer;
	import flash.text.TextField;
	import fl.controls.Label;
	import com.blocks.*;
	import flash.events.MouseEvent;
	import com.ClosePopUp;

	public class Worktable extends Sprite
	{

		private var _app:VisualBlockEditor;
		private var _blockList:Vector.<Block> = new Vector.<Block>();
		private var _popUpsLayer:Sprite = new Sprite();
		private var _blocksLayer:Sprite = new Sprite();

		public function Worktable()
		{
			DrawWorktable();
			this.addChild(_blocksLayer);
			this.addChild(_popUpsLayer);
			this.addEventListener(MouseEvent.CLICK, MouseClickHandler);
		}

		private function DrawWorktable()
		{

		}

		public function AddBlock(itemLabel:String)
		{
			if (itemLabel == "JustABlock"){_blocksLayer.addChild(new Block());}
			if (itemLabel == "GENERATE"){_blocksLayer.addChild(new Generate());}
			if (itemLabel == "ADVANCE"){_blocksLayer.addChild(new Advance());}
			if (itemLabel == "TERMINATE"){_blocksLayer.addChild(new Terminate());}
			if (itemLabel == "SEIZE"){_blocksLayer.addChild(new Seize());}
			if (itemLabel == "RELEASE"){_blocksLayer.addChild(new Release());}
			if (itemLabel == "DEPART"){_blocksLayer.addChild(new Depart());}
			if (itemLabel == "TRANSFER"){_blocksLayer.addChild(new Transfer());}
			if (itemLabel == "QUEUE"){_blocksLayer.addChild(new Queue());}
			if (itemLabel == "ENTER"){_blocksLayer.addChild(new Enter());}
			if (itemLabel == "LEAVE"){_blocksLayer.addChild(new Leave());}
			if (itemLabel == "TABULATE"){_blocksLayer.addChild(new Tabulate());}
			if (itemLabel == "SAVEVALUE"){_blocksLayer.addChild(new Savevalue());}
			if (itemLabel == "ASSIGN"){_blocksLayer.addChild(new Assign());}
		}

		public function GetGPSSCode()
		{
			_popUpsLayer.removeChildren();
			var blockList:Array = new Array();
			var codePopUp:PopUpContainer = new ClosePopUp();
			var tf:TextField = new TextField();
			
			for (var i:int = 0; i < _blocksLayer.numChildren; i++)
			{
				blockList.push(_blocksLayer.getChildAt(i));
			}
			blockList.sortOn("y", Array.NUMERIC);
			for (var j:int = 0; j < blockList.length; j++)
			{
				try
				{
					tf.appendText(blockList[j].GetBlockString() + "\n");
				}
				catch(err:Error)
				{
					trace(err.errorID + "\n" + err.name + "\n" + err.message);
				}
			}
			codePopUp.PopUpLabel.text = tf.text;
			codePopUp.PopUpLabel.selectable = true;
			codePopUp.x = (stage.stageWidth / 2) - (codePopUp.width / 2);
			codePopUp.y = (stage.stageHeight / 2) - (codePopUp.height / 2);
			_popUpsLayer.addChild(codePopUp);
		}
		
		private function MouseClickHandler(evt:MouseEvent)
		{
			//_popUpsLayer.removeChildren();
		}

	}

}