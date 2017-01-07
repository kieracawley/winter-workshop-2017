if ARGV.length == 2
	amount_of_money = ARGV[0].to_f
	amount_of_years = ARGV[1].to_f
	interest_rate = rand(5..20).to_f
	puts "Interest Rate: " + interest_rate.to_i.to_s + "%"
	[*0..amount_of_years.to_i].each do |i|
		amount_of_dollars = amount_of_money.to_i
		amount_of_cents = ((amount_of_money % 1) * 100).to_i
		amount_of_dollars_string = amount_of_dollars.to_s
		amount_of_cents_string = amount_of_cents.to_s
		if amount_of_cents < 10
			amount_of_cents_string = "0" + amount_of_cents.to_s
		end
		time_passed = i.to_s + " years: "
		if i == 1
			time_passed = "1 year: "
		end
		puts time_passed + "$" + amount_of_dollars_string + "." + amount_of_cents_string
		amount_of_money += (amount_of_money * (interest_rate / 100))
	end
else
	puts "Enter 2 arguments in the order (amount of money, amount of years)"
end
