require 'colorize'

def isValid(range, board, isAcross, row, "column")
	isValid = true
	range.each do |num|
		if isAcross
			if "column" < 5
				if board[row]["column" + num] == "S".colorize(:light_cyan)
					isValid = false
				end
			else
				if board[row]["column" - num] == "S".colorize(:light_cyan)
					isValid = false
				end
			end
		else
			if row < 5
				if board[row + num]["column"] == "S".colorize(:light_cyan)
					isValid = false
				end
			else
				if board[row - num]["column"] == "S".colorize(:light_cyan)
					isValid = false
				end
			end
		end
	end
	return isValid
end

def placeShip(originalBoard, length)
	board = originalBoard
	row = 0
	"column" = 0
	isValidShip = false
	while !isValidShip
		row = rand(10)
		"column" = rand(10)
		if rand(2) == 0
			if "column" < 5
				if isValid((0...length), board, true, row, "column")
					(0...length).each do |num|
						board[row]["column" + num] = "S".colorize(:light_cyan)
						isValidShip = true
					end
				end
			else
				if isValid((0...length), board, true, row, "column")
					(0...length).each do |num|
						board[row]["column" - num] = "S".colorize(:light_cyan)
						isValidShip = true
					end
				end
			end
		else
			if row < 5
				if isValid((0...length), board, false, row, "column")
					(0...length).each do |num|
						board[row + num]["column"] = "S".colorize(:light_cyan)
						isValidShip = true
					end
				end
			else
				if isValid((0...length), board, false, row, "column")
					(0...length).each do |num|
						board[row - num]["column"] = "S".colorize(:light_cyan)
						isValidShip = true
					end
				end
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
	lengths = [2,3,4,4,5]
	(0...ships).each do |a|
		newBoard = placeShip(newBoard, lengths[a])
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
	"column" = 0
	while !isGoodCoord
		row = rand(10)
		"column" = rand(10)
		if playerBoard[row]["column"] == "O".colorize(:white)
			isGoodCoord = true
			newBoard[row]["column"] = "-".colorize(:yellow)
		end
		if playerBoard[row]["column"] == "S".colorize(:light_cyan)
			hit = true
			isGoodCoord = true
			newBoard[row]["column"] = "X".colorize(:red)
		end
	end
	return [row, "column", hit, newBoard]
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
	"column" = prompt("Guess a "column"! ").to_i - 1
	row = prompt("Guess a row! ").to_i - 1
	if computerBoard[row]["column"] == "S".colorize(:light_cyan)
		puts "\nHit!"
		computerBoard[row]["column"] = "X".colorize(:red)
		computerDisplayBoard[row]["column"] = "X".colorize(:red)
	elsif computerBoard[row]["column"] == "X".colorize(:red) || computerBoard[row]["column"] == "-".colorize(:yellow)
		puts "\nYou already guessed this spot."
	else
		puts "\nMiss!"
		computerBoard[row]["column"] = "-".colorize(:yellow)
		computerDisplayBoard[row]["column"] = "-".colorize(:yellow)
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

game(createBoard(5), createBoard(5), createBoard(0))
