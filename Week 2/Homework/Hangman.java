import java.util.*;
import java.util.Scanner;
import java.util.concurrent.ThreadLocalRandom;
public class Hangman{
	public static void main(String[] args) {
		String[] words = new String[20];
		words[0] = "PIZZA";
		words[1] = "CHEESE";
		words[2] = "ICE";
		words[3] = "CHICKEN";
		words[4] = "JAZZ";
		words[5] = "ABRUPTLY";
		words[6] = "COMPUTER";
		words[7] = "BOARD";
		words[8] = "PICTURE";
		words[9] = "GALAXY";
		words[10] = "FIXABLE";
		words[11] = "JIGSAW";
		words[12] = "INJURY";
		words[13] = "KAZOO";
		words[14] = "KEYHOLE";
		words[15] = "WIZARD";
		words[16] = "YOUTHFUL";
		words[17] = "WALKWAY";
		words[18] = "DOG";
		words[19] = "CAT";
		String randomWord = words[(ThreadLocalRandom.current().nextInt(0, 20))];
		char[] characters = randomWord.toCharArray();
		String guessedString = "";
		ArrayList avalableLetters = new ArrayList();
		for (char character : characters) {
			guessedString = guessedString + " _";
			if(!avalableLetters.contains(String.valueOf(character))){
				avalableLetters.add(String.valueOf(character));
			}
		}
		game(randomWord, guessedString, avalableLetters, 10, new ArrayList());
	}
	public static void game(String word, String guessedString, ArrayList letters, int guesses, ArrayList guessedLetters){
		Scanner scanner = new Scanner(System.in);
		System.out.println(" ");
		System.out.println(guessedString);
		System.out.println(" ");
		if(guessedLetters.size() >= 1){
			String guessedLettersString = listToString(guessedLetters);
			System.out.println("Current Guesses: " + guessedLettersString);
		}
		System.out.print("Guess a letter: ");
		String letter = String.valueOf(scanner.next().replaceAll("[^a-zA-Z]", "").toCharArray()[0]).toUpperCase();
		guessedLetters.add(letter);
		if(letters.contains(letter)){
			ArrayList indexes = getIndexesOfLetter(word, letter);
			for(int i = 0; i < indexes.size(); i++) {
				int index = Integer.valueOf(String.valueOf(indexes.get(i))) * 2 + 1;
				guessedString = guessedString.substring(0, index) + letter + guessedString.substring(index + 1);
			}
			System.out.println(" ");
			System.out.println("Correct!");
			if(didWin(guessedString)){
				System.out.println("Congatulations! You Won!");
				System.out.println(guessedString);
				System.out.println(" ");
			}
			else{
				game(word, guessedString, letters, guesses, guessedLetters);
			}
		}
		else{
			String guessedLettersString = listToString(guessedLetters);
			System.out.println(" ");
			System.out.println("Wrong Guess!");
			if (guesses == 1){
				System.out.println("Game Over! The word was " + word);
			}
			else{
				if (guesses == 2) {
					System.out.println("You have 1 more guess!");
				}
				else{
					System.out.println("You have " + (guesses - 1)  +  " more guesses!");
				}
				game(word, guessedString, letters, (guesses - 1), guessedLetters);
			}
		}
	}

	public static ArrayList getIndexesOfLetter(String word, String letter){
		char[] characters = word.toCharArray();
		ArrayList indexes = new ArrayList();
		int i = 0;
		for (char character : characters) {
			if(character == letter.toCharArray()[0]){
				indexes.add(i);
			}
			i = i + 1;
		}
		return indexes;
	}

	public static boolean didWin(String guessedString){
		boolean didWin = true;
		char[] characters = guessedString.toCharArray();
		for (char character : characters) {
			if (character == "_".toCharArray()[0]){
				didWin = false;
			}
		}
		return didWin;
	}

	public static String listToString(ArrayList list){
		String finalString = "";
		for(int i = 0; i < list.size(); i++){
			if(i == list.size() - 1 && list.size() > 1){
				finalString = finalString + String.valueOf(list.get(i));
			}
			else if(list.size() == 1 || list.size() == 2){
				finalString = finalString + String.valueOf(list.get(i)) + " ";
			}
			else{
				finalString = finalString + String.valueOf(list.get(i)) + ", ";
			}
		}
		return finalString;
	}
}
