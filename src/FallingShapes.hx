import openfl.display.Sprite;
import openfl.display.*;

class FallingShapes extends Sprite{
    private var triangleHeight = Math.floor(Math.random() * 210);
    private var rectHeightArea = Math.floor(Math.random() * 200);
	private var rectWidhtArea = Math.floor(Math.random() * 260);
    public var speed:Float = 0.00001;
	public var area:Int = 0;
    public function new(name:String, color:Int){
        super();
		var r = 50; 

		this.name =name;

        switch (name){

            case "circle":
				this.graphics.beginFill(color);
				this.graphics.lineStyle(1, 0x000000);
				this.graphics.drawCircle(r, r, r);
				this.area = Math.round(Math.PI * r* r/2);

                case "elipse":
				this.graphics.beginFill(color);
				this.graphics.lineStyle(1, 0x000000);
				this.graphics.drawEllipse(0, 0, 1.5 * r*2, r*2);
				this.area = Math.round(Math.PI * 1.5* r* r);

                case "triangle":
                    this.graphics.beginFill(color);
                    this.graphics.lineStyle(2, 0x000000);
		            this.graphics.moveTo(triangleHeight / 2, 0);
		            this.graphics.lineTo(-60, 0);
		            this.graphics.lineTo(0, triangleHeight);
                    this.area= Math.floor((triangleHeight * triangleHeight) / 1.73);
                    case "rectangle":
                    this.graphics.beginFill(color);
                    this.graphics.drawRect(0, 0, rectHeightArea, rectWidhtArea);
                    this.area=rectHeightArea * rectWidhtArea;

                    default:
                       
                        this.graphics.beginFill(color);
                        this.graphics.lineStyle(2, 0x000000);
                        this.graphics.moveTo(triangleHeight / 2, 0);
                        this.graphics.lineTo(-60, 0);
                        this.graphics.lineTo(0, triangleHeight);
                        this.area= Math.floor((triangleHeight * triangleHeight) / 1.73);
                        

        }

        
    }

}
