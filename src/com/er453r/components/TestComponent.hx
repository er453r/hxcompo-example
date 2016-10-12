package com.er453r.components;

import js.html.Node;
import js.html.Element;
import js.Browser;

@:build(com.er453r.ComponentBuilder.build('TestView.html'))
class TestComponent {
	private var node:Node;

	public function new(){}

	public function htmlToElements():Node{
		var template:TemplateElement = cast Browser.document.createElement("template");

		template.innerHTML = this.contents;

		node = template.content.firstChild;

		return node;
	}
}
