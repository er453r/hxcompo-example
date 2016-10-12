package com.er453r;

import haxe.macro.Type.ClassType;
import haxe.macro.Context;
import haxe.macro.Expr;

class ComponentBuilder {
	private static inline var TARGET_SUPERCLASS:String = "com.er453r.Component";

	public static function build(file:String):Array<Field> {
		var classType:ClassType;
		switch (Context.getLocalType()) {
			case TInst(r, _):
				classType = r.get();
			case _:
		}

		var superClass:String;

		if(classType.superClass != null)
			superClass = classType.superClass.t.toString();

		if(superClass != TARGET_SUPERCLASS)
			Context.error('Class has to extend ${TARGET_SUPERCLASS}', Context.currentPos());

		var classString:String = Context.getLocalClass().toString();

		var parts:Array<String> = classString.split(".");
		parts.pop();
		var path:String = parts.join("/");

		var p = Context.resolvePath(path + "/" + file);

		var string:String = sys.io.File.getContent(p);

		var xml:Xml;

		try{
			xml = Xml.parse(string);

			var childrenCount:UInt = 0;

			var iterator:Iterator<Xml> = xml.elements();

			while(iterator.hasNext()){
				childrenCount++;
				iterator.next();
			}

			if(childrenCount != 1)
				Context.error('View File ${p} has to contain exactly 1 root node', Context.currentPos());
		}
		catch(err:String){
			Context.error('Error parsing file ${p}: ${err}', Context.currentPos());
		}

		var fields:Array<Field> = Context.getBuildFields();

		var hasConstructor:Bool = false;

		for(field in fields){
			if(field.name == "new"){
				hasConstructor = true;

				break;
			}
		}

		if(!hasConstructor){
			fields.push({name: 'new', doc: null, access: [Access.APublic], kind: FieldType.FFun({
				params : [],
				args : [],
				expr: macro {},
				ret : macro : Void
			}), pos: Context.currentPos()});
		}

		for(field in fields){
			if(field.name == "new"){
				switch(field.kind){
					case FFun(func):{
						func.expr = macro {
							buildFromString(this.contents);
							${func.expr};
						};
					}

					default: {}
				}
			}
		}

		fields.push({name: 'contents', doc: null, access: [Access.APrivate], kind: FieldType.FVar(macro:String, macro $v{string}), pos: Context.currentPos()});

		return fields;
	}
}
