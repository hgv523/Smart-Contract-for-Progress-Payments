pragma solidity ^0.5.17;

contract PBUPay {
    event Withdraw(uint amount, uint balance);
    event Payment(address pariticpant1, address participant2, uint level);
    
    address payable  GC;
    address payable  carpenter;
    uint256 public startTime;
  
    
    constructor(address payable _GC, address payable _carpenter) public payable {
        GC = _GC;
        carpenter = _carpenter;
        GC = msg.sender;
    }
   
    modifier onlyGC() {
        require(msg.sender==GC,"Not GC");
        _;}
    function Time() public {
        startTime = now;}   
        
    function Paymentcheck(uint level) public payable onlyGC returns (bool){
        uint finishTime;
        finishTime = block.timestamp;
        if(finishTime<startTime + 2 days && level == 17) {
            require(msg.value == 8.5 ether);
            carpenter.transfer(8.5 ether);
            emit Payment(msg.sender, carpenter, level);
            return true;}
        if(finishTime<startTime + 2 days && level == 18) {
            carpenter.transfer(address(this).balance);
            emit Payment(msg.sender, carpenter, level);
            return true;}
        else {
            return false;
        }
    }
  
    function getBalance() public view returns (uint)  {
        return address(this).balance;
    }
    function withdraw() public payable onlyGC returns(bool) {
        require(msg.value < address(this).balance);
        GC.transfer(msg.value);
        return true;    
}
    
}
