package recastnavigation.core.utils {
	
	public function readBits(src:int, offset:int, length:int):int {
		
		return (src >> offset) & ((1 << length) - 1);
		
	}
	
}