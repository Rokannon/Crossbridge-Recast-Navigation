package recastnavigation.detour.crowd {
	
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.CModule;
	
	use namespace rn_internal;
	
	public class DTCrowdAgentDebugInfo extends RNBase {
		
		rn_internal static var SIZE					:int = 0;
		rn_internal static const OFFSET_IDX			:int = offset(4);
		rn_internal static const OFFSET_OPT_START	:int = offset(12);
		rn_internal static const OFFSET_OPT_END		:int = offset(12);
		rn_internal static const OFFSET_VOD			:int = offset(4);
		
		private static function offset(size:int):int { return (SIZE += size) - size; }
		
		public function get idx():int { return CModule.read32(ptr + OFFSET_IDX); }
		public function set idx(value:int):void { CModule.write32(ptr + OFFSET_IDX, value); }
		
		public function get optStartX():Number { return CModule.readFloat(ptr + OFFSET_OPT_START); }
		public function set optStartX(value:Number):void { CModule.writeFloat(ptr + OFFSET_OPT_START, value); }
		
		public function get optStartY():Number { return CModule.readFloat(ptr + OFFSET_OPT_START + 4); }
		public function set optStartY(value:Number):void { CModule.writeFloat(ptr + OFFSET_OPT_START + 4, value); }
		
		public function get optStartZ():Number { return CModule.readFloat(ptr + OFFSET_OPT_START + 8); }
		public function set optStartZ(value:Number):void { CModule.writeFloat(ptr + OFFSET_OPT_START + 8, value); }
		
		public function get optEndX():Number { return CModule.readFloat(ptr + OFFSET_OPT_END); }
		public function set optEndX(value:Number):void { CModule.writeFloat(ptr + OFFSET_OPT_END, value); }
		
		public function get optEndY():Number { return CModule.readFloat(ptr + OFFSET_OPT_END + 4); }
		public function set optEndY(value:Number):void { CModule.writeFloat(ptr + OFFSET_OPT_END + 4, value); }
		
		public function get optEndZ():Number { return CModule.readFloat(ptr + OFFSET_OPT_END + 8); }
		public function set optEndZ(value:Number):void { CModule.writeFloat(ptr + OFFSET_OPT_END + 8, value); }
		
	}
	
}