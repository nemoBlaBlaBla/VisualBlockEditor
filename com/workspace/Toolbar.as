package com.workspace {
	import flash.display.Sprite;
	import fl.motion.AnimatorFactory3D;
	
	public class Toolbar extends Sprite {

		public function Toolbar() {
			
			DrawToolBar();
			// constructor code
		}
		
		private function DrawToolBar()
		{
			this.graphics.beginFill(0x000000, 0.25);
			this.graphics.lineStyle(2,0x000000,1);
			this.graphics.drawRect(0,0,100,100);
		}

	}
	
}
