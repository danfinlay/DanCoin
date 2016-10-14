pragma solidity ^0.4.0;

import "HumanStandardToken.sol";
import "Owned.sol";


contract DanCoin is HumanStandardToken, Owned {
  function DanCoin() {
  }

  // Once a week, Dan can mint up to 160 tokens (40 hours worth).
  function mintToken(uint256 mintedAmount) onlyOwner {
    if (mintedAmount > 160) throw;
    balanceOf[owner] += mintedAmount;
    totalSupply += mintedAmount;
    Transfer(0, owner, mintedAmount);
  }

  // In the most extreme cases, Dan can burn anyone's tokens.
  function destroyTokens(address _target, uint256 amount) onlyOwner {

  }
}
