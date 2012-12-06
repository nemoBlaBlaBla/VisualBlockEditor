package com.workspace
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import fl.controls.Button;


	public class Toolbar extends MovieClip
	{
		private var _arg:int;

		public function Toolbar(arg:int = 0)
		{
			AddItemButton.addEventListener(MouseEvent.CLICK, fl_MouseClickHandler);
			AddItemButton.addEventListener(MouseEvent.CLICK, AddItemClick);
			_arg = arg;
		}

		private function fl_MouseClickHandler(event:MouseEvent):void
		{
			trace("Button pressed; \n" + "arg = " + _arg);
		}
		
		private function AddItemClick(event:MouseEvent):void
		{
		}
	}

}