import Foundation

let numericSet : [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
let alphabetSet: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

print("What would you like to purchase? Food or Merchandise? ", terminator: "")
let typeOfProduct = readLine()!
let filteredTypeOfProductCharacters = typeOfProduct.lowercased().characters.filter {
  return alphabetSet.contains($0)
}
let filteredTypeOfProductString = String(filteredTypeOfProductCharacters)

print("What type of " + filteredTypeOfProductString + " would you like to purchase? ", terminator: "")
let product = readLine()!
let filteredProductCharacters = product.lowercased().characters.filter {
  return alphabetSet.contains($0)
}
let filteredProductString = String(filteredProductCharacters)

print("How much is it? ", terminator: "")
let price = readLine()!
let filteredPriceCharacters = price.characters.filter {
  return numericSet.contains($0)
}
let filteredPriceFloat = Float(String(filteredPriceCharacters))!

print("Quantity? ", terminator: "")
let quantity = readLine()!
let filteredQuantityCharacters = quantity.characters.filter {
  return numericSet.contains($0)
}
let filteredQuantityFloat = Float(String(filteredQuantityCharacters))!

print("How much do you want to tip? ", terminator: "")
let tip = readLine()!
let filteredTipCharacters = tip.characters.filter {
  return numericSet.contains($0)
}
let filteredTipFloat = Float(String(filteredTipCharacters))!

let totalCost = (filteredPriceFloat * filteredQuantityFloat) * ((100 + 8.875 + filteredTipFloat)/100)
let hours = Int(totalCost / 7.7) + 1
print("You will have to work for " + String(hours) + " hour(s).")
