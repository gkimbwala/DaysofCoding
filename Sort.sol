//Create a smart contract to create and sort an array in Solidity

pragma solidity ^0.7.6;

contract Sort {
    uint []  array = [1,5,2,9,3,7]; 
    
    function sortArray(uint[] memory array1 ) private pure returns(uint[] memory){
        if(array1.length ==0)
        return array1;
        
        else{
            for (uint i =0; i<array1.length-1; i++){
                 for(uint j = 0; j <array1.length-i-1; j++){
                 if(array1[j] > array1[j+1]){
                     uint temp = array1[j];
                        array1[j] = array1[j+1];
                        array1[j+1] = temp;
                    }
                } 
            }    
        }
           return array1;
    }
    

    function getSortedArray() public view returns(uint[] memory){
        return sortArray(array);
    }
}
