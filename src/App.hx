import view.View;
import model.Model;
import controller.Controller;

class App {
    
    static public function main():Void {
       
        var model = new Model();

        var controller = new Controller(model);

        controller.fallShapes();
	}
}