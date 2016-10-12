package com.er453r;

import js.html.Element;
import js.Browser;

class Component {
	public var view(default, null):Element;

	private function buildFromString(html:String):Void{
		var template:TemplateElement = cast Browser.document.createElement("template");

		template.innerHTML = html;

		view = cast template.content.firstChild;
	}

	public function find(selector:String):Element{
		return view.querySelector(selector);
	}

	public function appendTo(selector:String, element:Element):Void{
		find(selector).appendChild(element);
	}
}
