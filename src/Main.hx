package;

import js.Browser;
import com.er453r.components.TestComponent;

class Main{
	public static function main() {
		js.Browser.document.addEventListener("DOMContentLoaded", function(event){
			var component:TestComponent = new TestComponent();

			Browser.document.body.appendChild(component.view);
		});
	}
}
