package;

import com.er453r.components.TestContainer;
import js.Browser;
import com.er453r.components.TestComponent;

class Main{
	public static function main() {
		js.Browser.document.addEventListener("DOMContentLoaded", function(event){
			var container:TestContainer = new TestContainer();

			Browser.document.body.appendChild(container.view);

			for(n in 0...10){
				var component:TestComponent = new TestComponent();

				container.appendTo(".content", component.view);
			}
		});
	}
}
