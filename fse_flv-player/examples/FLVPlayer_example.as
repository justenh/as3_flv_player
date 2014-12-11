package {
	
	import com.fse.media.video.FLVPlayer;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * 
	 * @author Justen Holter
	 */
	public class FLVPlayer_example extends Sprite {
		
		private var _player	:FLVPlayer;
		
		public var $txtProgress	:TextField
		public var $txtStatus	:TextField
		public var $btnPlay		:MovieClip;
		public var $btnPause	:MovieClip;
		public var $btnRewind	:MovieClip;
		
		public function FLVPlayer_example() {
			
			super();
			
			_player = new FLVPlayer(720, 480);
			_player.play("flvs/16x9_720x405.flv");
			_player.addEventListener(Event.CHANGE, playerChange);
			addChildAt(_player, 0);
			
			$btnPlay.addEventListener(MouseEvent.CLICK, btnPlayClick);
			$btnPause.addEventListener(MouseEvent.CLICK, btnPauseClick);
			$btnRewind.addEventListener(MouseEvent.CLICK, btnRewindClick);
			
			$txtStatus.text = "";
		}
		
		private function btnPlayClick(event:MouseEvent):void {
			_player.resume();
		}
		
		private function btnPauseClick(event:MouseEvent):void {
			_player.pause();
		}
		
		private function btnRewindClick(event:MouseEvent):void {
			
		}
		
		private function playerChange(event:Event):void {
			
			$txtProgress.text = "";
			$txtProgress.appendText("\n" + _player.loadProgress + " (" + _player.loadProgress * 100 + "%)");
			$txtProgress.appendText("\n" + _player.playheadProgress + " (" + _player.playheadProgress * 100 + "%)");
			
			log("change");
		}
		
		private function log(text:String):void {
			
			$txtStatus.appendText($txtStatus.numLines + ". " + text + "\n");
			$txtStatus.scrollV = $txtStatus.numLines;
		}
	}
}