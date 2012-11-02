package com.workspace
{
	import flash.display.Sprite;

	public class Worktable extends Sprite
	{

		public function Worktable()
		{
			// constructor code
			DrawWorktable();
		}

		private function DrawWorktable()
		{
			this.graphics.beginFill(0xe53533, 0.75);
			this.graphics.lineStyle(2,0x000000,1);
			this.graphics.drawRoundRect(0,0,100,100,10);
		}

	}

}