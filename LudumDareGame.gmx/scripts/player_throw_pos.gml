///player_throw_pos(player instance)
with (argument0)
{
    var dir = point_direction(x, y, mouse_x, mouse_y);
    var dist = point_distance(x, y, mouse_x, mouse_y);
    dist = clamp(dist, 50, 300);
    _x = x + lengthdir_x(dist, dir);
    _y = y + lengthdir_y(dist, dir);
}
