// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "lib/forge-std/src/console.sol";

contract WavePortal {
    uint256 totalWaves;
    address[] public senders;
    constructor() {
        console.log("Helo, World -- Ueba, eu sou um contrato e eu sou inteligente");
    }     

    function wave() public {
        totalWaves += 1;
        senders.push(msg.sender);
        console.log("%s deu tchauzinho!", msg.sender);
        console.log("Remetente armazenado %d", msg.sender);        
    }
     function getTotalSenders() public view returns (address[] memory){        
        console.log("Temos um total de %d remetentes!", senders.length);
        return senders;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("Temos um total de %d tchauzinhos!", totalWaves);
        return totalWaves;
    }
}