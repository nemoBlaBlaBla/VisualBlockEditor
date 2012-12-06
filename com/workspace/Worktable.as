package com.workspace
{
	import flash.display.Sprite;
	import com.Block;

	public class Worktable extends Sprite
	{

		private var _app:VisualBlockEditor;

		public function Worktable()
		{
			DrawWorktable();
		}

		private function DrawWorktable()
		{
//			this.graphics.beginFill(0xe53533, 0.75);
			
//			this.graphics.lineStyle(2,0x000000,1);
			//this.graphics.cubicCurveTo(0,0,100,150,50,50);
//			this.graphics.drawRoundRect(0,0,100,100,10); 
		}
		
		public function AddBlock()
		{
			this.addChild(new Block(this));
		}

	}

}