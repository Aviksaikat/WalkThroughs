// imports
const { ethers, network } = require("hardhat");

async function main() {
	const ShootingArea = await ethers.getContractFactory("ShootingArea");
  const Setup = await ethers.getContractFactory("Setup");

  let shootingArea = null;
  let setUp = null;

  if (network.config.chainId === 31337) {
	console.log("Working with HTB RPC");

	shootingArea = await ShootingArea.attach("0x0d65679f97Fc605b17cC57B3B7e6A0F688C8851c");
	setUp = await Setup.attach("0xDBB3232ff3FcB348c9311Aa9D58fFaB9cDf0aB2f");
  }
  else {
		shootingArea = await ShootingArea.deploy();
		await shootingArea.deployed();

		// setUp = await Setup.deploy()
		// await setUp.deployed()
	}

	console.log(`ShootingArea deployed at: ${shootingArea.address}`)

	if (setUp) {
		console.log(`Setup deployed at: ${setUp.address}`);
	}
	


	let firstShotValue = await shootingArea.firstShot();
	let secondShotValue = await shootingArea.secondShot();
	let thirdShotValue = await shootingArea.thirdShot();

	console.log(`firstShot: ${firstShotValue}, secondShot: ${secondShotValue}, thirdShot: ${thirdShotValue}`);
	
	const attacker = await ethers.getSigner(network.config.accounts.value);
	// console.log("Deployer address:", attacker.address);
  	
	//invoke the fallback fn.
	await attacker.sendTransaction({ to: shootingArea.address, 
									value: ethers.utils.parseEther("1"),
									//arbitrary data to invoke the fallback fn.
									data: "0x0123456789abcdef",
								});

	console.log("Invoked the fallback fn....");

	firstShotValue = await shootingArea.firstShot();
	secondShotValue = await shootingArea.secondShot();
	thirdShotValue = await shootingArea.thirdShot();

	console.log(`firstShot: ${firstShotValue}, secondShot: ${secondShotValue}, thirdShot: ${thirdShotValue}`);

	//invoke the receive fn.
	await attacker.sendTransaction({ to: shootingArea.address, 
		value: ethers.utils.parseEther("1"),
	});

	console.log("Invoked the receive fn....");

	firstShotValue = await shootingArea.firstShot();
	secondShotValue = await shootingArea.secondShot();
	thirdShotValue = await shootingArea.thirdShot();

	console.log(`firstShot: ${firstShotValue}, secondShot: ${secondShotValue}, thirdShot: ${thirdShotValue}`);

	console.log("Finally the thirdTarget & Hack the contract....");

	await shootingArea.third()

	console.log("HHhahhahaha passed thirdTarget.....")

	firstShotValue = await shootingArea.firstShot();
	secondShotValue = await shootingArea.secondShot();
	thirdShotValue = await shootingArea.thirdShot();

	console.log(`firstShot: ${firstShotValue}, secondShot: ${secondShotValue}, thirdShot: ${thirdShotValue}`);

	if (network.config.chainId !== 31337) {
		setUp = await Setup.deploy()
		await setUp.deployed()
		console.log(`Setup deployed at: ${setUp.address}`);
	}

	const isSolved = await setUp.isSolved()


	console.log(`Solved: ${isSolved}`);
}


// main
main()
  .then(() => process.exit(0))
  .catch((error) => {
	console.error(error)
	process.exit(1)
  })
