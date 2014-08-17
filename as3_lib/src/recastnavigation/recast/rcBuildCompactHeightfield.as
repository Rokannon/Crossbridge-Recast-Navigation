package recastnavigation.recast
{
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_rcBuildCompactHeightfield;

    use namespace rn_internal;

    /**
     * Builds a compact heightfield representing open space,
     * from a heightfield representing solid space.
     */
    public function rcBuildCompactHeightfield(ctx:RCContext, cfg:RCConfig, hf:RCHeightfield,
                                              chf:RCCompactHeightfield):Boolean
    {
        return internal_rcBuildCompactHeightfield(ctx.ptr, CModule.read32(cfg.ptr + RCConfig.OFFSET_WALKABLE_HEIGHT),
                                                  CModule.read32(cfg.ptr + RCConfig.OFFSET_WALKABLE_CLIMB), hf.ptr,
                                                  chf.ptr);
    }
}