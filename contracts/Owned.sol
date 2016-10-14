contract Owned {
    function Owned() { owner = msg.sender; }
    address owner;

    function transferOwner (address _owner) {
        if(msg.sender == owner || msg.sender == address(this)) {
            owner = _owner;
        }
    }

    modifier onlyOwner {
        if (msg.sender != owner) throw;
        _
    }
}
