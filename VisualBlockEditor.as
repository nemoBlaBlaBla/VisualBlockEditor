package 
{
	import com.workspace.*;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	import com.ClosePopUp;
	import flash.display.*;

	public class VisualBlockEditor extends Sprite
	{
		private var _wt:Worktable = new Worktable();
		private var _messageLayer:Sprite = new Sprite();
		private var _tf:TextFormat = new TextFormat("Segoe UI Light",15,0xFFFFFF);
		private var _controlsLayer:Sprite = new Sprite();

		public function VisualBlockEditor()
		{
			InitWorkSpace();
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
		}

		private function InitWorkSpace()
		{
			_wt.y = 65;
			this.addChild(_wt);
			this.addChild(_messageLayer);
			
			this.addChild(_controlsLayer);
			_controlsLayer.graphics.beginFill(0xFF0000);
			_controlsLayer.graphics.drawRect(0, 0, 5000, 5000);
			_controlsLayer.alpha = 0;

			//ниже добавим обработчики для кнопок и двойного клика
			btnAddBlock.addEventListener(MouseEvent.CLICK, btnAddBlockClickHandler);
			btnGenerateCode.addEventListener(MouseEvent.CLICK, btnGenerateCodeClickHandler);
			btnInfo.addEventListener(MouseEvent.CLICK, InfoButtonClickHandler);
			btnAbout.addEventListener(MouseEvent.CLICK, AboutButtonClickHandler);
			_controlsLayer.doubleClickEnabled = true;
			_controlsLayer.addEventListener(MouseEvent.DOUBLE_CLICK, DoubleClickHandler);
			this.setChildIndex(_controlsLayer, 0);
		}

		private function btnAddBlockClickHandler(evt:MouseEvent):void
		{
			_wt.AddBlock(BlockSelectorCombo.selectedLabel);
		}

		private function btnGenerateCodeClickHandler(evt: MouseEvent)
		{
			_wt.GetGPSSCode();
		}

		private function InfoButtonClickHandler(evt:MouseEvent)
		{
			_messageLayer.removeChildren();
			var infoWindow:ClosePopUp = new ClosePopUp();
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
			aboutWindow.PopUpLabel.visible = false;
			aboutWindow.PopUpScroll.source = new About();
			aboutWindow.x = (stage.stageWidth / 2) - (aboutWindow.width / 2);
			aboutWindow.y = (stage.stageHeight / 2) - (aboutWindow.height / 2);
			_messageLayer.addChild(aboutWindow);
		}

		private function DoubleClickHandler(evt:MouseEvent)
		{
			if (this.stage.displayState == StageDisplayState.NORMAL)
			{
				this.stage.displayState = StageDisplayState.FULL_SCREEN;
			}
			else
			{
				this.stage.displayState = StageDisplayState.NORMAL;
			}
		}
	}
}