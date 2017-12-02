///bomb_step(bomb instance)
with (argument0)
{
    if (Timer <= 0)
    {
        instance_destroy();
    }

    var t = 1 - (Timer / TimerLength);
    x = (EndX - StartX) * t + StartX;
    y = (EndY - StartY) * t + StartY;

    Timer--;
}
