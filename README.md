# solidity-demo
记录Solidity的基础用法及hardhat框架下的合约基本使用方式

## 使用

1.启动本地网络 

> npx hardhat node


2.部署合约，以Demo.sol为例，部署到本地网络（在另一个终端中）

> npx hardhat ignition deploy .\ignition\modules\Demo.js --network localhost

3.单元测试

> npx hardhat test .\test\Demo.js