///bomb_step(bomb instance)
with (argument0)
{
    var t = 1 - (Timer / TimerLength);
    x = (EndX - StartX) * t + StartX;
    y = (EndY - StartY) * t + StartY;
    image_xscale = 1 + sin(pi * t) * 0.3;
    image_yscale = image_xscale;
    Timer--;
}
