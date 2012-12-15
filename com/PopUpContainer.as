package com
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;


	public class PopUpContainer extends MovieClip
	{


		public function PopUpContainer()
		{
			//this.addEventListener(MouseEvent.MOUSE_DOWN, MouseDownHandler);
			//this.addEventListener(MouseEvent.MOUSE_UP, MouseUpHandler);
			//this.addEventListener(MouseEvent.MIDDLE_CLICK, MouseMiddleClickHandler);
			//PopUpScroll.source = new MySymbol();
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
		
		private function MouseMiddleClickHandler(evt:MouseEvent)
		{
			ClosePopUp();
		}
	}

}