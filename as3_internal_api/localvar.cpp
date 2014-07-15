#include <stdlib.h>
#include <AS3\AS3.h>
#include <AS3\AS3++.h>

void _localvar_alloc() __attribute__((used,
	annotate("as3sig:public function internal_localvar_alloc():int"),
	annotate("as3package:recastnavigation.internal_api")));

void _localvar_alloc()
{
	AS3_Return(new AS3::local::var());
}

void _localvar_set() __attribute__((used,
	annotate("as3sig:public function internal_localvar_set(var_ptr:int, obj:Object):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _localvar_set()
{
	AS3::local::var * var;
	AS3_GetScalarFromVar(var, var_ptr);
	AS3_GetVarxxFromVar(*var, obj);
}

void _localvar_get() __attribute__((used,
	annotate("as3sig:public function internal_localvar_get(var_ptr:int):Object"),
	annotate("as3package:recastnavigation.internal_api")));

void _localvar_get()
{
	AS3::local::var * var;
	AS3_GetScalarFromVar(var, var_ptr);
	AS3_DeclareVar(obj, Object);
	AS3_CopyVarxxToVar(obj, *var);
	AS3_ReturnAS3Var(obj);
}