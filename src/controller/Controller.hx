package controller;

import model.Model;
import view.View;
class Controller {
    var model:model.Model;
    var view:view.View;

    public function new(model) { 
        this.view = new View(this);
        this.model = model;
    }

    public function fallShapes():Void{
        this.view.render(this.model.data);


    }

    public function setData(data){
        this.model.data = data;
    }
}