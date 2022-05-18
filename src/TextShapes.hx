import openfl.text.TextField;
import openfl.text.TextFormat;

class TextShapes extends TextField
{
	public function new(x:Int, y:Int, width:Int, height:Int, insertText:String)
	{
		super();

		var inputTextFormat = new TextFormat();
		inputTextFormat.leftMargin = 10;
		inputTextFormat.rightMargin = 10;
		inputTextFormat.size = 18;

		this.border = true;
		this.background = true;
		this.backgroundColor = 0xf0f0f0;
		this.x = x;
		this.y = y;
		this.height = height;
		this.width = width;
		this.autoSize = "none";
		this.htmlText = insertText;
		this.setTextFormat(inputTextFormat);
	}
}