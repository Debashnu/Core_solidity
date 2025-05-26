// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CommitMint
 * @dev A smart contract where users can stake ETH as a commitment to achieve a personal goal. 
 * A referee confirms if the goal was achieved. If not confirmed before the deadline, the ETH is sent to a predefined charity or burned.
 */
contract CommitMint {
    struct Commitment {
        uint256 amount;
        string goal;
        address referee;
        uint256 deadline;
        bool confirmed;
        bool claimed;
    }

    address public owner;
    address public charity;
    mapping(address => Commitment) public commitments;

    event Committed(address indexed user, string goal, uint256 amount, uint256 deadline);
    event Confirmed(address indexed user);
    event Claimed(address indexed user, uint256 amount);
    event Forfeited(address indexed user, uint256 amount);

    constructor(address _charity) {
        require(_charity != address(0), "Invalid charity address");
        owner = msg.sender;
        charity = _charity;
    }

    function commit(string memory _goal, address _referee, uint256 _durationInSeconds) external payable {
        require(msg.value > 0, "Must stake ETH");
        require(_referee != address(0), "Referee required");
        require(commitments[msg.sender].amount == 0, "Already committed");

        commitments[msg.sender] = Commitment({
            amount: msg.value,
            goal: _goal,
            referee: _referee,
            deadline: block.timestamp + _durationInSeconds,
            confirmed: false,
            claimed: false
        });

        emit Committed(msg.sender, _goal, msg.value, block.timestamp + _durationInSeconds);
    }

    function confirm(address _user) external {
        Commitment storage c = commitments[_user];
        require(msg.sender == c.referee, "Not authorized");
        require(block.timestamp <= c.deadline, "Deadline passed");
        require(!c.confirmed, "Already confirmed");

        c.confirmed = true;
        emit Confirmed(_user);
    }

    function claim() external {
        Commitment storage c = commitments[msg.sender];
        require(c.amount > 0, "No active commitment");
        require(c.confirmed, "Not confirmed");
        require(!c.claimed, "Already claimed");

        c.claimed = true;
        payable(msg.sender).transfer(c.amount);
        emit Claimed(msg.sender, c.amount);
    }

    function forfeit() external {
        Commitment storage c = commitments[msg.sender];
        require(block.timestamp > c.deadline, "Deadline not reached");
        require(!c.confirmed && !c.claimed, "Cannot forfeit");

        uint256 amount = c.amount;
        delete commitments[msg.sender];

        payable(charity).transfer(amount);
        emit Forfeited(msg.sender, amount);
    }

    function getTimeLeft(address _user) external view returns (uint256) {
        Commitment memory c = commitments[_user];
        if (block.timestamp >= c.deadline) {
            return 0;
        }
        return c.deadline - block.timestamp;
    }
}
