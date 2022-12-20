from .data import DATA

@property
def attack_names(self):
    return [attack.name for attack in self.entity.attacks]
"""property: A property that computes a list of names of the player's
attacks."""

def get_attack_from_name(self, attack_name):
    """
    Get the player's attack with the given name.

    Arguments
    ---------
        attack_name : str
            The name of the attack to get.

    Returns
    -------
    Attack
        The corresponding attack.

    """
    for attack in self.entity.attacks:
        if attack.name == attack_name:
            return attack

@property
def attacks_view(self):
    lines = [
        DATA["attacks_view"]["title"],
        DATA["attacks_view"]["divider_character"] * len(
            DATA["attacks_view"]["title"]
        )
    ]

    for attack in self.entity.attacks:
        lines.append(attack.display_name)

        if attack.stamina_cost:
            lines.append(
                DATA["attacks_view"]["stamina_cost_template"].format(
                    attack.stamina_cost
                )
            )

        if attack.mana_cost:
            lines.append(
                DATA["attacks_view"]["stamina_cost_template"].format(
                    attack.mana_cost
                )
            )

        lines.append("")

    return "\n".join(lines)
"""property: Computes the view displaying the player's attacks to display to the
user."""
