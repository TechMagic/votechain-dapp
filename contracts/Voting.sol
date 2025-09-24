// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        string name;
        uint256 voteCount;
    }

    address public owner;
    string public title;
    uint256 public endTime;
    bool public votingActive;

    mapping(address => bool) public hasVoted;
    Proposal[] public proposals;

    constructor(string memory _title, uint256 _durationSeconds) {
        owner = msg.sender;
        title = _title;
        endTime = block.timestamp + _durationSeconds;
        votingActive = true;
    }

    function addProposal(string memory _name) external onlyOwner {
        require(votingActive, "Voting is not active");
        proposals.push(Proposal({
            name: _name,
            voteCount: 0
        }));
    }

    function vote(uint256 _proposalIndex) external {
        require(votingActive, "Voting is not active");
        require(block.timestamp < endTime, "Voting has ended");
        require(!hasVoted[msg.sender], "You already voted");
        require(_proposalIndex < proposals.length, "Invalid proposal");

        hasVoted[msg.sender] = true;
        proposals[_proposalIndex].voteCount++;
    }

    function getProposalCount() external view returns (uint256) {
        return proposals.length;
    }

    function getProposal(uint256 _index) external view returns (
        string memory name,
        uint256 voteCount
    ) {
        require(_index < proposals.length, "Invalid index");
        Proposal storage p = proposals[_index];
        return (p.name, p.voteCount);
    }

    function getWinner() external view returns (
        string memory name,
        uint256 voteCount
    ) {
        require(block.timestamp >= endTime, "Voting not ended yet");
        uint256 maxVotes = 0;
        uint256 winnerIndex = 0;

        for (uint256 i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > maxVotes) {
                maxVotes = proposals[i].voteCount;
                winnerIndex = i;
            }
        }
        return (proposals[winnerIndex].name, maxVotes);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function endVoting() external onlyOwner {
        votingActive = false;
    }
}
