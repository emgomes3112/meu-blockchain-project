// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "lib/forge-std/src/Test.sol";
import "../contracts/WavePortal.sol";

contract WavePortalTest is Test {
    WavePortal wavePortal;

    address user1 = address(0x123);
    address user2 = address(0x456);

    function setUp() public {
        wavePortal = new WavePortal();
    }

    function testGetTotalSenders() public {
        // Inicialmente, a lista de remetentes deve estar vazia
        address[] memory senders = wavePortal.getTotalSenders();
        assertEq(senders.length, 0, "Initial senders array should be empty");

        // Adicionar um remetente através da função wave()
        wavePortal.wave();

        // Verificar se o remetente foi adicionado corretamente
        senders = wavePortal.getTotalSenders();
        assertEq(senders.length, 1, "Senders array should have one sender");
        assertEq(senders[0], address(this), "The sender should be address(this)");
    }

    function testWaveFunction() public {
        // Inicialmente, totalWaves deve ser zero
        uint256 initialWaves = wavePortal.getTotalWaves();
        assertEq(initialWaves, 0, "Initial totalWaves should be zero");

        // Inicialmente, a lista de remetentes deve estar vazia
        address[] memory senders = wavePortal.getTotalSenders();
        assertEq(senders.length, 0, "Initial senders array should be empty");

        // Chamar a função wave() como user1
        vm.prank(user1);
        wavePortal.wave();

        // Verificar se totalWaves foi incrementado
        uint256 wavesAfterFirstWave = wavePortal.getTotalWaves();
        assertEq(wavesAfterFirstWave, 1, "totalWaves should be 1 after first wave");

        // Verificar se o remetente foi adicionado corretamente
        senders = wavePortal.getTotalSenders();
        assertEq(senders.length, 1, "Senders array should have one sender after first wave");
        assertEq(senders[0], user1, "The sender should be user1");

        // Chamar a função wave() como user2
        vm.prank(user2);
        wavePortal.wave();

        // Verificar se totalWaves foi incrementado novamente
        uint256 wavesAfterSecondWave = wavePortal.getTotalWaves();
        assertEq(wavesAfterSecondWave, 2, "totalWaves should be 2 after second wave");

        // Verificar se o segundo remetente foi adicionado corretamente
        senders = wavePortal.getTotalSenders();
        assertEq(senders.length, 2, "Senders array should have two senders after second wave");
        assertEq(senders[1], user2, "The second sender should be user2");
    }
}   