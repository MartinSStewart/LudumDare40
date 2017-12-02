///bomb_create(x0, y0, x1, y1)
with (instance_create(argument0, argument1, ob_bomb))
{
    StartX = x;
    StartY = y;
    EndX = argument2;
    EndY = argument3;
    TimerLength = 10 + sqrt(point_distance(StartX, StartY, EndX, EndY));
    Timer = TimerLength;
    Radius = ob_controller.BombOuterRadius;
    
    return self.id;
}
