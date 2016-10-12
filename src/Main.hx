package;

import haxe.Timer;
import com.er453r.components.TestContainer;
import js.Browser;
import com.er453r.components.TestComponent;

class Main{
	public static function main() {
		js.Browser.document.addEventListener("DOMContentLoaded", function(event){
			var container:TestContainer = new TestContainer();

			Browser.document.body.appendChild(container.view);

			var component:TestComponent = new TestComponent();

			for(n in 0...10){
				component = new TestComponent();

				container.append(component);
			}

			Timer.delay(function(){
				container.remove(component);
			}, 2000);
		});
	}
}
