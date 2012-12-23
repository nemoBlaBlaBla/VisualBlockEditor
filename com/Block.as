package com
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.display.Sprite;
	import flash.ui.Keyboard;
	import flash.text.TextFormat;

	public class Block extends MovieClip
	{
		//строковая переменная для сгенерированного программного кода
		protected var _blockString:String;
		//дополнительные окна: расширеный вид и подсказка
		protected var _fullView:BlockFullView = new BlockFullView();
		protected var _infoPopUp:PopUpContainer = new PopUpContainer();

		private var _tf:TextFormat = new TextFormat("Arial",15,0xFFFFFF);

		public function Block()
		{
			//обработчики событий
			this.smallView.addEventListener(MouseEvent.MOUSE_DOWN, MouseDownHandler);
			this.smallView.addEventListener(MouseEvent.MOUSE_UP, MouseUpHandler);
			this.smallView.btnClose.addEventListener(MouseEvent.CLICK, CloseButtonClickHandler);
			this.smallView.btnInfo.addEventListener(MouseEvent.CLICK, BlockHelp);
			this.smallView.btnShow.addEventListener(MouseEvent.CLICK, FullViewHandler);

			this.smallView.lblName.setStyle("textFormat", _tf);
			
			
			_fullView.y = this.height;
			_infoPopUp.y = this.height;
			_fullView.visible = false;
			_infoPopUp.visible = false;
			this.addChild(_fullView);
			this.addChild(_infoPopUp);
		}

		private function MouseDownHandler(evt:MouseEvent)
		{
			//метод для начала перетаскивания
			this.startDrag();
			parent.setChildIndex(this, parent.numChildren - 1);
		}

		private function MouseUpHandler(evt:MouseEvent)
		{
			//метод для окончания перетаскивания
			this.stopDrag();
			if(this.x < 0){this.x = 0}
			if(this.y < 0){this.y = 0}
		}

		private function CloseButtonClickHandler(evt:MouseEvent)
		{
			//удаления блока
			this.DeleteBlock();
		}

		private function DeleteBlock()
		{
			parent.removeChild(this);
		}

		private function BlockHelp(evt:MouseEvent)
		{
			//показать подсказку, если её не видно.
			if (_infoPopUp.visible == false)
			{
				_infoPopUp.visible = true;
			}
			//скрыть, если видно
			else
			{
				_infoPopUp.visible = false;
			}
		}

		private function FullViewHandler(evt:MouseEvent)
		{
			//точно так же и для расширеного вида
			if (_fullView.visible == false)
			{
				_fullView.visible = true;
			}
			else
			{
				_fullView.visible = false;
			}
		}

		public function GetBlockString():String
		{
			//формируем код
			var lbl:String = new String("");
			var op:String = new String("");
			var A:String = new String("");
			var B:String = new String("");
			var C:String = new String("");
			var D:String = new String("");
			var E:String = new String("");
			var F:String = new String("");
			var G:String = new String("");
			var H:String = new String("");
			var Comm:String = new String("");
			
			//считываем текст из каждого пля ввода, добавляем соответсвующие разделители (табуляции и запятые)
			//если поля пустые, то пропускаем их.
			lbl = _fullView.Label_edit.text + "\t";
			if ((_fullView.OperatorCombo.selectedLabel != ("" || null)) && (_fullView.OperatorCombo.enabled == true))
			{
				op = _fullView.OperatorCombo.selectedLabel + ",";
			}
			if (_fullView.Param_A_edit.text != "")
			{
				A = _fullView.Param_A_edit.text;
			}
			if (_fullView.Param_B_edit.text != "")
			{
				B = "," + _fullView.Param_B_edit.text;
			}
			if (_fullView.Param_C_edit.text != "")
			{
				C = "," + _fullView.Param_C_edit.text;
			}
			if (_fullView.Param_D_edit.text != "")
			{
				D = "," + _fullView.Param_D_edit.text;
			}
			if (_fullView.Param_E_edit.text != "")
			{
				E = "," + _fullView.Param_E_edit.text;
			}
			if (_fullView.Param_F_edit.text != "")
			{
				F = "," + _fullView.Param_F_edit.text;
			}
			if (_fullView.Param_G_edit.text != "")
			{
				G = "," + _fullView.Param_G_edit.text;
			}
			if (_fullView.Param_H_edit.text != "")
			{
				H = "," + _fullView.Param_H_edit.text;
			}
			if (_fullView.Comment_edit.text != "")
			{
				Comm = "\t" + ";" + _fullView.Comment_edit.text;
			}
			
			//возвращаем код
			return (lbl + smallView.lblName.text + "\t" + op + A + B + C + D + E + F + G + H + Comm);
		}
	}

}