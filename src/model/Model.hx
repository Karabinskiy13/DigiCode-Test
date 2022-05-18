
package model;

class Model {
    public var numberOfShapes:Int;
    public var gravity:Float;
    public var shapes:Array<String>;
    public var colors:Array<Int>;
    public var data:Dynamic;

    public function new(?numberOfShapes:Int)
    {
        this.data = { 
            numberOfShapes : 0,
            gravity : 0.005,
            shapes : ["circle", "elipse", "triangle", "rectangle"],
            colors : [0xff0000, 0x00ff00, 0x0000ff, 0x00ffff, 0xffff00]
        };
    }
}
