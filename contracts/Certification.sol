pragma solidity >=0.4.21 <0.7.0;

contract Certification{
    string name;
    string body; 
    
    address owner;      // 证书获得者
    address origin;     // 证书颁发者

    uint receiptTime;   // 实际获得证书的时间
    uint overdueTime;   // 证书的有效期限
    uint recordTime;    // 证书在平台上颁发的时间

    constructor(
        string memory _name, 
        string memory _body, 
        address _owner,
        uint _receiptTime,
        uint _overdueTime
    ) public{
        name = _name;
        body = _body;
        owner = _owner;
        receiptTime = _receiptTime;
        overdueTime = _overdueTime;
        origin = msg.sender;
        recordTime = now;
    }

    modifier onlyOrgin{
        require(
            msg.sender == origin,
            "Only the origin can use this function!"
        );
        _;
    }


    function getName() public view returns(string memory){
        return name;
    }

    function getBody() public view returns(string memory){
        return body;
    }

    function getOwner() public view returns(address){
        return owner;
    }

    function getOrigin() public view returns(address){
        return origin;
    }

    function getReceiptTime() public view returns(uint){
        return receiptTime;
    }

    function getOverdueTime() public view returns(uint){
        return overdueTime;
    }

    function getRecordTime() public view returns(uint){
        return recordTime;
    }
}