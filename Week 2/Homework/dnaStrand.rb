def prompt(*args)
    print(*args)
    gets
end
dna_strand = (prompt "Enter a DNA strand: ").split("")
finalString = ""
dna_strand.each do |character|
	if character == "G"
		finalString = "C" + finalString;
	elsif character == "C"
		finalString = "G" + finalString;
	elsif character == "A"
		finalString = "T" + finalString;
	elsif character == "T"
		finalString = "A" + finalString;
	else
		finalString = " " + finalString;
	end
end
puts finalString
