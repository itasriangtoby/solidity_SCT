// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditLog {

    struct Audit {
        string auditor;
        uint256 timestamp;
        string hasil; // "Lolos" atau "Ada Catatan"
    }

    Audit[] public audits;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Hanya owner yang bisa input");
        _;
    }

    function tambahAudit(string memory _auditor, string memory _hasil) public onlyOwner {
        audits.push(Audit(_auditor, block.timestamp, _hasil));
    }

    function getAllAudit() public view returns (Audit[] memory) {
        return audits;
    }

    function getJumlahAudit() public view returns (uint) {
        return audits.length;
    }
}