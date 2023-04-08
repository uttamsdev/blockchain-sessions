//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract MyContract {
    address owner;
    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == owner, "You are not owner");
        _;
    }
    mapping(address => Records[]) recordMap;
    struct Records{
        address to;
        string name;
        uint amount;
    }

    Records[] private records;

    function addRecord(address to, string memory name, uint amount) public onlyOwner {
        records.push(
            Records(to,name, amount)
        );
        recordMap[to].push(
            Records(to,name,amount)
        );
    }

    function getAllRecords() public view returns(Records[] memory){
        return records;
    }

    function getRecordsByAddress() public view returns(Records[] memory){
        return recordMap[msg.sender];
    }
}