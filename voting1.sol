//SPDX-License-Identifier:MIT;
pragma solidity ^ 0.8.7;

contract votingContract{

    uint stopTime = 20 seconds;
    address payable owner;
    mapping(address=> uint) public voteCount;
    mapping(address => uint) public timePeriod;
    address[] public voters;
    /* Tried enum for timer----------------------------------------------------
    enum votingPeriod{
        startTime,
        stopTime
    } */
    




    //votingPeriod public voteTime;

    

    constructor(){
        owner = payable(msg.sender);
    }
    
    function vote() public payable{
       /* timePeriod[owner] = block.timestamp;
        if(block.timestamp - timePeriod[owner] <= 10 ){
        voteTime = votingPeriod.startTime;
        } else {
            voteTime = votingPeriod.stopTime;
        } 
        require(voteTime == votingPeriod.startTime, "The voting period has ended"); */
        require(msg.value == 1 ether, "Send 1  ether to vote");
        require(voteCount[msg.sender]<1, "YOU CAN VOTE ONLY ONCE");
        voteCount[msg.sender]+=1;
        voters.push(msg.sender);
    }


    function getBalanceOfTheContract() public view returns(uint){
        return(address(this).balance);
    }

    function transferFunds() public payable{
        require(owner == msg.sender, "You are not the Owner!");
        payable(msg.sender).transfer(address(this).balance);
        
    }
}