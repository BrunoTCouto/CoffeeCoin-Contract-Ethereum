pragma solidity ^0.4.17;

contract CoffeeCoin{

    // CONSTRUCTING MY "OBJECTS" =======================
    struct CoffeeMachine{
        uint priceByUnit;
        uint stock;
        uint credit;
    }

    struct User{
        uint credit;
    }
    // CONSTRUCTING MY "OBJECTS" =======================
    
    // DECLARING SOMETHING
    mapping (address=>CoffeeMachine) coffeeMachines;
    mapping (address=>User) users;

    // CONSTRUCTOR
    function CoffeeCoin() public{
        users[msg.sender] = User(500);
    }

    // COFFEE MACHINE FUNCTIONS =======================
    function newCoffeeMachine(address coffeeMachineAddr, uint initialPriceByUnit, uint initialStock) public{
        coffeeMachines[coffeeMachineAddr] = CoffeeMachine(initialPriceByUnit, initialStock, 0);
    }

    function addStockToCoffeeMachine(address coffeeMachineAddr, uint quantity) public {
        coffeeMachines[coffeeMachineAddr].stock += quantity; 
    }

    function changeCoffeePrice(address coffeeMachineAddr, uint newPriceByUnit) public{
        coffeeMachines[coffeeMachineAddr].priceByUnit = newPriceByUnit; 
    }

    function auditCoffeeMachine(address coffeeMachineAddr) public constant returns(address, uint ,uint, uint){
        return (coffeeMachineAddr, coffeeMachines[coffeeMachineAddr].priceByUnit, coffeeMachines[coffeeMachineAddr].stock, coffeeMachines[coffeeMachineAddr].credit);
    }
    // COFFEE MACHINE FUNCTIONS =======================

    // USER FUNCTIONS =======================
    function buyCoffee(address CoffeeMachineAddress) public returns(bool){ //NOT DONE
        if (users[msg.sender].credit > coffeeMachines[CoffeeMachineAddress].priceByUnit && coffeeMachines[CoffeeMachineAddress].stock >= 1) {
            coffeeMachines[CoffeeMachineAddress].stock -= 1;
            coffeeMachines[CoffeeMachineAddress].credit += coffeeMachines[CoffeeMachineAddress].priceByUnit;
            users[msg.sender].credit -= coffeeMachines[CoffeeMachineAddress].priceByUnit;
            return true;
        }
        return false;
    }

    // USER FUNCTIONS =======================

}