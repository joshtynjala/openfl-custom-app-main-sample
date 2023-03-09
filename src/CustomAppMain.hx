import openfl.display.Sprite;
import openfl.text.TextFormat;
import openfl.text.TextField;

class CustomAppMain extends Sprite {
	public function new() {
		super();
		var textField = new TextField();
		textField.defaultTextFormat = new TextFormat("_sans", 20, 0x000000);
		textField.autoSize = LEFT;
		textField.text = "This application uses a customized haxe/ApplicationMain.hx template file";
		addChild(textField);
	}
}