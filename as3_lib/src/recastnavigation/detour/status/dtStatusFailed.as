package recastnavigation.detour.status
{
    import recastnavigation.detour.status.enum.DTStatus;

    /** Returns true of status is failure. */
    public function dtStatusFailed(status:int):Boolean
    {
        return (status & DTStatus.DT_FAILURE) != 0;
    }
}