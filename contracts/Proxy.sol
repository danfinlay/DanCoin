contract StandardProxy is Proxy {

    function forward_transaction (address _destination, uint _value, bytes _bytecode) {
        if(msg.sender == implementer) {
            if(!_destination.call.value(_value)(_bytecode)) {
                throw;
            }
        }
    }

    function transfer_implementer (address _implementer) {
        if(msg.sender == implementer || msg.sender == address(this)) {
            implementer = _implementer;
        }
    }

    address implementer;
}