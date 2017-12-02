///controller_set_player_hp(hp change)
with (ob_controller)
{
    if (Player.Hp > 0 && Player.DamageTimer <= 0)
    {
        Player.Hp += argument0;
        if (Player.Hp <= 0)
        {
            GameOverTimer = GameOverTimerLength;
        }
        Player.DamageTimer = Player.DamageTimerLength;
    }
}
