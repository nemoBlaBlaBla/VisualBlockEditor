package com
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.display.Sprite;
	import flash.ui.Keyboard;
	import flash.sampler.Sample;
	import flash.text.TextFormat;

	//import fl.controls.Button;


	public class Block extends MovieClip
	{
		protected var _helpString:String;
		protected var _blockString:String;

		protected var _fullView:BlockFullView = new BlockFullView();
		protected var _infoPopUp:PopUpContainer = new PopUpContainer();

		private var _tf:TextFormat = new TextFormat("Arial",15,0xFFFFFF);

		public function Block()
		{
			this.smallView.addEventListener(MouseEvent.MOUSE_DOWN, MouseDownHandler);
			this.smallView.addEventListener(MouseEvent.MOUSE_UP, MouseUpHandler);
			this.smallView.btnClose.addEventListener(MouseEvent.CLICK, CloseButtonClickHandler);
			this.smallView.btnInfo.addEventListener(MouseEvent.CLICK, BlockHelp);
			this.smallView.btnShow.addEventListener(MouseEvent.CLICK, FullViewHandler);

			this.smallView.lblName.setStyle("textFormat", _tf);

			_helpString = "help help help";
			_fullView.y = this.height;
			_infoPopUp.y = this.height;
			_fullView.visible = false;
			_infoPopUp.visible = false;
			_infoPopUp.PopUpLabel.text = _helpString;
			this.addChild(_fullView);
			this.addChild(_infoPopUp);

			trace("BLOCK");
		}

		private function MouseDownHandler(evt:MouseEvent)
		{
			this.startDrag();
			parent.setChildIndex(this, parent.numChildren - 1);
		}

		private function MouseUpHandler(evt:MouseEvent)
		{
			this.stopDrag();
			if(this.x < 0){this.x = 0}
			if(this.y < 0){this.y = 0}
		}

		private function CloseButtonClickHandler(evt:MouseEvent)
		{
			this.DeleteBlock();
		}

		private function DeleteBlock()
		{
			parent.removeChild(this);
			trace("Deleted!!!");
		}

		private function BlockHelp(evt:MouseEvent)
		{
			if (_infoPopUp.visible == false)
			{
				_infoPopUp.visible = true;
			}
			else
			{
				_infoPopUp.visible = false;
			}
		}

		private function FullViewHandler(evt:MouseEvent)
		{
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


			return (lbl + smallView.lblName.text + "\t" + op + A + B + C + D + E + F + G + H + Comm);

		}
	}

}