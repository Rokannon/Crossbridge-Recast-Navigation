package recastnavigation.recast
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.copyBytes;
    import recastnavigation.core.utils.offsetBytes;
    import recastnavigation.internal_api.CModule;

    use namespace rn_internal;

    /**
     * Represents a set of heightfield layers.
     */
    public class RCHeightfieldLayerSet extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_LAYERS:int = offsetBytes(4, RCHeightfieldLayerSet);
        rn_internal static const OFFSET_NLAYERS:int = offsetBytes(4, RCHeightfieldLayerSet);

        /** The layers in the set. Getter. [Size: #nlayers] */
        public function getLayer(index:int, resultLayer:RCHeightfieldLayer = null):RCHeightfieldLayer
        {
            if (resultLayer == null)
            {
                resultLayer = new RCHeightfieldLayer();
            }
            resultLayer.ptr = CModule.read32(ptr + OFFSET_LAYERS) + RCHeightfieldLayer.SIZE * index;
            return resultLayer;
        }

        /** The layers in the set. Setter. [Size: #nlayers] */
        public function setLayer(index:int, value:RCHeightfieldLayer):void
        {
            copyBytes(value.ptr, CModule.read32(ptr + OFFSET_LAYERS) + RCHeightfieldLayer.SIZE * index,
                      RCHeightfieldLayer.SIZE);
        }

        /** The number of layers in the set. */
        public function get nlayers():int
        {
            return CModule.read32(ptr + OFFSET_NLAYERS);
        }

        public function set nlayers(value:int):void
        {
            CModule.write32(ptr + OFFSET_NLAYERS, value);
        }
    }
}