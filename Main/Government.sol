// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
import"https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/governance/Governor.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/governance/extensions/GovernorCountingSimple.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/governance/extensions/GovernorVotes.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/governance/extensions/GovernorVotesQuorumFraction.sol";


contract MyGovernor is Governor, GovernorCountingSimple, GovernorVotes, GovernorVotesQuorumFraction{
    constructor(IVotes _token)
    Governor("MyGovernor")
    GovernorVotes(_token)
    GovernorVotesQuorumFraction(1){}
     
     struct Proposal {
        string description;
        uint voteCount;
    
    }

    struct Voter {
        bool isRegistered;
        bool hasVoted;
        uint voteProposalId;
        uint HatCreated;
    }

    error notEnoughHats();
    function dontallow(address user) private override returns(string memory){
         if(!hats){
            revert notEnoughHats();} return "Error not enough hats";
    }
    function votingDelay() public pure override returns (uint256) {
        return 0;
    }
    function votingPeriod() public pure override returns (uint256){
        return 1;
    }

    function quorum(uint256 blockNumber) public view override(IGovernor, GovernorVotesQuorumFraction)
    returns (uint256)
    {
        return super.quorum(blockNumber);
    }
    function getVotes(address account, uint256 blockNumber)
    public view override
    returns (uint256)
    {
        return super.getVotes(account, blockNumber, hatId); }
    

}

