const main = async () => {
    // deploy the contract
    const nftContractFactory = await hre.ethers.getContractFactory('EpicNFT');
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log('Contract deployed to:', nftContract.address)

    // Call the function.
    let txn = await nftContract.makeAnEpicNFT()
    await txn.wait()
    console.log('Minted NFT #1')
    txn = await nftContract.makeAnEpicNFT()
    //wait for nft
    await txn.wait();
    console.log("Minted NFT #2")
}

const runMain = async() => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(1)
    }
}