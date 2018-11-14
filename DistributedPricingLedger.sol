pragma solidity ^0.4.24;

contract Test{
    
    struct bidDetails {
        string product;
        string location;
        uint numberOfTransaction;
        address member;
        uint bidprice;
        uint askprice;
    }
    
    bidDetails[] public bid;
    
    enum StateType {Open,Close}
    address public  Admin;
    address public  Member;
    StateType  public State;
    
    //constructor
    constructor() public
    {
        Admin = msg.sender;
        State = StateType.Open;

        // call ContractCreated() to create an instance of this workflow. 
		// THis will create the contract
        //ContractCreated();
    }
    
 function enterbid(string _product,string _location,uint _NumberOfTransaction,uint _bidprice,uint _askprice) public{
     //
     bidDetails memory detail = bidDetails({
         product : _product,
         location : _location,
         numberOfTransaction : _NumberOfTransaction,
         member  : msg.sender,
         bidprice : _bidprice,
         askprice : _askprice
     });
     //
     bid.push(detail);
 }   
 
  function getdatatest() public view returns(string _location,string _product,uint _bidprice,uint _askprice){
      for(uint i=0;i<=bid.length;i++){
            if (bid[i].member==msg.sender){    
               return (bid[i].location,bid[i].product,bid[i].bidprice,bid[i].askprice);
            }
      }
    
 }
 
 function calculatePrice() public returns(uint  _finalPrice){
     uint total=0;
     for(uint y=0;y<bid.length;y++){
         total=total+bid[y].bidprice+bid[y].askprice;
     }
     State = StateType.Close;
     //
     return(total/(2*bid.length));
 }
 
 
}
