# CoffeeCoin Contract Ethereum
<br>
1. install Ganache
<br>http://truffleframework.com/ganache/
<br>
2. install truffle
<br>$ npm install -g truffle
<br>http://truffleframework.com/
<br>
3. open Ganache
<br>
4. execute commands
<br>4.1 truffle compile
<br>4.2 truffle migrate --network development --reset
<br>4.3 truffle console
<br>
5. inside truffle console execute
<br>5.1 CoffeeCoin.deployed().then((b) => {a = b})
<br>
<br>5.2 a.newCoffeeMachine(<MACHINE ADDRES HERE>, 100, 5)
<br>5.3 a.auditCoffeeMachine(<MACHINE ADDRES HERE>)
<br>
<br>5.4 a.msgSenderCreditsBalance()
<br>5.5 a.buyCoffee(<MACHINE ADDRES HERE>)
<br>5.6 a.msgSenderCreditsBalance()
<br>5.7 a.auditCoffeeMachine(<MACHINE ADDRES HERE>)
<br>
<br>5.8 a.changeCoffeePrice(<MACHINE ADDRES HERE>, 250)
<br>5.9 a.auditCoffeeMachine(<MACHINE ADDRES HERE>)
<br>
<br>5.10 a.addStockToCoffeeMachine(<MACHINE ADDRES HERE>, 3)
<br>5.11 a.auditCoffeeMachine(<MACHINE ADDRES HERE>)
<br>
<br>5.12 a.msgSenderCreditsBalance()
<br>5.13 a.addCredits(<USER ADDRES HERE>, 500)
<br>5.14 a.msgSenderCreditsBalance()
