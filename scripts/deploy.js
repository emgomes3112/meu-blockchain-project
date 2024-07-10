const main = async () => {
    try {
    let provider = ethers.getDefaultProvider();
    const [deployer] = await hre.ethers.getSigners();
    const accountBalance = await provider.getBalance(deployer.address);
  
    console.log("Deploying contracts with account: ", deployer.address);
    console.log("Account balance: ", accountBalance.toString());
  
    const Token = await hre.ethers.deployContract("WavePortal");
    const portal = await Token.waitForDeployment();
  
    console.log("WavePortal address: ", portal.target);
    }catch (error) {
        console.log("Erro durante a implantação do contrato:", error);
        process.exitCode = 1;
    }
};

main();