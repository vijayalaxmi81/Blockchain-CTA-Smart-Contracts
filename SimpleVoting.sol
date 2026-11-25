
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleVoting {

    string[] private candidates;

    mapping(address => bool) public hasVoted;
    mapping(uint256 => uint256) private voteCounts;

    constructor(
        string memory candidateOne,
        string memory candidateTwo
    ) {
        require(
            bytes(candidateOne).length > 0 &&
            bytes(candidateTwo).length > 0,
            "Candidate names cannot be empty"
        );

        candidates.push(candidateOne);
        candidates.push(candidateTwo);
    }

    // Cast a vote
    function vote(uint256 candidateIndex) external {
        require(candidateIndex < candidates.length, "Invalid candidate");
        require(!hasVoted[msg.sender], "Already voted");

        hasVoted[msg.sender] = true;
        voteCounts[candidateIndex]++;
    }

    // View candidate and their votes
    function getCandidate(uint256 index)
        external
        view
        returns (string memory name, uint256 votes)
    {
        require(index < candidates.length, "Invalid candidate");

        return (candidates[index], voteCounts[index]);
    }

    // Get the number of candidates
    function candidateCount() external view returns (uint256) {
        return candidates.length;
    }
}
