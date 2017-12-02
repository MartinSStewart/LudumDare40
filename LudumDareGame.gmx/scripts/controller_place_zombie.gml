///controller_place_zombie(x, y)
with (ob_controller)
{
    LastPlacedZombieX = argument0;
    LastPlacedZombieY = argument1;
    var placedWeight = 150;
    if (Player.ZombieCount > 0)
    {
        Player.ZombieCount--;
        
        for (var i = 0; i < ds_list_size(ZombieList); i++)
        {
            var zombie = ds_list_find_value(ZombieList, i);
            if (zombie.IsHeld)
            {
                zombie.IsHeld = false;
                zombie.IsItem = false;
                zombie.x = argument0;
                zombie.y = argument1;
                zombie.Weight = placedWeight;
                exit;
            }
        }
        
        var newZombie = zombie_create(argument0, argument1);
        newZombie.Hp = 0;
        newZombie.Weight = placedWeight;
        ds_list_add(ZombieList, newZombie);
    }
}
