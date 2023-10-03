# FunctionsAndErrors-ETHandAVAXAssessment
Hello World! in Solidity


Installation
1. Install Node.js
2. Install Truffle by running the command prompt:
  ```bash
npm install -g truffle
```

Initialization
1. Intialize the project through Truffle:
  ```bash
truffle init
```
2. The "Hello World!" contract can be found in contracts/HelloWorld.sol:
```solidity

pragma solidity ^0.8.17;

contract HelloWorld {
    string public greet = "Hello World!";
}
```
3. Prepare the migration through: `migrations/2_deploy_migration.js:`
```javascript

var HelloWorld = artifacts.require("HelloWorld");
module.exports = function(deployer) {
  deployer.deploy(HelloWorld);
}
```
4. Start Truffle console in development mode:
```bash
truffle develop
```
5. Then, run each of the following code:
```bash
compile
migrate
```
6. Lastly, test the contract via Truffle console:
```javascript

let instance = await HelloWorld.deployed()
instance.greet()

```
7. And the output is:
```bash
'Hello World!'
```
