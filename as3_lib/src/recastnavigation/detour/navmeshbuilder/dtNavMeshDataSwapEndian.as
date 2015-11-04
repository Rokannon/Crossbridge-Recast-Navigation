package recastnavigation.detour.navmeshbuilder
{
    import recastnavigation.core.utils.mallocInt8Vector;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_dtNavMeshDataSwapEndian;

    /**
     * Swaps endianess of the tile data.
     */
    public function dtNavMeshDataSwapEndian(data:Vector.<int>):Boolean
    {
        var data_ptr:int = mallocInt8Vector(data);
        var dataSize:int = data.length;
        var result:Boolean = internal_dtNavMeshDataSwapEndian(data_ptr, dataSize);
        for (var i:int = 0; i < dataSize; ++i)
            data[i] = CModule.read8(data_ptr + 1 * i);
        CModule.free(data_ptr);
        return result;
    }
}