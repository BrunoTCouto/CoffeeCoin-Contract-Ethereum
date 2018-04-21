pragma solidity ^0.4.17;

contract CoffeeCoin{


    struct CoffeeMachine{
        uint priceByUnit;
        uint stock;
        uint credit;
    }

    struct User{
        uint credit;
    }
    
    mapping (address=>CoffeeMachine) coffeeMachines;
    mapping (address=>User) users;

    function CoffeeCoin() public{
        users[msg.sender] = User(500);
    }

    function newCoffeeMachine(address coffeeMachineAddr, uint initialPriceByUnit, uint initialStock) public{
        coffeeMachines[coffeeMachineAddr] = CoffeeMachine(initialPriceByUnit, initialStock, 0);
    }

    function addStockToCoffeeMachine(address coffeeMachineAddr, uint quantity) public {
        coffeeMachines[coffeeMachineAddr].stock += quantity; 
    }

    function auditCoffeeMachine(address coffeeMachineAddr) public constant returns(address, uint ,uint, uint){
        return (coffeeMachineAddr, coffeeMachines[coffeeMachineAddr].priceByUnit, coffeeMachines[coffeeMachineAddr].stock, coffeeMachines[coffeeMachineAddr].credit);
    }
}