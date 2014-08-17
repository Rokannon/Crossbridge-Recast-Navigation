package recastnavigation.core.utils
{
    public function writeBits(src:int, offset:int, length:int, value:int):int
    {
        value &= ((1 << length) - 1);
        src &= ~(((1 << length) - 1) << offset);
        return src | (value << offset);
    }
}