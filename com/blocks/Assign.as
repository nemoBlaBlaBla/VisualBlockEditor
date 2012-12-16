package com.blocks {
	import com.Block;
	
	public class Assign extends Block {

		public function Assign() {
			smallView.lblName.text = "ASSIGN";
			
			_fullView.OperatorCombo.enabled = false;
			_fullView.Param_A_edit.enabled = true;
			_fullView.Param_B_edit.enabled = true;
			_fullView.Param_C_edit.enabled = true;
			_fullView.Param_D_edit.enabled = false;
			_fullView.Param_E_edit.enabled = false;
			_fullView.Param_F_edit.enabled = false;
			_fullView.Param_G_edit.enabled = false;
			_fullView.Param_H_edit.enabled = false;
			
			_infoPopUp.PopUpScroll.source = new AssignHelp();
			_infoPopUp.PopUpLabel.visible = false;
		}

	}
	
}
