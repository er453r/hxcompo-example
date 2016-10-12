package com.er453r;

import haxe.macro.Context;
import haxe.macro.Expr;

class ComponentBuilder {
	public static function build(viewPath:String):Array<Field> {
		var p = Context.resolvePath(viewPath);

		var string:String = sys.io.File.getContent(p);

		var xml:Xml;

		try{
			xml = Xml.parse(string);
		}
		catch(err:String){
			Context.error('Error parsing file ${p}: ${err}', Context.currentPos());
		}

		var fields:Array<Field> = Context.getBuildFields();

		fields.push({name: 'contents', doc: null, access: [Access.APrivate], kind: FieldType.FVar(macro:String, macro $v{string}), pos: Context.currentPos()});

		return fields;
	}
}
