import Foundation
if(CommandLine.arguments.count == 3){
	var amountOfMoney:Float =  Float(CommandLine.arguments[1])!
	var amountOfYears:Float =  Float(CommandLine.arguments[2])!
	var interestRate:Float =  Float(arc4random_uniform(15) + 5)
	print("Interest Rate: " + String(Int(interestRate)) + "%")
	for i in 0...Int(amountOfYears){
		let amountOfDollars = Int(amountOfMoney)
		let amountOfCents = Int((amountOfMoney.truncatingRemainder(dividingBy:1.0)) * 100.0)
		let amountOfDollarsString = String(amountOfDollars)
		var amountOfCentsString = String(amountOfCents)
		if(amountOfCents < 10){
			amountOfCentsString = "0" + String(amountOfCents)
		}
		var timePassed = String(i) + " years: "
		if(i == 1){
			timePassed = "1 year: "
		}
		let fullMoneyString = "$" + amountOfDollarsString + "." + amountOfCentsString
		print(timePassed + fullMoneyString)
		amountOfMoney = amountOfMoney + (amountOfMoney * (interestRate/100))
	}
}
else{
	print("Enter 2 arguments in the order (amount of money, amount of years)")
}
