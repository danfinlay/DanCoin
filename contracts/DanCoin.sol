pragma solidity ^0.4.2;

import "HumanStandardToken.sol";
import "Owned.sol";

contract DanCoin is HumanStandardToken, Owned {
  uint lastMinted;
  uint oneWeek = 604800;
  address owner;

  function DanCoin(
    uint256 _initialAmount,
    string _tokenName,
    uint8 _decimalUnits,
    string _tokenSymbol
  ) {

    balances[msg.sender] = _initialAmount;       // Give the creator all initial tokens
    totalSupply = _initialAmount;                // Update total supply
    name = _tokenName;                           // Set the name for display purposes
    decimals = _decimalUnits;                    // Amount of decimals for display purposes
    symbol = _tokenSymbol;                       // Set the symbol for display purposes
    owner = msg.sender;                          // Assign creator as Dan, the owner.
    lastMinted = block.timestamp;                // Set the minted time to the current date.
  }

  // Once a week, Dan can mint up to 160 tokens (40 hours worth).
  function mintToken(uint256 mintedAmount) onlyOwner {
    if (mintedAmount > 160) throw;
    if (lastMinted + oneWeek > block.timestamp) throw;

    balances[owner] += mintedAmount;
    totalSupply += mintedAmount;
    Transfer(0, owner, mintedAmount);

    lastMinted = block.timestamp;
  }

  // In the most extreme cases, Dan can burn anyone's tokens.
  function destroyTokens(address _target, uint256 amount) onlyOwner {
    if (amount > balances[_target]) throw;
    balances[_target] -= amount;
    Transfer(_target, 0, amount);
  }
}
