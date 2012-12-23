package com.workspace
{
	import flash.display.Sprite;
	import com.Block;
	import com.blocks.Generate;
	import com.PopUpContainer;
	import flash.text.TextField;
	import com.blocks.*;
	import flash.events.MouseEvent;
	import com.ClosePopUp;

	public class Worktable extends Sprite
	{
		private var _popUpsLayer:Sprite = new Sprite();//слой для окон-подсказок
		private var _blocksLayer:Sprite = new Sprite();//слой для отображения блоков

		public function Worktable()
		{
			//добавляем слои на спрайт
			this.addChild(_blocksLayer);
			this.addChild(_popUpsLayer);
		}

		public function AddBlock(itemLabel:String)
		{
			//добавляем блоки на робочую область
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
			//очищаем слой подсказок
			_popUpsLayer.removeChildren();
			//создаем список добавленных блоков
			var blockList:Array = new Array();
			//создаем окно и текстовое поле
			var codePopUp:PopUpContainer = new ClosePopUp();
			var tf:TextField = new TextField();
			
			//заполяем список отображаемыми блоками
			for (var i:int = 0; i < _blocksLayer.numChildren; i++)
			{
				blockList.push(_blocksLayer.getChildAt(i));
			}
			
			//сортируем блоки по параметру "y", то есть по высоте положения на экране
			blockList.sortOn("y", Array.NUMERIC);
			//далее для каждого блока считываем его кусочек кода, который он сформировал.
			//И добавляем код в текстовое поле
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
			//помещаем текстовое поле на окно-подсказку, 
			//включаем возможность выделения
			codePopUp.PopUpLabel.text = tf.text;
			codePopUp.PopUpLabel.selectable = true;
			//вычисляем координаты окна, чтобы оно было посередине.
			codePopUp.x = (stage.stageWidth / 2) - (codePopUp.width / 2);
			codePopUp.y = (stage.stageHeight / 2) - (codePopUp.height / 2);
			//отображаем окно с кодом
			_popUpsLayer.addChild(codePopUp);
		}
	}
}