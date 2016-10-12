package com.er453r.components;

@:build(com.er453r.ComponentBuilder.build('com/er453r/components/TestView.html'))
class TestComponent {
	public function new() {
		trace(this.contents);
	}
}
