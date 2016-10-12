package;

import com.er453r.components.TestComponent;
import com.er453r.TestClass;

class Main{
	public static function main() {
		var test:TestClass = new TestClass();

		trace(test.publicVar);

		var component:TestComponent = new TestComponent();

		trace(component);
	}
}
