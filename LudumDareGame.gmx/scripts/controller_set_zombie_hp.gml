///controller_set_zombie_hp(zombie instance, hp change)
with (ob_controller)
{
    argument0.Hp += argument1;
    if (argument0.Hp <= 0)
    {
        if (controller_is_level_complete())
        {
            LevelComplete = true;
            LevelCompleteTimer = LevelCompleteTimerLength;
            with (ob_zombie)
            {
                IsItem = true;
            }
        }
    }
}
