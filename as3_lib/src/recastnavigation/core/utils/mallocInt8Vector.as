package recastnavigation.core.utils
{
    import recastnavigation.internal_api.CModule;

    public function mallocInt8Vector(vector:Vector.<int>):int
    {
        var ptr:int = CModule.malloc(1 * vector.length);
        for (var i:int = vector.length - 1; i >= 0; --i)
        {
            CModule.write8(ptr + 1 * i, vector[i]);
        }
        return ptr;
    }
}