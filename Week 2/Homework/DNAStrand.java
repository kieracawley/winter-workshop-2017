import java.util.Scanner;
public class DNAStrand{
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Enter a DNA strand: ");
		String dnaStrand = scanner.nextLine();
		char[] characters = dnaStrand.toCharArray();
		String finalString = "";
		for (char character : characters) {
			if (character == "G".charAt(0)){
				finalString = "C" + finalString;
			}
			else if (character == "C".charAt(0)){
				finalString = "G" + finalString;
			}
			else if (character == "A".charAt(0)){
				finalString = "T" + finalString;
			}
			else if (character == "T".charAt(0)){
				finalString = "A" + finalString;
			}
			else{
				finalString = " " + finalString;
			}
		}
		System.out.print(finalString + System.getProperty("line.separator"));
	}
}
