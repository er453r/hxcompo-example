package com.er453r;

import Array;
import haxe.macro.Context;
import haxe.macro.Expr;

class ComponentBuilder {
	public static function build(file:String):Array<Field> {
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

		fields.push({name: 'contents', doc: null, access: [Access.APrivate], kind: FieldType.FVar(macro:String, macro $v{string}), pos: Context.currentPos()});

		return fields;
	}
}
