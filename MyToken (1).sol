// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {
    string public tokenName;
    string public tokenAbr;
    uint256 public totalSupply;

    mapping(address => uint256) public balances;
//Constructor initialize the values
    constructor(string memory _name, string memory _abbr, uint256 _initialSupply) {
        tokenName = _name;
        tokenAbr = _abbr;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply;
    }
//Mint adds the values
    function mint(address _account, uint256 _value) public {
        
        totalSupply += _value;
        balances[_account] += _value;
    }
    event LogMessage(string message);
//Burn deducts the values
    function burn(address _account, uint256 _value) public {
       
        if(balances[_account]>_value){
           totalSupply -= _value;
           balances[_account] -= _value;
        }
        else{
        string memory message = "Insufficient Balance";
        emit LogMessage(message);
        }
    }
}
