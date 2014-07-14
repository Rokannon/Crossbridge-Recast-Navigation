#include <stdlib.h>
#include <AS3\AS3.h>
#include <AS3\AS3++.h>
#include <Recast.h>
#include <RecastAlloc.h>
#include <RecastAssert.h>

class rcContextAdapter : public rcContext
{
	AS3::local::var * m_obj;
public:
	rcContextAdapter(bool state, AS3::local::var * obj) : rcContext(state)
	{
		m_obj = obj;
	}
	~rcContextAdapter()
	{
		free(m_obj);
	}
protected:
	void doResetLog()
	{
		AS3_DeclareVar(obj, *);
		AS3_CopyVarxxToVar(obj, *m_obj);

		inline_as3("obj.doResetLog();");
	}
	void doLog(const rcLogCategory ctg, const char * msg, const int len)
	{
		AS3_DeclareVar(obj, *);
		AS3_CopyVarxxToVar(obj, * m_obj);

		AS3_DeclareVar(category, int);
		AS3_CopyScalarToVar(category, (int) ctg);

		AS3_DeclareVar(message, String);
		AS3_CopyCStringToVar(message, msg, len);

		inline_as3("obj.doLog(category, message);");
	}
	void doResetTimers()
	{
		AS3_DeclareVar(obj, *);
		AS3_CopyVarxxToVar(obj, *m_obj);

		inline_as3("obj.doResetTimers();");
	}
	void doStartTimer(const rcTimerLabel lbl)
	{
		AS3_DeclareVar(obj, *);
		AS3_CopyVarxxToVar(obj, *m_obj);

		AS3_DeclareVar(label, int);
		AS3_CopyScalarToVar(label, (int) lbl);

		inline_as3("obj.doStartTimer(label);");
	}
	void doStopTimer(const rcTimerLabel lbl)
	{
		AS3_DeclareVar(obj, *);
		AS3_CopyVarxxToVar(obj, *m_obj);

		AS3_DeclareVar(label, int);
		AS3_CopyScalarToVar(label, (int) lbl);

		inline_as3("obj.doStopTimer(label);");
	}
	int doGetAccumulatedTime(const rcTimerLabel lbl) const 
	{
		AS3_DeclareVar(obj, *);
		AS3_CopyVarxxToVar(obj, *m_obj);

		AS3_DeclareVar(label, int);
		AS3_CopyScalarToVar(label, (int)lbl);
	}
};

// ////
// ALLOC
// ////

void _rcAlloc_rcContext() __attribute__((used,
	annotate("as3sig:public function internal_rcAlloc_rcContext(state:Boolean, obj:*):int"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcAlloc_rcContext()
{
	bool _state;
	AS3_GetScalarFromVar(_state, state);

	AS3::local::var * _obj = new AS3::local::var();
	AS3_GetVarxxFromVar(* _obj, obj);

	AS3_Return(new rcContextAdapter(_state, _obj));
}

// ////
// API
// ////

void _rcContext_enableLog() __attribute__((used,
	annotate("as3sig:public function internal_rcContext_enableLog(ctx_ptr:int, state:Boolean):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcContext_enableLog()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	bool _state;
	AS3_GetScalarFromVar(_state, state);

	ctx->enableLog(_state);
}

void _rcContext_resetLog() __attribute__((used,
	annotate("as3sig:public function internal_rcContext_resetLog(ctx_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcContext_resetLog()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	ctx->resetLog();
}

void _rcContext_log() __attribute__((used,
	annotate("as3sig:public function internal_rcContext_log(ctx_ptr:int, logCategory:int, message:String):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcContext_log()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcLogCategory _logCategory;
	AS3_GetScalarFromVar(_logCategory, logCategory);

	char * _message;
	AS3_MallocString(_message, message);

	ctx->log(_logCategory, _message);

	free(_message);
}

void _rcContext_enableTimer() __attribute__((used,
	annotate("as3sig:public function internal_rcContext_enableTimer(ctx_ptr:int, state:Boolean):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcContext_enableTimer()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	bool _state;
	AS3_GetScalarFromVar(_state, state);

	ctx->enableTimer(_state);
}

void _rcContext_resetTimers() __attribute__((used,
	annotate("as3sig:public function internal_rcContext_resetTimers(ctx_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcContext_resetTimers()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	ctx->resetTimers();
}

void _rcContext_startTimer() __attribute__((used,
	annotate("as3sig:public function internal_rcContext_startTimer(ctx_ptr:int, timerLabel:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcContext_startTimer()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcTimerLabel _timerLabel;
	AS3_GetScalarFromVar(_timerLabel, timerLabel);

	ctx->startTimer(_timerLabel);
}

void _rcContext_stopTimer() __attribute__((used,
	annotate("as3sig:public function internal_rcContext_stopTimer(ctx_ptr:int, timerLabel:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcContext_stopTimer()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcTimerLabel _timerLabel;
	AS3_GetScalarFromVar(_timerLabel, timerLabel);

	ctx->stopTimer(_timerLabel);
}

void _rcContext_getAccumulatedTime() __attribute__((used,
	annotate("as3sig:public function internal_rcContext_getAccumulatedTime(ctx_ptr:int, timerLabel:int):int"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcContext_getAccumulatedTime()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcTimerLabel _timerLabel;
	AS3_GetScalarFromVar(_timerLabel, timerLabel);

	int time;
	time = ctx->getAccumulatedTime(_timerLabel);
	AS3_Return(time);
}