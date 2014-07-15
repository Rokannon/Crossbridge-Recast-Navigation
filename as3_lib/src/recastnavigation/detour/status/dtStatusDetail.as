package recastnavigation.detour.status {
	
	/** Returns true if specific detail is set. */
	public function dtStatusDetail(status:int, detail:int):Boolean {
		
		return (status & detail) != 0;
		
	}
	
}