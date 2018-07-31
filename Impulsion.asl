state("Impulsion-Win64-Shipping")
{
	float gameTimer : 0x2DBC7D0, 0x30, 0x150, 0x18, 0x468, 0x250;
}
init
{
	vars.fixedGameTimer = 0;
	vars.timerBeforeLoad = 0;
}
update
{
	if (current.gameTimer != 0)
		vars.fixedGameTimer = current.gameTimer;
	if (current.gameTimer == old.gameTimer && old.gameTimer != 0 && current.gameTimer != 0)
		vars.timerBeforeLoad = old.gameTimer;
}
start
{
	return (current.gameTimer > .1);
}
split
{
	return ((vars.fixedGameTimer == vars.timerBeforeLoad) && (old.gameTimer < current.gameTimer));
}
reset
{
	return (vars.fixedGameTimer < .1);
}
isLoading 
{
	return true;
}
gameTime
{
	return TimeSpan.FromSeconds(vars.fixedGameTimer);
}


