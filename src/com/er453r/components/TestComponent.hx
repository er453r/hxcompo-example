package com.er453r.components;

import js.html.Node;
import js.html.Element;
import js.Browser;

@:build(com.er453r.ComponentBuilder.build('TestView.html'))
class TestComponent {
	public function new() {
		trace(this.contents);
	}

	public function htmlToElements():Node{
		var template:TemplateElement = cast Browser.document.createElement("template");

		template.innerHTML = this.contents;

		trace(template.content.firstChild);

		return template.content.firstChild;
	}
}
