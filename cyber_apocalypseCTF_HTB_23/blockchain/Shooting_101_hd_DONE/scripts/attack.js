// imports
const { ethers, network } = require("hardhat")
const { shootingArea, setUp } = require('./deploy.js')

const ShootingArea = artifacts.require("ShootingArea");
const Setup = artifacts.require("Setup");

// Now you can use the contract objects directly:
shootingArea = await ShootingArea.deployed();
setUp = await Setup.deployed();

console.log(`ShootingArea deployed at: ${shootingArea.address}`)
console.log(`Setup deployed at: ${setUp.address}`)

