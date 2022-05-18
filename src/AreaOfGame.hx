import openfl.display.Sprite;

class AreaOfGame extends Sprite
{
	public function new(x:Int, y:Int, width:Int, height:Int, color:Int)
	{
		super();

		this.graphics.beginFill(color);
		this.graphics.drawRect(x, y, width, height);
		this.graphics.endFill();
	}
}