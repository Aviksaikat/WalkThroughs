#!/usr/bin/python3

from pwn import xor


a = "BgfFwESww-1JLs5VG4M4CInDG6Ej-rsJasYyZmkZW9ccnkrt0RtkcgdgePGBM-YBiVMljUj5RDiNTzKIxxtLExU-PFlV8yZqwySVfIsxf4Fufj3sKI-GNr9iU3n0-fLxb2wZKcXYE2XyogQ65F4DFRie0HqpA!82iNujW8XCZLegIKK-imc5ZVEh6RRtUdpFIcwMQOsaR1I6d-Cq1IY2EA~~"

b = "9Ew3cAOgx4BuG02V1pIbUuDR1Y1Q4GscLtNFy3P3nAfKOap1iYuyaR4ylhvBCYu1h6Fx7QUR-sCSjr5Sd7PdlZh7ZKgZj7v7HchFhCs0!QAD4WsEhugMrD4c4-lkaIxakd3Zgkt7Le3-A2dgNatl3c322nkpKiNEAgfE314Cu8WyA-DR610us356bFKA72A2uadNR86D4cjrhQAAkYYJBg~~"


print(xor(a, b))