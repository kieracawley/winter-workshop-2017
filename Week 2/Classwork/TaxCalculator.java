import java.util.Scanner;
public class TaxCalculator{
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("What would you like to purchase? Food or Merchandise? ");
		String typeOfProduct = scanner.next().replaceAll("[^a-zA-Z]", "").toLowerCase();
		System.out.print(String.format("What type of %s would you like to purchase? ", typeOfProduct));
		String product = scanner.next().replaceAll("[^a-zA-Z]", "");
		System.out.print("How much is it? ");
		double price = Double.parseDouble(scanner.next().replaceAll("[^\\d.]", ""));;
		System.out.print("Quantity? ");
		double amount = Double.parseDouble(scanner.next().replaceAll("[^\\d.]", ""));
		System.out.print("How much do you want to tip? ");
		double tip = Double.parseDouble(scanner.next().replaceAll("[^\\d.]", ""));
		double totalCost = (double) (price * amount) + (price * amount * 0.08875) + (price * amount * (tip/100));
		int hours = (int) Math.ceil(totalCost/7.7);
		System.out.print("It will take " + hours + " hours of working." + System.getProperty("line.separator"));
	}
}
