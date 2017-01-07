public class Calculator{
	public static void main(String[] args) {
		if(args.length == 3){
			double amountOfMoney = Double.parseDouble(args[0]);
			double amountOfMonths = (double) Integer.parseInt(args[1]);
			double intrestRate = (double) Integer.parseInt(args[2]);
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
				amountOfMoney = amountOfMoney + ((intrestRate/100) * amountOfMoney);
			}
		}
		else{
			System.out.println("Enter 3 arguments in the order (amount of money, amount of months, interest rate)");
		}
	}
}
