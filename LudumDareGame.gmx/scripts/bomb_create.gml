///bomb_create(x0, y0, x1, y1)
with (instance_create(argument0, argument1, ob_bomb))
{
    StartX = x;
    StartY = y;
    EndX = argument2;
    EndY = argument3;
    TimerLength = 30;
    Timer = TimerLength;
    
    return self.id;
}
