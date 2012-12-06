package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import com.workspace.*;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import fl.controls.Button;
	import flash.text.TextFormat;
	
	import flash.display.MovieClip;
	import fl.controls.Label;
	import flash.display.StageScaleMode;

	public class VisualBlockEditor extends Sprite
	{

		private var _tb:Toolbar;
		private var _wt:Worktable;
		
		private var _btnbtn:Button = new Button();
		
		private var _tf:TextFormat = new TextFormat("Segoe UI Light", 15, 0xFFFFFF);

		private var _counter:int = 0;

		public function VisualBlockEditor()
		{
			InitWorkSpace();
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			MyAddItem.addEventListener(MouseEvent.CLICK, AddItemClick);
		}

		private function InitWorkSpace()
		{

			trace("width: " + this.width);
			trace("height: " + this.height);
		}

		private function fl_MouseClickHandler(event:MouseEvent):void
		{
			_counter++;
			trace(_counter + " sometext");
		}
		
		private function AddItemClick(evt:MouseEvent):void
		{
			trace("Added!!!");
			MyWorkTable.AddBlock();
			//MyAddItem.label = MyTextInput.text;
		}

	}

}