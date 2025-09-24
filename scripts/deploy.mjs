// scripts/deploy.mjs
import dotenv from "dotenv"; // ✅ 导入 dotenv
import { ethers } from "ethers";

// ✅ ✅ ✅ 关键：在任何代码执行前，手动加载 .env 文件
dotenv.config({ path: "./.env" }); // 明确指定路径，确保加载！

async function main() {
  const privateKey = process.env.SEPOLIA_PRIVATE_KEY;
  if (!privateKey) {
    throw new Error("❌ SEPOLIA_PRIVATE_KEY is not set in .env. Please check your .env file.");
  }

  const rpcUrl = process.env.SEPOLIA_RPC_URL;
  if (!rpcUrl) {
    throw new Error("❌ SEPOLIA_RPC_URL is not set in .env.");
  }

  const wallet = new ethers.Wallet(privateKey);
  const provider = new ethers.JsonRpcProvider(rpcUrl);
  const signer = wallet.connect(provider);

  const deployerAddress = await signer.getAddress();
  console.log("✅ Deploying contracts with the account:", deployerAddress);

  const artifact = await import("../artifacts/contracts/Voting.sol/Voting.json");
  const votingFactory = new ethers.ContractFactory(
    artifact.abi,
    artifact.bytecode,
    signer
  );

  console.log("⏳ Deploying Voting contract...");
  const voting = await votingFactory.deploy("My Awesome Poll", 600);
  await voting.waitForDeployment();

  console.log("🎉✅ Voting contract deployed to:", voting.target);
}

main().catch((error) => {
  console.error("💥 Deployment failed:", error);
  process.exitCode = 1;
});
