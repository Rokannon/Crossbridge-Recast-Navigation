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
// API
// ////

void _rcContext_alloc() __attribute__((used,
	annotate("as3sig:public function internal_rcContext_alloc(state:Boolean, obj:*):int"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcContext_alloc()
{
	bool state;
	AS3_GetScalarFromVar(state, state);

	AS3::local::var * obj = new AS3::local::var();
	AS3_GetVarxxFromVar(* obj, obj);

	AS3_Return(new rcContextAdapter(state, obj));
}

void _rcContext_enableLog() __attribute__((used,
	annotate("as3sig:public function internal_rcContext_enableLog(ctx_ptr:int, state:Boolean):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcContext_enableLog()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	bool state;
	AS3_GetScalarFromVar(state, state);

	ctx->enableLog(state);
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

	rcLogCategory logCategory;
	AS3_GetScalarFromVar(logCategory, logCategory);

	char * message;
	AS3_MallocString(message, message);

	ctx->log(logCategory, message);

	free(message);
}

void _rcContext_enableTimer() __attribute__((used,
	annotate("as3sig:public function internal_rcContext_enableTimer(ctx_ptr:int, state:Boolean):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcContext_enableTimer()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	bool state;
	AS3_GetScalarFromVar(state, state);

	ctx->enableTimer(state);
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

	rcTimerLabel timerLabel;
	AS3_GetScalarFromVar(timerLabel, timerLabel);

	ctx->startTimer(timerLabel);
}

void _rcContext_stopTimer() __attribute__((used,
	annotate("as3sig:public function internal_rcContext_stopTimer(ctx_ptr:int, timerLabel:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcContext_stopTimer()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcTimerLabel timerLabel;
	AS3_GetScalarFromVar(timerLabel, timerLabel);

	ctx->stopTimer(timerLabel);
}

void _rcContext_getAccumulatedTime() __attribute__((used,
	annotate("as3sig:public function internal_rcContext_getAccumulatedTime(ctx_ptr:int, timerLabel:int):int"),
	annotate("as3package:recastnavigation.internal_api")));

void _rcContext_getAccumulatedTime()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	rcTimerLabel timerLabel;
	AS3_GetScalarFromVar(timerLabel, timerLabel);

	AS3_Return(ctx->getAccumulatedTime(timerLabel));
}