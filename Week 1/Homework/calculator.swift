if(CommandLine.arguments.count == 4){
	var amountOfMoney:Float =  Float(CommandLine.arguments[1])!
	var amountOfMonths:Float =  Float(CommandLine.arguments[2])!
	var intrestRate:Float =  Float(CommandLine.arguments[3])!
	for i in 0...Int(amountOfMonths){
		let amountOfDollars = Int(amountOfMoney)
		let amountOfCents = Int((amountOfMoney.truncatingRemainder(dividingBy:1.0)) * 100.0)
		let amountOfDollarsString = String(amountOfDollars)
		var amountOfCentsString = String(amountOfCents)
		if(amountOfCents < 10){
			amountOfCentsString = "0" + String(amountOfCents)
		}
		var timePassed = String(i) + " months: "
		if(i == 1){
			timePassed = "1 month: "
		}
		let fullMoneyString = "$" + amountOfDollarsString + "." + amountOfCentsString
		print(timePassed + fullMoneyString)
		amountOfMoney = amountOfMoney + (amountOfMoney * (intrestRate/100))
	}
}
else{
	print("Enter 3 arguments in the order (amount of money, amount of months, interest rate)")
}
