print("Enter a DNA strand: ", terminator: "")
let dnaStrand = String(readLine()!)
let characters = dnaStrand!.characters
var finalString = ""
for character in characters{
	if character == "G"{
		finalString = "C" + finalString
	}
	else if character == "C"{
		finalString = "G" + finalString
	}
	else if character == "A"{
		finalString = "T" + finalString
	}
	else if character == "T"{
		finalString = "A" + finalString
	}
	else{
		finalString = " " + finalString 
	}
}
print(finalString)
