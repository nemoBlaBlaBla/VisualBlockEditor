package com.blocks
{
	import com.Block;

	public class Leave extends Block
	{

		public function Leave()
		{
			smallView.lblName.text = "LEAVE";
			
			_fullView.OperatorCombo.enabled = false;
			_fullView.Param_A_edit.enabled = true;
			_fullView.Param_B_edit.enabled = true;
			_fullView.Param_C_edit.enabled = false;
			_fullView.Param_D_edit.enabled = false;
			_fullView.Param_E_edit.enabled = false;
			_fullView.Param_F_edit.enabled = false;
			_fullView.Param_G_edit.enabled = false;
			_fullView.Param_H_edit.enabled = false;
		}

	}

}