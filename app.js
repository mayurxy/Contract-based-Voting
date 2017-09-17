Web3 = require('web3')
fs = require('fs');

web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
//console.log(web3.eth.accounts);

code = fs.readFileSync('Voting.sol').toString()
solc = require('solc')
compiledCode = solc.compile(code)
//console.log(compiledCode);

abiDefinition = JSON.parse(compiledCode.contracts[':Voting'].interface)
VotingContract = web3.eth.contract(abiDefinition)
byteCode = compiledCode.contracts[':Voting'].bytecode

const deployedContract = VotingContract.new(['John','Eddy','Jose'], {
  data: byteCode,
  from: web3.eth.accounts[0], gas: 4712388
}, (err, contract) => {
  if (contract.totalVotesFor !== undefined)
    contract.totalVotesFor.call('John', console.log)
});

contractInstance = VotingContract.at(deployedContract.address);

contractInstance.individualVotes.call('Rama');
