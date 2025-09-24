# 🗳️ VoteChain —— Decentralized Voting DApp

> A complete Web3 full-stack project: Solidity contract + React frontend + MetaMask integration + Sepolia deployment

## 🚀 Project Overview

This is a decentralized voting system based on Ethereum Sepolia testnet.  
Users can:
- Create voting events (set title, duration)
- Add multiple voting options
- Connect wallet and vote via MetaMask
- View real-time voting results

This project demonstrates:
- ✅ Smart contract development (Solidity)
- ✅ Hardhat deployment and verification
- ✅ React + Ethers.js frontend interaction
- ✅ Secure environment variable management
- ✅ Automated deployment workflow

> ⚠️ Note: While this project can technically run on mainnet, **for learning and demonstration purposes only**, all deployments should be conducted on Sepolia testnet.

## ✅ Deployment Links (Actually Functional)

| Type | Link |
|------|------|
| **Contract Address (Sepolia)** | [https://sepolia.etherscan.io/address/0x8310E624a79A4cCd060fBb11b2C3e06cd6ED3408](https://sepolia.etherscan.io/address/0x8310E624a79A4cCd060fBb11b2C3e06cd6ED3408) |


## 🛠️ Tech Stack

| Category | Technology |
|------|------|
| Smart Contract | Solidity 0.8.20 |
| Development Framework | Hardhat (ESM) |
| Frontend | React + TypeScript + Vite + Ethers.js |
| Wallet | MetaMask |
| Deployment | Sepolia Testnet + Vercel |
| Environment Management | `.env` + `dotenv` |

## 🚀 How to Run (Local Development)

```bash
git clone https://github.com/techmagic/votechain-dapp.git
cd votechain-dapp

npm install
cd frontend
npm install
cd ..

touch .env
nano .env
SEPOLIA_PRIVATE_KEY=0x...Your-Private-Key (64 digits begining with 0x）
SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/Your-Alchemy-Key
ETHEREUM_SCAN_API_KEY=Your-Etherscan-API-Key (A choice to verify contract)

npx hardhat compile
npx hardhat node     # in new terminal
npx hardhat run scripts/deploy.mjs --network sepolia

cd frontend
npm run dev
http://localhost:5173
# Link your Sepolia Test Network in MetaMask

# Done!

```

## 📂 Structure

```tree
votechain-dapp/
├── contracts/
│   └── Voting.sol
├── scripts/
│   └── deploy.mjs
├── frontend/
│   ├── src/
│   │   ├── App.tsx
│   │   └── ...
│   └── package.json
├── .env
├── hardhat.config.mjs
├── package.json
├── .gitignore
└── README.md     
```

## 👨‍💻 Author

[KCQZ] | [github.com/techmagic] 

> 🎯 This project is a full-stack Web3 development demonstration. Welcome to Star ⭐!

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
