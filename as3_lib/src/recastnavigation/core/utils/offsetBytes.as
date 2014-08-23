package recastnavigation.core.utils
{
    import recastnavigation.core.rn_internal;

    use namespace rn_internal;

    public function offsetBytes(size:int, structClass:Class):int
    {
        return (structClass["SIZE"] += size) - size;
    }
}