import Foundation
let words = ["PIZZA", "CHEESE", "ICE", "CHICKEN", "JAZZ", "ABRUPTLY", "COMPUTER", "BOARD", "PICTURE", "GALAXY", "FIXABLE", "JIGSAW", "INJURY", "KAZOO", "KEYHOLE", "WIZARD", "YOUTHFUL", "WALKWAY", "DOG", "CAT"]
let randomWord:String = words[Int(arc4random_uniform(20) + 1)]
var letters:[String] = []
var guessedString = ""
for letter in Array(randomWord.characters){
	guessedString = guessedString + " _";
	letters.append(String(letter))
}
letters = Array(Set(letters))

func getIndexesOfLetter(word:String, letter:String) -> [Int]{
	var indexes:[Int] = []
	var i = 0
	for character in word.characters{
		if String(character) == letter{
			indexes.append(i)
		}
		i += 1
	}
	return indexes
}

func arrayToString(array:[String]) -> String{
	var finalString = ""
	var index = 0
	for string in array{
		if (index == 0) && (array.count == 1 || array.count == 2){
			finalString = finalString + string + " "
		}
		else if (index == array.count - 1){
			finalString = finalString + "and " + string
		}
		else{
			finalString = finalString + string + ", "
		}
		index += 1
	}
	return finalString
}

func game(word:String, guessedString:String, letters:[String], guesses:Int, guessedLetters:[String]){
	var newGuessedString = guessedString
	var newGuesses = guesses
	var newGuessedLetters = guessedLetters
	print(guessedString)
	print(" ")
	if(guessedLetters.count > 0){
		print("Guessed Letters: " + arrayToString(array:guessedLetters))
	}
	print("Guess a letter: ", terminator: "")
	var guess = String(readLine()!)!
	let index = guess.index(guess.startIndex, offsetBy: 0)
	guess = String(guess[index]).uppercased()
	if letters.contains(guess){
		print(" ")
		print("Correct!")
		let indexes = getIndexesOfLetter(word:word, letter:guess)
		var charArray = Array(guessedString.characters)
		for i in indexes {
			let ii = Int((i)*2 + 1)
			charArray[ii] = Character(guess)
		}
		newGuessedString = String(charArray)
		newGuessedLetters.append(guess)
		if Array(newGuessedString.characters).contains(Character("_")){
			game(word:word, guessedString:newGuessedString, letters:letters, guesses:newGuesses, guessedLetters:newGuessedLetters)
		}
		else{
			print("Congratulations! You Won!")
			print(" ")
			print(newGuessedString)
		}
	}
	else{
		newGuessedLetters.append(guess)
		print(" ")
		newGuesses -= 1
		print("Wrong Guess!")
		if newGuesses == 0{
			print("Game Over! The word was " + word)
		}
		else{
			if newGuesses > 1{
				print("You have " + String(newGuesses) + " more guesses!")
			}
			else{
				print("You have 1 more guess!")
			}
			game(word:word, guessedString:newGuessedString, letters:letters, guesses:newGuesses, guessedLetters:newGuessedLetters)
		}
	}
}

game(word:randomWord, guessedString:guessedString, letters:letters, guesses:5, guessedLetters:[])
