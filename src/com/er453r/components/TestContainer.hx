package com.er453r.components;

import js.html.Element;
import Type;
import haxe.Timer;

import com.er453r.hxcompo.Component;

class TestContainer extends Component {
	public function new():Void{
		var component:TestComponent = new TestComponent();

		for(n in 0...10){
			component = new TestComponent();

			append(component);
		}

		var title:Element = this.title;
		title.innerHTML = "ready...";

		Timer.delay(function(){
			remove(component);

			title.innerHTML = "GO!";
		}, 2000);

		trace(Type.getClass(this.title));
	}
}
