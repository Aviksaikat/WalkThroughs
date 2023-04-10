require("@nomicfoundation/hardhat-toolbox");

// require("@nomiclabs/hardhat-waffle")
// require("hardhat-gas-reporter")
// require("./tasks/block-number")
// require("@nomiclabs/hardhat-etherscan")
require("dotenv").config()
// require("solidity-coverage")
// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more
/**
 * @type import('hardhat/config').HardhatUserConfig
 */

const COINMARKETCAP_API_KEY = process.env.COINMARKETCAP_API_KEY || ""
const SEPOLIA_RPC_URL =
	process.env.SEPOLIA_RPC_URL ||
	"https://eth-sepolia.g.alchemy.com/v2/your-api-key"
const PRIVATE_KEY =
	process.env.PRIVATE_KEY ||
	"0x11ee3108a03081fe260ecdc106554d09d9d1209bcafd46942b10e02943effc4a"
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY || ""
const HTB_RPC_URL = process.env.HTB || "http://139.59.173.68:31705"

module.exports = {
	defaultNetwork: "hardhat",
	networks: {
		hardhat: {chainId: 31300},
		htb: {
			url: HTB_RPC_URL,
			accounts: [PRIVATE_KEY],
			chainId: 31337,
		},
		localhost: {
			url: "http://localhost:8545",
			chainId: 1337,
		},
	},
	solidity: "0.8.18",
	gasReporter: {
		enabled: true,
		currency: "USD",
		outputFile: "gas-report.txt",
		noColors: true,
		coinmarketcap: COINMARKETCAP_API_KEY,
	},
}
