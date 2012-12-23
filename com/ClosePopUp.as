package com {
	
	import flash.events.MouseEvent;
	
	public class ClosePopUp extends PopUpContainer {

		private var _btnClose:CloseButton = new CloseButton();
		
		public function ClosePopUp() {
			_btnClose.x = this.width;
			_btnClose.y = -20;
			this.addChild(_btnClose);
			this._btnClose.addEventListener(MouseEvent.CLICK, CloseButtonClickHandler)
		}
		
		private function CloseButtonClickHandler(ebt:MouseEvent)
		{
			parent.removeChild(this);
		}
	}
}
