#
#  Panoramix v4 Oct 2019 
#  Decompiled source of poly:0x8678b38705fb08833031cB2649e00329e4031715
# 
#  Let's make the world open source 
# 

def storage:
  tokenAddress is addr at storage 0
  walletAddress is addr at storage 1
  stor2 is uint256 at storage 2
  rate is uint256 at storage 3
  weiRaised is uint256 at storage 4
  contributors is mapping of uint256 at storage 5
  unknowne5658e1a is mapping of uint256 at storage 6
  openingTime is uint256 at storage 7
  closingTime is uint256 at storage 8
  unknown5e8430eeAddress is addr at storage 9
  unknownef67a5e2Address is addr at storage 10
  stor11 is uint128 at storage 11 offset 160
  unknown6ac8d0c2 is uint8 at storage 11 offset 160
  unknown0e971bbcAddress is addr at storage 11
  owner is addr at storage 12
  unknown600e666c is array of uint256 at storage 13
  isFinalized is uint8 at storage 14
  cap is uint256 at storage 15
  goal is uint256 at storage 16
  unknownb444e162 is uint256 at storage 17
  initialized is uint8 at storage 18 offset 160
  vaultAddress is addr at storage 18
  unknownbab80d14 is uint8 at storage 18 offset 168
  checkRate is uint256 at storage 19
  minEthContribution is uint256 at storage 21
  maxEthContribution is uint256 at storage 22
  checkSoftCap is uint256 at storage 23
  unknownc758e792 is uint256 at storage 24
  presaleStartTime is uint256 at storage 25
  presaleEndTime is uint256 at storage 26

def unknown0e971bbc(): # not payable
  return unknown0e971bbcAddress

def initialized(): # not payable
  return bool(initialized)

def contributors(address _param1): # not payable
  require calldata.size - 4 >=′ 32
  return contributors[_param1]

def presaleEndTime(): # not payable
  return presaleEndTime

def unknown2698d707(): # not payable
  return weiRaised

def rate(): # not payable
  return rate

def cap(): # not payable
  return cap

def goal(): # not payable
  return goal

def weiRaised(): # not payable
  return weiRaised

def unknown4879ef26(addr _param1): # not payable
  require calldata.size - 4 >=′ 32
  return contributors[addr(_param1)]

def closingTime(): # not payable
  return closingTime

def wallet(): # not payable
  return walletAddress

def unknown5e8430ee(): # not payable
  return unknown5e8430eeAddress

def unknown600e666c(): # not payable
  return unknown600e666c[0 len unknown600e666c.length]

def unknown6ac8d0c2(): # not payable
  return bool(unknown6ac8d0c2)

def isFinalized(): # not payable
  return bool(isFinalized)

def owner(): # not payable
  return owner

def presaleStartTime(): # not payable
  return presaleStartTime

def unknownb444e162(): # not payable
  return unknownb444e162

def openingTime(): # not payable
  return openingTime

def unknownbab80d14(): # not payable
  return bool(unknownbab80d14)

def minEthContribution(): # not payable
  return minEthContribution

def unknownc758e792(): # not payable
  return unknownc758e792

def maxEthContribution(): # not payable
  return maxEthContribution

def checkRate(): # not payable
  return checkRate

def CheckSoftCap(): # not payable
  return checkSoftCap

def unknowne5658e1a(addr _param1): # not payable
  require calldata.size - 4 >=′ 32
  return unknowne5658e1a[_param1]

def unknownef67a5e2(): # not payable
  return unknownef67a5e2Address

def vault(): # not payable
  return vaultAddress

def token(): # not payable
  return tokenAddress

#
#  Regular functions
#

def capReached(): # not payable
  return weiRaised >= cap

def goalReached(): # not payable
  if goal > 0:
      return weiRaised >= goal
  return (weiRaised > goal)

def renounceOwnership(): # not payable
  require caller == owner
  log OwnershipRenounced(address previousOwner=owner)
  owner = 0

def unknown4ed0a83d(): # not payable
  require caller == owner
  call 0x259a9e2f61dd9d52932de5243f587c015009995e with:
     value eth.balance(this.address) wei
       gas 2300 * is_zero(value) wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def transferOwnership(address _newOwner): # not payable
  require calldata.size - 4 >=′ 32
  require caller == owner
  require _newOwner
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=_newOwner)
  owner = _newOwner

def hasEnded(): # not payable
  require weiRaised <= cap
  if block.timestamp > closingTime:
      return (block.timestamp > closingTime)
  if weiRaised >= cap:
      return weiRaised >= cap
  return (cap - weiRaised < minEthContribution)

def hasClosed(): # not payable
  require weiRaised <= cap
  if block.timestamp > closingTime:
      return (block.timestamp > closingTime)
  if weiRaised >= cap:
      return weiRaised >= cap
  return (cap - weiRaised < minEthContribution)

def unknownfb2d8eb8(addr _param1): # not payable
  require calldata.size - 4 >=′ 32
  require ext_code.size(_param1)
  call _param1.decimals() with:
       gas gas_remaining wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  return ext_call.return_data[31 len 1]

def unknown8e3a861d(addr _param1, uint256 _param2): # not payable
  require calldata.size - 4 >=′ 64
  require caller == owner
  require ext_code.size(tokenAddress)
  call tokenAddress.transfer(address to, uint256 value) with:
       gas gas_remaining wei
      args addr(_param1), _param2
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32

def unknownad4e6c4b(uint256 _param1, addr _param2): # not payable
  require calldata.size - 4 >=′ 64
  require caller == owner
  if not _param2:
      revert with 0, 'platform addr cant be zero'
  require ext_code.size(tokenAddress)
  call tokenAddress.transfer(address to, uint256 value) with:
       gas gas_remaining wei
      args addr(_param2), _param1
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32

def claimRefund(): # not payable
  if not isFinalized:
      revert with 0, 'not finalized'
  if goal > 0:
      if weiRaised >= goal:
          if unknown6ac8d0c2:
              revert with 0, 'goal reached'
  else:
      if weiRaised > goal:
          if unknown6ac8d0c2:
              revert with 0, 'goal reached'
  require ext_code.size(vaultAddress)
  call vaultAddress.refund(address customer) with:
       gas gas_remaining wei
      args caller
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def claimTokens(): # not payable
  if not isFinalized:
      revert with 0, 'Not Finalized yet!'
  if not contributors[caller]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'user has no more tokens to claim!'
  if not contributors[caller]:
      contributors[caller] = 0
      require ext_code.size(tokenAddress)
      call tokenAddress.transfer(address to, uint256 value) with:
           gas gas_remaining wei
          args caller, 0
  else:
      require rate * contributors[caller] / contributors[caller] == rate
      contributors[caller] = 0
      require ext_code.size(tokenAddress)
      call tokenAddress.transfer(address to, uint256 value) with:
           gas gas_remaining wei
          args caller, rate * contributors[caller] / 10^18
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32

def unknown8807b3b6(): # not payable
  if not contributors[caller]:
      require ext_code.size(tokenAddress)
      call tokenAddress.decimals() with:
           gas gas_remaining wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >=′ 32
      return 0
  require rate * contributors[caller] / contributors[caller] == rate
  require ext_code.size(tokenAddress)
  call tokenAddress.decimals() with:
       gas gas_remaining wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  if not rate * contributors[caller] / 10^18:
      return 0
  require 10^ext_call.return_data * rate * contributors[caller] / 10^18 / rate * contributors[caller] / 10^18 == 10^ext_call.return_data[31 len 1]
  return (10^ext_call.return_data * rate * contributors[caller] / 10^18 / 10^18)

def buyTokens(address _beneficiary) payable: 
  require calldata.size - 4 >=′ 32
  require call.value >= minEthContribution
  require call.value <= maxEthContribution
  require block.timestamp >= openingTime
  require block.timestamp <= closingTime
  require _beneficiary
  require call.value
  require call.value + weiRaised >= weiRaised
  require call.value + weiRaised <= cap
  if not call.value:
      require call.value + weiRaised >= weiRaised
      weiRaised += call.value
      log TokenPurchase(
            address purchaser=call.value,
            address beneficiary=0,
            uint256 value=caller,
            uint256 amount=_beneficiary)
  else:
      require rate * call.value / call.value == rate
      require call.value + weiRaised >= weiRaised
      weiRaised += call.value
      log TokenPurchase(
            address purchaser=call.value,
            address beneficiary=rate * call.value / 10^18,
            uint256 value=caller,
            uint256 amount=_beneficiary)
  require ext_code.size(vaultAddress)
  call vaultAddress.deposit(address addr) with:
     value call.value wei
       gas gas_remaining wei
      args caller
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]

def _fallback() payable: # default function
  require call.value <= stor2
  require contributors[caller] <= stor2 - call.value
  require call.value >= minEthContribution
  require call.value <= maxEthContribution
  require block.timestamp >= openingTime
  require block.timestamp <= closingTime
  require caller
  require call.value
  require call.value + weiRaised >= weiRaised
  require call.value + weiRaised <= cap
  if not call.value:
      require call.value + weiRaised >= weiRaised
      weiRaised += call.value
      log TokenPurchase(
            address purchaser=call.value,
            address beneficiary=0,
            uint256 value=caller,
            uint256 amount=caller)
  else:
      require rate * call.value / call.value == rate
      require call.value + weiRaised >= weiRaised
      weiRaised += call.value
      log TokenPurchase(
            address purchaser=call.value,
            address beneficiary=rate * call.value / 10^18,
            uint256 value=caller,
            uint256 amount=caller)
  require ext_code.size(vaultAddress)
  call vaultAddress.deposit(address addr) with:
     value call.value wei
       gas gas_remaining wei
      args caller
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require call.value + contributors[caller] >= contributors[caller]
  contributors[caller] += call.value
  require call.value + unknowne5658e1a[caller] >= unknowne5658e1a[caller]
  unknowne5658e1a[caller] += call.value

def unknownc9dcdfb8(): # not payable
  require calldata.size - 4 >=′ 128
  require calldata.size >′ 35
  require 100 <= calldata.size
  idx = 0
  s = 4
  t = 96
  while idx < 3:
      mem[t] = addr(cd[s])
      idx = idx + 1
      s = s + 32
      t = t + 32
      continue 
  require caller == owner
  require not isFinalized
  require weiRaised <= cap
  if block.timestamp <= closingTime:
      if weiRaised < cap:
          require cap - weiRaised < minEthContribution
  unknown5e8430eeAddress = mem[108 len 20]
  unknownef67a5e2Address = mem[140 len 20]
  unknown0e971bbcAddress = mem[172 len 20]
  stor11 = Mask(96, 0, bool(cd[100]))
  require ext_code.size(vaultAddress)
  if goal > 0:
      if weiRaised < goal:
          call vaultAddress.enableRefunds() with:
               gas gas_remaining wei
      else:
          if not unknown6ac8d0c2:
              call vaultAddress.enableRefunds() with:
                   gas gas_remaining wei
          else:
              call vaultAddress.0x719dcf4a with:
                   gas gas_remaining wei
                  args unknownef67a5e2Address, unknown0e971bbcAddress
  else:
      if weiRaised <= goal:
          call vaultAddress.enableRefunds() with:
               gas gas_remaining wei
      else:
          if not unknown6ac8d0c2:
              call vaultAddress.enableRefunds() with:
                   gas gas_remaining wei
          else:
              call vaultAddress.0x719dcf4a with:
                   gas gas_remaining wei
                  args unknownef67a5e2Address, unknown0e971bbcAddress
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  log Finalized()
  isFinalized = 1
  return 1

