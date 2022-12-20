from .. import interface
from .data import DATA

def print_list_of_attacks(battle):
    """
    Display the list of attacks the user can use in the battle.

    Arguments
    ---------
        battle : Battle
            The Battle instance representing the battle.

    Returns
    -------
    None
    
    """
    for attack in battle.player.entity.attacks:
        line = attack.display_name + " --- Damage: " + str(attack.damage) + ". "

        if attack.stamina_cost:
            line += DATA["list_of_attacks"]["stamina_cost_template"].format(
                attack.stamina_cost
            )

        if attack.mana_cost:
            line += DATA["list_of_attacks"]["mana_cost_template"].format(
                attack.mana_cost
            )

        interface.print_(line)
