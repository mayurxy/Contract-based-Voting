pragma solidity ^0.4.11;

contract Voting {


  struct voters {
	byte32 ssn_ID;
	bool voted;
			
  }

	 struct votesReceived{
        address candidateName;
        uint numberOfVotes;
    }

  mapping (bytes32 => uint8) public votesReceived;
  mapping (address => voters) public listVoters;



  bytes32[] public candidateList;

  function listAssign(bytes32[] candidateNames) {
    candidateList = candidateNames;
  }

  function addVoter(address  wallet_address, bytes32 ssn_ID){
        if (wallet_address == msg.sender){
          voters sender = listVoters[msg.sender];
          sender.ssn_ID = ssn_ID;
        }
      }


 


  function individualVotes(bytes32 candidate) returns (uint8) {
    require(checkValidity(candidate));
    return votesReceived[candidate];
  }


  function chooseWinner() returns (address){
        uint i;
        uint max;
	address winner; 
	max = votesReceived[0].candidateName;
        winner = votesReceived[0].candidateName;
        for(i=1; i<votesReceived.length; i++){
            if(votesReceived[i].numberOfVotes > max){
                max = votesReceived[i].numberOfVotes;
                winner = votesReceived[i].candidateName;
            }
        }
        return winner;
    }

}

  function voteForCandidate(voters candidate, address[] choices) {
    require(validCandidate(candidate));
    
	if(candidate.voted)
		throw;

    for(uint i = 0; i< choice.length; i++)
	{
		for(uint j = 0; j<cadidateList.length;j++){

		      	if(candidateList[j] == choices[i]){

			    votesReceived[candidate]  = votesReceived[candidate] + 1;
		            candidate.voted =true;
			    break;



}

}	
}

}

  function checkValidity(bytes32 candidate) returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
      if (candidateList[i] == candidate) {
        return true;
      }
    }
    return false;
   }
}

