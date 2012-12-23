package com.blocks
{
	import com.Block;
	import flash.display.Sprite;

	public class Generate extends Block
	{

		public function Generate()
		{
			//для каждого вида блоков меняем отображаемое имя
			smallView.lblName.text = "GENERATE";
			//а также делаем активными только нужные поля ввода
			_fullView.OperatorCombo.enabled = false;
			_fullView.Param_A_edit.enabled = true;
			_fullView.Param_B_edit.enabled = true;
			_fullView.Param_C_edit.enabled = true;
			_fullView.Param_D_edit.enabled = true;
			_fullView.Param_E_edit.enabled = true;
			_fullView.Param_F_edit.enabled = false;
			_fullView.Param_G_edit.enabled = false;
			_fullView.Param_H_edit.enabled = false;
			//ссылка на символ-подсказку
			_infoPopUp.PopUpScroll.source = new GenerateHelp();
			_infoPopUp.PopUpLabel.visible = false;
		}
	}
}