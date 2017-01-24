words = ["PIZZA", "CHEESE", "ICE", "CHICKEN", "JAZZ", "ABRUPTLY", "COMPUTER", "BOARD", "PICTURE", "GALAXY", "FIXABLE", "JIGSAW", "INJURY", "KAZOO", "KEYHOLE", "WIZARD", "YOUTHFUL", "WALKWAY", "DOG", "CAT"]
randomWord = words.sample
avalableLetters = randomWord.split("").uniq
finalString = ""
randomWord.split("").each do |x|
	finalString = finalString + " _"
end

def prompt(*args)
    print(*args)
    gets
end

def game(word, guessedString, letters, guesses, guessedLetters)
	puts " "
	puts guessedString
	puts " "
	if guessedLetters.length > 0
		puts "Guessed Letters: " + guessedLetters.join(", ")
	end
	letter = (prompt "Guess a letter: ").gsub(/[^a-z ]/i, '').upcase.split("").first
	if letters.include?(letter)
		puts " "
		puts "Correct!"
		guessedLetters.push(letter)
		indexes = word.split("").map.with_index {|n, i| i if n == letter }.compact
		indexes.each do |index|
			guessedString[index * 2 + 1] = letter
		end
		if guessedString.include? "_"
			game(word, guessedString, letters, guesses, guessedLetters)
		else
			puts "Congatulations! You Won!"
			puts guessedString
			puts " "
		end
	end
	if !letters.include?(letter)
		puts " "
		puts "Wrong Guess!"
		guessedLetters.push(letter)
		guesses = guesses - 1
		if guesses == 0
			puts "Game Over! The word was " + word
		end
		if guesses == 1
			puts "You have 1 more guess!"
			game(word, guessedString, letters, guesses, guessedLetters)
		end
		if guesses > 1
			puts "You have " + guesses.to_s  +  " more guesses!"
			game(word, guessedString, letters, guesses, guessedLetters)
		end
	end
end

game(randomWord, finalString, avalableLetters, 10, [])
