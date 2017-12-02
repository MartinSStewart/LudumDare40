///player_throw_pos(player instance)
with (argument0)
{
    var throwDir = point_direction(x, y, mouse_x, mouse_y);
    _x = x + lengthdir_x(ThrowDistance, throwDir);
    _y = y + lengthdir_y(ThrowDistance, throwDir);
}
