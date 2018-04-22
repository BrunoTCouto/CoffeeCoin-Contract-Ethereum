pragma solidity ^0.4.17;

contract CoffeeCoin{

    // CONSTRUCTING MY "OBJECTS" =======================
    struct CoffeeMachine{
        int priceByUnit;
        int capsules;
        int credit;
    }

    struct User{
        int credit;
        bool seller;
    }
    // CONSTRUCTING MY "OBJECTS" =======================

    // FUNCTION MODIFIERS =======================
    modifier onlySeller() {
        require(users[msg.sender].seller == true);
        _;
    }
    // FUNCTION MODIFIERS =======================

    // DECLARING SOMETHING =======================
    mapping (address=>CoffeeMachine) coffeeMachines;
    mapping (address=>User) users;
    // DECLARING SOMETHING =======================

    // CONSTRUCTOR =======================
    function CoffeeCoin() public{
        users[msg.sender] = User(500, true); //true for being a seller and false for consumer
    }
    // CONSTRUCTOR =======================

    // COFFEE MACHINE FUNCTIONS =======================
    function newCoffeeMachine(address coffeeMachineAddr, int initialPriceByUnit, int initialStock) public onlySeller{
        coffeeMachines[coffeeMachineAddr] = CoffeeMachine(initialPriceByUnit, initialStock, 0);
    }

    function addStockToCoffeeMachine(address coffeeMachineAddr, int quantity) public onlySeller{
        require(quantity > 0);
        coffeeMachines[coffeeMachineAddr].capsules += quantity; 
    }

    function changeCoffeePrice(address coffeeMachineAddr, int newPriceByUnit) public onlySeller{
        require(newPriceByUnit > 0);
        coffeeMachines[coffeeMachineAddr].priceByUnit = newPriceByUnit; 
    }

    function auditCoffeeMachine(address coffeeMachineAddr) public onlySeller constant returns(address, int ,int, int){
        return (coffeeMachineAddr, coffeeMachines[coffeeMachineAddr].priceByUnit, coffeeMachines[coffeeMachineAddr].capsules, coffeeMachines[coffeeMachineAddr].credit);
    }
    // COFFEE MACHINE FUNCTIONS =======================

    // USER FUNCTIONS =======================
    function buyCoffee(address CoffeeMachineAddress) public {
        require(coffeeMachines[CoffeeMachineAddress].capsules > 0 && users[msg.sender].credit >= coffeeMachines[CoffeeMachineAddress].priceByUnit);
        coffeeMachines[CoffeeMachineAddress].capsules -= 1;
        coffeeMachines[CoffeeMachineAddress].credit += coffeeMachines[CoffeeMachineAddress].priceByUnit;
        users[msg.sender].credit -= coffeeMachines[CoffeeMachineAddress].priceByUnit;
    }

    function msgSenderCreditsBalance() public constant returns(int){
        return users[msg.sender].credit;
    }

    function addCredits(address userAddr, int quantity) public onlySeller{
        require(quantity > 0);
        users[userAddr].credit += quantity;
    }
    // USER FUNCTIONS =======================

}
