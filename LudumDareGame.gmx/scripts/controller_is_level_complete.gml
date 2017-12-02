///controller_is_level_complete()
with (ob_controller)
{
    for (var i = 0; i < ds_list_size(ZombieList); i++)
    {
        var zombie = ds_list_find_value(ZombieList, i);
        if (zombie.Hp > 0)
        {
            return false;
        }
    }
    return true;
}
