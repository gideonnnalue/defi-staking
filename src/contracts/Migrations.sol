// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  constructor() {
    owner = msg.sender;
  }

  modifier restricted {
    if(msg.sender == owner) _;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_adress) public restricted {
    Migrations upgraded = Migrations(new_adress);
    upgraded.setCompleted(last_completed_migration);
  }
}