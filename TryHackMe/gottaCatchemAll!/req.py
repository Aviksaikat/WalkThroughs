#!/usr/bin/env python3
import requests
pokemons = ["Bulbasaur","Charmander ","Squirtle","Snorlax","Zapdos","Mew","Charizard","Grimer",
    "Metapod","Magikarp"]


for pokemon in pokemons:
    req = requests.get(f"http://10.10.134.2/{pokemon}")
    print(req.text)
