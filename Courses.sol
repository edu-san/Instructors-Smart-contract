pragma solidity ^0.4.23;

contract Owned
{
    address public owner;
    
    function Owned()
    {
        owner = msg.sender;
    }
    
    modifier onlyOwner()
    {
        require(msg.sender == owner);
        _;
    }
}

contract Courses is Owned
{
    struct Instructor {
        uint age;
        bytes16 fname;
        bytes16 lname;
    }
    
    mapping (address => Instructor) Instructors;
    address[] public InstructorsAccts;
    
    event InstructorInfo(uint,bytes16,bytes16);
    
    function setInstructor(address _address,uint _age,bytes16 _fname,bytes16 _lname) public onlyOwner {
        var newinstructor = Instructors[_address];
        newinstructor.age = _age;
        newinstructor.fname = _fname;
        newinstructor.lname = _lname;
        
        InstructorsAccts.push(_address) -1;
        
        InstructorInfo(_age,_fname,_lname);
    }
    
    function getInstructors() view public returns(address[])
    {
        return InstructorsAccts;
    }
    
    function getInstructor(address _address) view public returns (uint,bytes16,bytes16) {
        return (Instructors[_address].age,Instructors[_address].fname,Instructors[_address].lname  );
    }
    
    function countInstructors() view public returns(uint) 
    {
        return InstructorsAccts.length;
    }
    
    
    
