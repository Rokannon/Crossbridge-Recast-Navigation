package app.rccontext
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;
    import flash.utils.getTimer;

    import recastnavigation.recast.RCContext;

    public class CustomRCContext extends RCContext implements IEventDispatcher
    {
        private const _eventDispatcher:EventDispatcher = new EventDispatcher(this);
        private const _logCategoryNames:Vector.<String> = new <String>[
            "", "Progress", "Warning", "Error"
        ];
        private const _accumulatedTimes:Vector.<int> = new Vector.<int>();
        private const _startTimes:Vector.<int> = new Vector.<int>();

        public function CustomRCContext(state:Boolean = true)
        {
            super(state);
            _accumulatedTimes.fixed = false;
            _accumulatedTimes.length = 29;
            _accumulatedTimes.fixed = true;
            _startTimes.fixed = false;
            _startTimes.length = 29;
            _startTimes.fixed = true;
        }

        protected override function doResetLog():void
        {
            _eventDispatcher.dispatchEvent(new CustomRCContextEvent(CustomRCContextEvent.RESET));
        }

        protected override function doLog(logCategory:int, message:String):void
        {
            _eventDispatcher.dispatchEvent(new CustomRCContextEvent(CustomRCContextEvent.MESSAGE, logCategory,
                                                                    message));
        }

        protected override function doResetTimers():void
        {
            for (var i:int = _accumulatedTimes.length - 1; i >= 0; --i)
            {
                _accumulatedTimes[i] = 0;
            }
        }

        protected override function doStartTimer(timerLabel:int):void
        {
            _startTimes[timerLabel] = getTimer();
        }

        protected override function doStopTimer(timerLabel:int):void
        {
            _accumulatedTimes[timerLabel] += getTimer() - _startTimes[timerLabel];
        }

        protected override function doGetAccumulatedTime(timerLabel:int):int
        {
            return _accumulatedTimes[timerLabel] * 1000;
        }

        /* **************** **
         ** IEventDispatcher **
         ** **************** */

        public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0,
                                         useWeakReference:Boolean = false):void
        {
            _eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
        }

        public function dispatchEvent(event:Event):Boolean
        {
            return _eventDispatcher.dispatchEvent(event);
        }

        public function hasEventListener(type:String):Boolean
        {
            return _eventDispatcher.hasEventListener(type);
        }

        public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
        {
            _eventDispatcher.removeEventListener(type, listener, useCapture);
        }

        public function willTrigger(type:String):Boolean
        {
            return _eventDispatcher.willTrigger(type);
        }
    }
}