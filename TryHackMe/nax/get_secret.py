#!/usr/bin/python3

import periodictable

# python3 -c "print(''.join([chr(i) for i in [47, 80, 73, 51, 84, 46, 80, 78, 103]]))"

elements = ["Ag", "Hg", "Ta", "Sb", "Po", "Pd", "Hg", "Pt", "Lr"]


info = ''.join([chr(vars(periodictable)[e].number) for e in elements ])
print(info)