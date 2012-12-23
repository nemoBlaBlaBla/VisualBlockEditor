package com
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class PopUpContainer extends MovieClip
	{
		public function PopUpContainer()
		{
		}

		private function MouseDownHandler(evt:MouseEvent)
		{
			this.startDrag();
		}

		private function MouseUpHandler(evt:MouseEvent)
		{
			this.stopDrag();
		}
		
		private function ClosePopUp()
		{
			parent.removeChild(this);
		}
	}
}