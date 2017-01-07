public class Calculator{
	public static void main(String[] args) {
		if(args.length == 2){
			double amountOfMoney = Double.parseDouble(args[0]);
			double amountOfMonths = (double) Integer.parseInt(args[1]);
			double interestRate = (int) (Math.random() * 15 + 5);
			System.out.println("Interest Rate: " + String.valueOf((int)interestRate) + "%");
			for(int i = 0; i <= amountOfMonths; i++){
				int decimalPlace = (int)((amountOfMoney % 1) * 100);
				String decimalPlaceString = String.valueOf(decimalPlace);
				if(decimalPlace < 10){
					decimalPlaceString = "0" + String.valueOf(decimalPlace);
				}
				int dollarsPlace = (int)(amountOfMoney - (amountOfMoney % 1));
				String dollarsPlaceString = String.valueOf(dollarsPlace);
				String timePassed = "";
				if(i == 1){
					timePassed = "1 month: ";
				}
				else{
					timePassed = String.valueOf(i) + " months: ";
				}
				System.out.println(timePassed + "$" + dollarsPlaceString + "." + decimalPlaceString);
				amountOfMoney = amountOfMoney + ((interestRate/100) * amountOfMoney);
			}
		}
		else{
			System.out.println("Enter 2 arguments in the order (amount of money, amount of months)");
		}
	}
}
