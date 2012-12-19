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
	import fl.controls.ComboBox;
	import flash.display.StageAlign;
	import com.ClosePopUp;

	public class VisualBlockEditor extends Sprite
	{

		private var _tb:Toolbar;
		private var _wt:Worktable = new Worktable();
		
		private var _messageLayer:Sprite = new Sprite();
		
		private var _btnbtn:Button = new Button();
		
		private var _myCombo:ComboBox = new ComboBox();
		
		private var _tf:TextFormat = new TextFormat("Segoe UI Light", 15, 0xFFFFFF);

		private var _counter:int = 0;

		public function VisualBlockEditor()
		{
			InitWorkSpace();
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			stage.align = StageAlign.TOP_LEFT;
			
			trace("fullScreenHeight: " + stage.stageHeight);
			trace("fullScreenHeight: " + stage.stageWidth);
			
			MyAddItem.addEventListener(MouseEvent.CLICK, AddItemClick);
			GenerateButton.addEventListener(MouseEvent.CLICK, GenerateButtonClick);
			btnInfo.addEventListener(MouseEvent.CLICK, InfoButtonClickHandler);
			btnAbout.addEventListener(MouseEvent.CLICK, AboutButtonClickHandler)
			
			this.addChild(_messageLayer);
		}

		private function InitWorkSpace()
		{
			trace("width: " + this.width);
			trace("height: " + this.height);
			_wt.y = 65;
			this.addChild(_wt);
		}

		private function fl_MouseClickHandler(event:MouseEvent):void
		{
			_counter++;
			trace(_counter + " sometext");
		}
		
		private function AddItemClick(evt:MouseEvent):void
		{
			trace("Added!!!");
			_wt.AddBlock(BlockSelectorCombo.selectedLabel);
		}
		
		private function GenerateButtonClick(evt: MouseEvent)
		{
			_wt.GetGPSSCode();
		}

		private function InfoButtonClickHandler(evt:MouseEvent)
		{
			_messageLayer.removeChildren();
			var infoWindow:ClosePopUp = new ClosePopUp();
			//infoWindow.PopUpLabel.text = "info";
			infoWindow.PopUpLabel.visible = false;
			infoWindow.PopUpScroll.source = new Info();
			infoWindow.x = (stage.stageWidth / 2) - (infoWindow.width / 2);
			infoWindow.y = (stage.stageHeight / 2) - 150;
			_messageLayer.addChild(infoWindow);
			
		}
		
		private function AboutButtonClickHandler(evt:MouseEvent)
		{
			_messageLayer.removeChildren();
			var aboutWindow:ClosePopUp = new ClosePopUp();
			//aboutWindow.PopUpLabel.text = "about";
			aboutWindow.PopUpLabel.visible = false;
			aboutWindow.PopUpScroll.source = new About();
			aboutWindow.x = (stage.stageWidth / 2) - (aboutWindow.width / 2);
			aboutWindow.y = (stage.stageHeight / 2) - (aboutWindow.height / 2);
			_messageLayer.addChild(aboutWindow); //new super comment
		}
	}
}