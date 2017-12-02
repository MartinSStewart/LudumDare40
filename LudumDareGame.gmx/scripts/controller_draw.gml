///controller_draw()
with (ob_controller)
{
    for (var i = 0; i < ds_list_size(ZombieList); i++)
    {
        var zombie = ds_list_find_value(ZombieList, i);
        zombie_draw(zombie);
    }
    player_draw(Player);
}
