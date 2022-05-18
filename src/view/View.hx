package view;
import haxe.Timer;
import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.events.MouseEvent;
import openfl.events.Event;
import openfl.display.Shape;
import controller.Controller;


class View extends Sprite {
    private var controller:Controller;

	private var rect:AreaOfGame;
	private var contX:Int;
	private var contY:Int;
	private var containerWidth:Int;
	private var containerHeight:Int;
	private var timer:Timer;

	private var touchMove:Bool = true;

	private var numberOfShapesText:TextShapes;

	private var randName:Int;
	private var randColor:Int;

    private var numberOfShapesView:Int;
    private var gravityView:Float;
    private var shapes:Array<String>;
    private var colors:Array<Int>;
	public var dataView:Dynamic;
	private var previousUpdateTime:Float; 

	public function new(controller) {
		super();
		this.controller = controller;
        move();
	}

	public function move(){
		var stage = new Stage(1600, 800, 0xffffff);
        js.Browser.document.body.appendChild(stage.element);

		containerWidth = 1000;
		containerHeight =1000;
		contX = 400;
		contY = -100;

		rect = new AreaOfGame(contX, contY, containerWidth, containerHeight, 0x6464ff);
		stage.addChild(rect);
	
		var textWidth = 250;
		var textHeight = 30;
		numberOfShapesText = new TextShapes(contX, 0, textWidth, textHeight, "<div>Number of shapes: </div>");
		stage.addChild(numberOfShapesText);
		stage.addEventListener(Event.ENTER_FRAME, startFall);

	}

	public function render(data):Void
	{
		numberOfShapesView = data.numberOfShapes; 
		gravityView = data.gravity;
		shapes = data.shapes; 
		colors = data.colors; 

		dataView = {
			numberOfShapes: data.numberOfShapes,
			gravity: data.gravity,
			shapes : data.shapes,
            colors : data.colors
      
		};

		previousUpdateTime = Date.now().getTime();

		rect.addEventListener(MouseEvent.MOUSE_DOWN, addNewShapeToContainer);
		rect.addEventListener(MouseEvent.MOUSE_UP, free);
	}

	private function createShape(x:Int, y:Int, shape:String):Dynamic {
	
		var fallingShape = new FallingShapes(shape, colors[randColor]);
		
		fallingShape.x = x;
		fallingShape.y = y;


		fallingShape.speed = 0.001*Math.random();

		rect.addChild(fallingShape);

		fallingShape.addEventListener(MouseEvent.MOUSE_DOWN, removeShape);
		fallingShape.addEventListener(MouseEvent.MOUSE_UP, free);
		return fallingShape;


	}
	private function plusShape(shapeNumber:Int):Int{
		numberOfShapesText.htmlText = "<div>Number of shapes: </div>";
		numberOfShapesText.appendText(Std.string(rect.numChildren));
		dataView = updateDataView(rect.numChildren, shapeNumber);
		return dataView;
	}
	
	private function minusShape(figure:FallingShapes):Int{
		var shapeNumber = 0;

		figure.removeEventListener(MouseEvent.MOUSE_DOWN, removeShape);
		rect.removeChild(figure);
	
		numberOfShapesText.htmlText = "<div>Number of shapes: </div>";
		numberOfShapesText.appendText(Std.string(rect.numChildren));

		dataView = updateDataView(rect.numChildren, shapeNumber);
		return dataView;
	}

	public function updateDataView(numbS:Int, area:Int, ?gravityView:Float):Dynamic
	{
		dataView.numberOfShapes = numbS;
		dataView.summaryArea = area;
		dataView.gravity = gravityView;
		return dataView;
	}


	private function startFall(event:Event):Void {
		var time = Date.now().getTime();
		if (time - previousUpdateTime > 1000){
			randName = Math.round(Math.random() * (shapes.length - 1));
			randColor = Math.round(Math.random() * (colors.length - 1));
			var xTop = Math.round(contX + Math.random() * (containerWidth - 100));
			var yTop = contY;
			dataView = createShape(xTop, yTop, shapes[randName]);
			this.controller.setData(dataView);

			previousUpdateTime = time;
		}
		
		var rectNumChildren:Int = rect.numChildren;
		var i:Int = 0;
		for (i in 0...rectNumChildren) {
			var figure = cast(rect.getChildAt(i), FallingShapes);
			figure.y += figure.speed;
			figure.speed += gravityView;

			if (figure.y >= containerHeight-100) {
				minusShape(figure);
				break;
			}
		}
	}

	private function addNewShapeToContainer(event:MouseEvent):Void {
		if (touchMove) {
			var clickedX:Int = Math.round(event.localX);
			var clickedY:Int = Math.round(event.localY);
			createShape(clickedX, clickedY, "default");
			// touchMove = false;
		}
	}

	private function free(event:MouseEvent):Void {
		touchMove = true;
	}

	private function removeShape(e:Dynamic):Void {
		if (touchMove) {
			minusShape(e.target);			
			touchMove = false;
		}
 	}
}