var Migrations = artifacts.require("./Migrations.sol");
var CoffeCoin = artifacts.require("./CoffeeCoin.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(CoffeCoin);
};
