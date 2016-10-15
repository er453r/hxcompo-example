package com.er453r.components;

import haxe.Timer;

import com.er453r.hxcompo.Component;

class TestContainer extends Component {
	private var todos:Array<String>;
	private var todo:String;

	public function new():Void{
		var component:TestComponent = new TestComponent();

		for(n in 0...3){
			component = new TestComponent();

			append(component);
		}

		title.innerHTML = "ready...";

		todos = ['eat', 'sleep', 'play', 'repeat'];
		todo = 'work';

		Timer.delay(function(){
			remove(component);

			title.innerHTML = "GO!";

			todo = 'sleep';
		}, 2000);
	}
}
