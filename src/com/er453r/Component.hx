package com.er453r;

import js.Browser;
import js.html.DOMElement;

class Component {
	public var view(default, null):DOMElement;

	private function buildFromString(html:String):Void{
		var template:TemplateElement = cast Browser.document.createElement("template");

		template.innerHTML = html;

		view = cast template.content.firstChild;
	}
}
