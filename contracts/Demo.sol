// SPDX-License-Identifier: UNLICENSED

// 使用pragma指定solidity的版本
// e.g. pragma solidity >=0.4.25 <0.9.0; 
pragma solidity ^0.8.24;

contract Demo{
    // 变量声明
    /*
        public：合约外部可以访问该状态
        private：合约外部不能访问该状态
    */
    uint256 public dataUint;
    bool public dataBool;
    string public dataString = "This is Demo";
    address public dataAddr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    bytes1 public dataByte = 0x66;
    // 常量：可以节约gas
    address public constant constAddr = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    // immutable：可以在构造函数里赋值，构造完成后不能进一步修改
    address public immutable immutableAddr;

    // ether和wei（钱币单位），1 ether = 10(18) wei，solidity中单位是1 wei
    uint256 public oneWei = 1 wei;
    // 1 wei is equal to 1
    bool public isOneWei = (oneWei == 1);
    uint256 public oneGwei = 1 gwei;
    // 1 gwei is equal to 10^9 gwei
    bool public isOneGwei = (oneGwei == 1e9);
    uint256 public oneEther = 1 ether;
    // 1 ether is equal to 10^18 wei
    bool public isOneEther = (oneEther == 1e18);   




    event logNewAlert(string description);

    // 构造函数
    // 函数参数为引用类型时必须要指定存储位置（memory，storage，calldata）
    /*
        memory：存在内存，函数的局部变量，生命周期与调用函数相同
        storage：存在链上，生命周期和合约相同
        calldata：和memory差不多，与memory不同的是calldata的数据是不可更改的，并且消耗更少的gas
    */
    constructor (uint256 initialUint, bool initialBool, string memory initialString){
        dataUint = initialUint;
        dataBool = initialBool;
        dataString = initialString;
        immutableAddr = msg.sender;
    }

    // 普通函数
    // view：函数只能读取合约状态，不能修改合约状态
    // You can read from a state variable without sending a transaction.
    function getDataString() public view returns(string memory){
        return dataString;
    }

    function getDataUint() public view returns(uint256) {
        return dataUint;
    }

    function getDataBool() public view returns(bool) {
        return dataBool;
    }

    // You need to send a transaction to write to a state variable.
    function setDataUint(uint256 _dataUint) public {
        dataUint = _dataUint;
    }

    function incrementDataUint() public {
        dataUint += 1;
    }

    function decrementDataUint() public {
        dataUint -= 1;
    }

    // pure：不读不写，既不能读取合约状态也不能修改合约状态
    function add(uint256 lhs, uint256 rhs) public pure returns(uint256){
        return lhs + rhs;
    }

    function getCurrentTimeStamp() public view returns(uint256) {
        return block.timestamp;   // 访问全局变量
    }

    function finalFunction() public {
        dataUint = 0;
        emit logNewAlert("This is final function.");
    }

    // 所有改变状态的操作都会消耗gas
    uint256 public stupidIdx = 0;
    // Using up all of the gas that you send causes your transaction to fail.
    // State changes are undone.
    // Gas spent are not refunded.
    function forever() public {
        // Here we run a loop until all of the gas are spent
        // and the transaction fails
        while (true) {
            stupidIdx += 1;
        }
    }

    // if-else，continue，break，for，while都和C++一样
    function ifelseFunc(uint256 x) public pure returns (uint256) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function ifelseFunc2(uint256 _x) public pure returns (uint256) {
        return _x < 10 ? 1 : 2;  
    }

    function loopFunc() public pure {
        // for loop
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                break;
            }
        }

        // while loop
        uint256 j;
        while (j < 10) {
            j++;
        }
    }

    // map：要用mapping来创建，mapping(keyType => valueType)
    // The keyType can be any built-in value type, bytes, string, or any contract.
    // valueType can be any type including another mapping or an array.
    // Mappings are not iterable.
    mapping(address => uint256) public myMap;  // 从地址到uint的map
    mapping(address => mapping(uint256 => bool)) public myNestedMap; // 嵌套map 
    function getMap(address _addr) public view returns (uint256) {
        // Mapping always returns a value.
        // If the value was never set, it will return the default value.
        return myMap[_addr];
    }

    function setMap(address _addr, uint256 _i) public {
        // Update the value at this address
        myMap[_addr] = _i;
    }

    function removeMap(address _addr) public {
        // Reset the value to the default value.
        delete myMap[_addr];
    }

    

    
}