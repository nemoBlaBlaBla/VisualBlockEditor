package  {
	import flash.display.Sprite;
	import flash.text.TextField;
	import com.workspace.*;
	
	public class VisualBlockEditor extends Sprite{
		
		private var _txt:TextField = new TextField();
		private var _tb:Toolbar = new Toolbar();
		private var _wt:Worktable = new Worktable();
		
		

		public function VisualBlockEditor() {
			_txt.text = "SomeHelloWorld";
			this.addChild(_txt);
			this.addChild(_tb);
			this.addChild(_wt);
			_wt.x = _tb.x + _tb.width;
			_wt.y = _tb.y + _tb.height;
			trace(_txt.text);
		}

	}
	
}
