# CoffeeCoin Contract Ethereum

1. install Ganache
http://truffleframework.com/ganache/

2. install truffle
$ npm install -g truffle
http://truffleframework.com/

3. open Ganache

4. execute commands
4.1 truffle compile
4.2 truffle migrate --network development --reset
4.3 truffle console

5 inside truffle console execute
5.1 CoffeeCoin.deployed().then((b) => {a = b})

5.2 a.newCoffeeMachine(<MACHINE ADDRES HERE>, 100, 5)
5.3 a.auditCoffeeMachine(<MACHINE ADDRES HERE>)

5.4 a.msgSenderCreditsBalance()
5.5 a.buyCoffee(<MACHINE ADDRES HERE>)
5.6 a.msgSenderCreditsBalance()
5.7 a.auditCoffeeMachine(<MACHINE ADDRES HERE>)

5.8 a.changeCoffeePrice(<MACHINE ADDRES HERE>, 250)
5.9 a.auditCoffeeMachine(<MACHINE ADDRES HERE>)

5.10 a.addStockToCoffeeMachine(<MACHINE ADDRES HERE>, 3)
5.11 a.auditCoffeeMachine(<MACHINE ADDRES HERE>)

5.12 a.msgSenderCreditsBalance()
5.13 a.addCredits(<USER ADDRES HERE>, 500)
5.14 a.msgSenderCreditsBalance()
