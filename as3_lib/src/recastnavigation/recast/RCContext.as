package recastnavigation.recast {
	
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.rcAlloc_rcContext;
	import recastnavigation.internal_api.rcContext_enableLog;
	import recastnavigation.internal_api.rcContext_enableTimer;
	import recastnavigation.internal_api.rcContext_getAccumulatedTime;
	import recastnavigation.internal_api.rcContext_log;
	import recastnavigation.internal_api.rcContext_resetLog;
	import recastnavigation.internal_api.rcContext_resetTimers;
	import recastnavigation.internal_api.rcContext_startTimer;
	import recastnavigation.internal_api.rcContext_stopTimer;
	import recastnavigation.internal_api.rcFree;
	
	use namespace rn_internal;
	
	/**
	 * Provides an interface for optional logging and 
	 * performance tracking of the Recast build process.
	 */
	public class RCContext extends RNBase {
		
		private const _obj:Object = new Object();
		
		private var _state:Boolean;
		
		public function RCContext(state:Boolean = true) {
			
			super();
			
			_state = state;
			_obj.doResetLog = doResetLog;
			_obj.doLog = doLog;
			_obj.doResetTimers = doResetTimers;
			_obj.doStartTimer = doStartTimer;
			_obj.doStopTimer = doStopTimer;
			_obj.doGetAccumulatedTimer = doGetAccumulatedTime;
			
		}
		
		public override function alloc():void {
			
			ptr = recastnavigation.internal_api.rcAlloc_rcContext(_state, _obj);
			
		}
		
		public override function free():void {
			
			recastnavigation.internal_api.rcFree(ptr);
			ptr = 0;
			
		}
		
		/**
		 * Enables or disables logging.
		 */
		public final function enableLog(state:Boolean):void {
			
			_state = state;
			recastnavigation.internal_api.rcContext_enableLog(ptr, state);
			
		}
		
		/**
		 * Clears all log entries.
		 */
		public final function resetLog():void {
			
			recastnavigation.internal_api.rcContext_resetLog(ptr);
			
		}
		
		/**
		 * Logs a message.
		 */
		public final function log(logCategory:int, message:String):void {
			
			recastnavigation.internal_api.rcContext_log(ptr, logCategory, message);
			
		}
		
		/**
		 * Enables or disables the performance timers.
		 */
		public final function enableTimer(state:Boolean):void {
			
			recastnavigation.internal_api.rcContext_enableTimer(ptr,state);
			
		}
		
		/**
		 * Clears all peformance timers. (Resets all to unused.)
		 */
		public final function resetTimers():void {
			
			recastnavigation.internal_api.rcContext_resetTimers(ptr);
			
		}
		
		/**
		 * Starts the specified performance timer.
		 */
		public final function startTimer(timerLabel:int):void {
			
			recastnavigation.internal_api.rcContext_startTimer(ptr, timerLabel);
			
		}
		
		/**
		 * Stops the specified performance timer.
		 */
		public final function stopTimer(timerLabel:int):void {
			
			recastnavigation.internal_api.rcContext_stopTimer(ptr, timerLabel);
			
		}
		
		/**
		 * Returns the total accumulated time of the specified performance timer.
		 */
		public final function getAccumulatedTime(timerLabel:int):int {
			
			return recastnavigation.internal_api.rcContext_getAccumulatedTime(ptr, timerLabel);
			
		}
		
		protected function doResetLog():void {
			
		}
		
		protected function doLog(logCategory:int, message:String):void {
			
		}
		
		protected function doResetTimers():void {
			
		}
		
		protected function doStartTimer(timerLabel:int):void {
			
		}
		
		protected function doStopTimer(timerLabel:int):void {
			
		}
		
		protected function doGetAccumulatedTime(timerLabel:int):int {
			
			return -1;
			
		}
		
	}
	
}