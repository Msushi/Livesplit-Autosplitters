state("Impulsion-Win64-Shipping")
{
	float levelTimer : 0x2DE17D0, 0x30, 0x370, 0x148, 0x780, 0x60C;
	float bufferGameTime : 0x2DD07F8, 0xC0, 0x20, 0x20, 0x140, 0x150;
}
init
{
	vars.gameTime = 0;
	vars.fixedBufferTime = 0;
	vars.fixedLevelTime = 0;
}
update
{
	if (current.levelTimer != 0)
		vars.fixedLevelTime = current.levelTimer;
	if (current.bufferGameTime != 0)
		vars.fixedBufferTime = current.bufferGameTime;
	
	
}
start
{
	return (current.levelTimer > 0);
}
split
{
	if (current.levelTimer == current.bufferGameTime)
	{
		if (current.bufferGameTime > old.bufferGameTime)
		{
			vars.firstSplit = false;
			return true;
		}
			
	}
	else
	{
		if (current.bufferGameTime > old.bufferGameTime && old.bufferGameTime != 0)
			return true;
	}
}
isLoading 
{
	return true;
}
gameTime
{
	return TimeSpan.FromSeconds(current.bufferGameTime);
}
