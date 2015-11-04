package recastnavigation.core.utils
{
    import recastnavigation.internal_api.CModule;

    public function copyBytes(srcPtr:int, dstPtr:int, length:int):void
    {
        for (var i:int = 0; i < length; ++i)
            CModule.write8(dstPtr + i, CModule.read8(srcPtr + i));
    }
}