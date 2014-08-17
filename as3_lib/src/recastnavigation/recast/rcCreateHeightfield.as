package recastnavigation.recast
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_rcCreateHeightfield;

    use namespace rn_internal;

    /**
     * Initializes a new heightfield.
     */
    public function rcCreateHeightfield(ctx:RCContext, hf:RCHeightfield, cfg:RCConfig):Boolean
    {
        return internal_rcCreateHeightfield(ctx.ptr, hf.ptr, CModule.read32(cfg.ptr + RCConfig.OFFSET_WIDTH),
                                            CModule.read32(cfg.ptr + RCConfig.OFFSET_HEIGHT),
                                            cfg.ptr + RCConfig.OFFSET_BMIN, cfg.ptr + RCConfig.OFFSET_BMAX,
                                            CModule.readFloat(cfg.ptr + RCConfig.OFFSET_CS),
                                            CModule.readFloat(cfg.ptr + RCConfig.OFFSET_CH));
    }
}