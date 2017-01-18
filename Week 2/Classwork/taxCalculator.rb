def prompt(*args)
    print(*args)
    gets
end

type_of_product = (prompt "What would you like to purchase? Food or Merchandise? ").gsub(/[^a-z ]/i, '').downcase
product = (prompt "What " + type_of_product + " would you like to purchase? ").gsub(/[^a-z ]/i, '')
price = (prompt "How much is it? ").gsub(/[^0-9.]/i, '')
quantity = (prompt "Quantity? ").gsub(/[^0-9.]/i, '')
tip = (prompt "How much do you want to tip? ").gsub(/[^0-9.]/i, '')

total_cost = (price.to_f * quantity.to_f) * ((100 + tip.to_f + 8.875)/100)
hours = (total_cost/7.7).to_f.ceil

puts "You would have to work for " + hours.to_s + " hour(s)"
