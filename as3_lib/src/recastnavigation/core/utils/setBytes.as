package recastnavigation.core.utils
{
	import recastnavigation.internal_api.CModule;

	public function setBytes(ptr:int, value:int, size:int):void
	{
		for (var i:int = 0; i < size; ++i)
		{
			CModule.write8(ptr + i, value);
		}
	}
}