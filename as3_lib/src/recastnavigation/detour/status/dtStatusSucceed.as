package recastnavigation.detour.status
{
	import recastnavigation.detour.status.enum.DTStatus;

	/** Returns true of status is success. */
	public function dtStatusSucceed(status:int):Boolean
	{
		return (status & DTStatus.DT_SUCCESS) != 0;
	}
}