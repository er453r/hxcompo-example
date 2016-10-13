package com.er453r.components;

import haxe.Timer;

import com.er453r.hxcompo.Component;

class TestContainer extends Component {
	public function new():Void{
		var component:TestComponent = new TestComponent();

		for(n in 0...10){
			component = new TestComponent();

			append(component);
		}

		Timer.delay(function(){
			remove(component);
		}, 2000);
	}
}
