package com.er453r.components;

import haxe.Timer;

import com.er453r.hxcompo.Component;

class TestContainer extends Component {
	private var todos(null, set):Array<String>;

	function set_todos(value:Array<String>) {
		trace('set todods');

		return this.todos = value;
	}

	private var todo(null, set):String;

	function set_todo(value:String) {
		trace('set todod');

		return this.todo = value;
	}

	public function new():Void{
		var test:Array<UInt> = [1, 2, 3];

		var iter = test.iterator();

		trace(iter.next());

		var users = [{name:"Mark", age:30}, {name:"John", age:45}];

		var userTemplate = new haxe.Template("::foreach users:: ::name::(::age::) ::end::");
		var userOutput = userTemplate.execute({users: users});

		trace(userOutput);

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
