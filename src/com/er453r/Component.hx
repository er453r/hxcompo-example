package com.er453r;

import js.html.Element;
import js.Browser;

class Component {
	private static inline var CONTENT_SELECTOR:String = ".content";

	public var view(default, null):Element;

	private var children(default, null):Array<Component> = [];

	private function buildFromString(html:String):Void{
		var template:TemplateElement = cast Browser.document.createElement("template");

		template.innerHTML = html;

		view = cast template.content.firstChild;
	}

	private function find(selector:String):Element{
		return view.querySelector(selector);
	}

	private function appendTo(selector:String, element:Element):Void{
		find(selector).appendChild(element);
	}

	public function append(component:Component):Void{
		find(CONTENT_SELECTOR).appendChild(component.view);

		children.push(component);
	}

	public function remove(component:Component):Void{
		component.view.remove();

		children.remove(component);
	}
}
