package recastnavigation.detour.status {
	
	import recastnavigation.detour.status.enum.DTStatus;
	
	/** Returns true of status is in progress. */
	public function dtStatusInProgress(status:int):Boolean {
		
		return (status & DTStatus.DT_IN_PROGRESS) != 0;
		
	}
	
}