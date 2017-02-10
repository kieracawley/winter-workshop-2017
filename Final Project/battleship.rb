require 'colorize'

def placeShip(originalBoard, length)
	board = originalBoard
	row = rand(10)
	coloumn = rand(10)
	if rand(2) == 0
		if coloumn < 5
			(0...length).each do |num|
				board[row][coloumn + num] = "S".colorize(:light_cyan)
			end
		else
			(0...length).each do |num|
				board[row][coloumn - num] = "S".colorize(:light_cyan)
			end
		end
	else
		if row < 5
			(0...length).each do |num|
				board[row + num][coloumn] = "S".colorize(:light_cyan)
			end
		else
			(0...length).each do |num|
				board[row - num][coloumn] = "S".colorize(:light_cyan)
			end
		end
	end
	return board
end

def createBoard(ships)
	newBoard = Array.new()
	(1..10).each do |index|
		newBoard.push([])
		(1..10).each do |index2|
			newBoard[index - 1].push("O".colorize(:white))
		end
	end
	(0...ships).each do |a|
		newBoard = placeShip(newBoard, 5)
	end
	return newBoard
end

def visualBoard(boardArray)
	finalString = ""
	boardArray.each do |row|
		i = 0
		row.each do |place|
			if i == 9
				finalString = finalString + "#{place} \n"
			else
				finalString = finalString + "#{place} "
			end
			i = i + 1
		end
	end
	return finalString
end

def prompt(*args)
  print(*args)
  gets
end

def generateComputerGuess(playerBoard)
	newBoard = playerBoard
	isGoodCoord = false
	hit = false
	row = 0
	coloumn = 0
	while !isGoodCoord
		row = rand(10)
		coloumn = rand(10)
		if playerBoard[row][coloumn] == "O".colorize(:white)
			isGoodCoord = true
			newBoard[row][coloumn] = "-".colorize(:yellow)
		end
		if playerBoard[row][coloumn] == "S".colorize(:light_cyan)
			hit = true
			isGoodCoord = true
			newBoard[row][coloumn] = "X".colorize(:red)
		end
	end
	return [row, coloumn, hit, newBoard]
end

def didLose(board)
	didLose = true
	board.each do |row|
		row.each do |place|
			if place == "S".colorize(:light_cyan)
				didLose = false
			end
		end
	end
	return didLose
end

def game(board1, board2, board3)
	playerBoard = board1
	computerBoard = board2
	computerDisplayBoard = board3
	puts "\n \n"
	puts "Your Board: \n" + visualBoard(playerBoard)
  puts "\n \n"
	puts "Opponent's Board: \n" + visualBoard(computerDisplayBoard)
	coloumn = prompt("Guess a coloumn! ").to_i - 1
	row = prompt("Guess a row! ").to_i - 1
	if computerBoard[row][coloumn] == "S".colorize(:light_cyan)
		puts "\nHit!"
		computerBoard[row][coloumn] = "X".colorize(:red)
		computerDisplayBoard[row][coloumn] = "X".colorize(:red)
	elsif computerBoard[row][coloumn] == "X".colorize(:red) || computerBoard[row][coloumn] == "-".colorize(:yellow)
		puts "\nYou already guessed this spot."
	else
		puts "\nMiss!"
		computerBoard[row][coloumn] = "-".colorize(:yellow)
		computerDisplayBoard[row][coloumn] = "-".colorize(:yellow)
	end
	puts "Opponent's Board: \n" + visualBoard(computerDisplayBoard)
	if didLose(computerBoard)
		puts "\nYOU WON!!!"
		return " "
	end
	sleep(2)
	computerGuess = generateComputerGuess(playerBoard)
	playerBoard = computerGuess[3]
	if computerGuess[2]
		puts "\nYour opponent hit your ship!"
	else
		puts "\nYour opponent missed."
	end
	if didLose(playerBoard)
		puts "\nYou lost. Better luck next time."
		return " "
	end
	game(playerBoard, computerBoard, computerDisplayBoard)
end

game(createBoard(1), createBoard(1), createBoard(0))
