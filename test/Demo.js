const { expect } = require("chai"); 
const hre = require("hardhat"); 

describe("Demo", function() {
    let demoContract;
    // 部署合约
    before(async() => {
        demoContract = await hre.ethers.deployContract("Demo", [666, true, "WHOSYOURDADDY"]);
    });

    // 测试构造函数
    it("should return 666", async function(){
        expect(await demoContract.getDataUint()).to.equal(666);
    });

    it("should return true", async function(){
        expect(await demoContract.getDataBool()).to.equal(true);
    });
 
    it("should return WHOSYOURDADDY", async function(){
        expect(await demoContract.getDataString()).to.equal("WHOSYOURDADDY");
    });
    
    // 测试其他函数
    it("should return 667", async function(){
        await demoContract.incrementDataUint();
        expect(await demoContract.getDataUint()).to.equal(667);
    });

    it("should return 10", async function(){
        expect(await demoContract.add(5, 5)).to.equal(10);
    });

    it("should return 8899", async function(){
        await demoContract.setDataUint(8899);
        expect(await demoContract.getDataUint()).to.equal(8899);
    });

    it("should modify corret state with 0 and return correct description", async function(){
        expect(await demoContract.finalFunction()).to.emit(
            demoContract,
            "logNewAlert"
        ).withArgs("This is final function.");
    });

});