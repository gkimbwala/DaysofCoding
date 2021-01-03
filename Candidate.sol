//Dev: gkimbwala@gmail.com

// Create a smart candidate registration system for candidates who are registering for for elections(Part-I and Part - II)
// Write a smart contract that will perform the following functions
// 1. Create a function to register the new candidates with the following parameters(ID, name, state, funds, active(bool)) (Part - I)
// active - indicates whether the candidate has any funds left or not
// 2. Create a function to retrieve the parameters of the registered candidates given their ID (Part - I)
// 3. Create a function to check if the candidate is active or not(based on the amount of funds) (Part - II)
// 4. Create a function which will take in the candidate's ID and a campaign type(int) as parameters and deduct funds based on the campaign type (Part - II)
pragma solidity ^0.5.4;

contract Candidate{
    struct candidate{
        uint256 id;
        string name;
        string state;
        uint256 funds;
        bool active;
    }
    
    mapping (uint256 => candidate) public candidateID;
    
    function registerCandidate(uint256 _id, string  memory _name, string  memory _state, uint256 _funds) public {
        
        candidate memory newCandidate = candidate(_id, _name, _state, _funds, true);
        
         if(_funds > 100)
            newCandidate.funds = _funds;
        
        else 
            newCandidate.funds = 0;
        
        if(newCandidate.funds > 0)
            newCandidate.active = true;
        
        else
            newCandidate.active = false;

        candidateID[_id] = newCandidate;
        //candidates.push(newCandidate);
    }
    
        
    
    function getCandidate(uint256 _id)  public view returns(uint256){
        candidate storage candidate1 = candidateID[_id];
        
        return candidate1.funds;
        
    }
    
    function checkCandidate(uint256 _id) public returns(bool) {
        
        candidate storage candidate2 = candidateID[_id];
        if(candidate2.funds > 0)
            candidate2.active = true;
        else
            candidate2.active = false;
        
        return(candidate2.active);
    }
}

