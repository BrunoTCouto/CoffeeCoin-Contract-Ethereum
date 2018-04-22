pragma solidity ^0.4.17;

contract CoffeeCoin{

    // CONSTRUCTING MY "OBJECTS" =======================
    struct CoffeeMachine{
        uint priceByUnit;
        uint capsules;
        uint credit;
    }

    struct User{
        uint credit;
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
    function newCoffeeMachine(address coffeeMachineAddr, uint initialPriceByUnit, uint initialStock) public onlySeller{
        coffeeMachines[coffeeMachineAddr] = CoffeeMachine(initialPriceByUnit, initialStock, 0);
    }

    function addStockToCoffeeMachine(address coffeeMachineAddr, uint quantity) public onlySeller{
        if(quantity <= 0) revert();
        coffeeMachines[coffeeMachineAddr].capsules += quantity; 
    }

    function changeCoffeePrice(address coffeeMachineAddr, uint newPriceByUnit) public onlySeller{
        if(newPriceByUnit < 0) revert();
        coffeeMachines[coffeeMachineAddr].priceByUnit = newPriceByUnit; 
    }

    function auditCoffeeMachine(address coffeeMachineAddr) public onlySeller constant returns(address, uint ,uint, uint){
        return (coffeeMachineAddr, coffeeMachines[coffeeMachineAddr].priceByUnit, coffeeMachines[coffeeMachineAddr].capsules, coffeeMachines[coffeeMachineAddr].credit);
    }
    // COFFEE MACHINE FUNCTIONS =======================

    // USER FUNCTIONS =======================
    function buyCoffee(address CoffeeMachineAddress) public {
        if (coffeeMachines[CoffeeMachineAddress].capsules < 1 || users[msg.sender].credit < coffeeMachines[CoffeeMachineAddress].priceByUnit) {
            revert();
        }
        coffeeMachines[CoffeeMachineAddress].capsules -= 1;
        coffeeMachines[CoffeeMachineAddress].credit += coffeeMachines[CoffeeMachineAddress].priceByUnit;
        users[msg.sender].credit -= coffeeMachines[CoffeeMachineAddress].priceByUnit;
    }

    function msgSenderCreditsBalance() public constant returns(uint){
        return users[msg.sender].credit;
    }

    function addCredits(address userAddr, uint quantity) public onlySeller{
        if(quantity <= 0) revert();
        users[userAddr].credit += quantity;
    }
    // USER FUNCTIONS =======================

}
