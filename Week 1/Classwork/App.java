public class App {
 	public static void main(String[] args) {
    // Different data types
		String myString = "Hello";
		System.out.println(myString);
		int myInteger = 3;
		System.out.println(myInteger);
		double myDouble = 4.2;
		System.out.println(myDouble);
		boolean myBoolean = false;
		System.out.println(myBoolean);

    // String concatination
    String stringA = "hello";
    String stringB = "world";
    int integerA = 4;
    String finalString = stringA + stringB;
    String finalString2 = stringA + " " +Integer.toString(integerA);
    System.out.println(finalString);
    System.out.println(finalString2);

    // Math
    int integer1 = 34;
    int integer2 = 74;
    int integer3 = 51;
    double double1 = 5.7;
    double double2 = 91.8;
    double double3 = 38.6;
    System.out.println(integer1 + " + " + double1 + " = " + ((double)integer1+double1));
    System.out.println(integer3 + " - " + double3 + " = " + ((double)integer3-double3));
    System.out.println(double2 + " x " + double3 + " = " + ((double)double2*double3));
    System.out.println(integer1 + " / " + integer2 + " = " + ((double)integer1/integer2));
	}
}
