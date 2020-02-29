import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        int min = 0;
        int max = 0;
        boolean first = true;

        while(true) {

            System.out.println("Enter your number or other character to exit: ");

            boolean isAnInt = scanner.hasNextInt();

            if(isAnInt) {

                int num = scanner.nextInt();

                if (first) {
                    first = false;
                    min = num;
                    max = num;
                }

                if (num < min) {
                    min = num;
                } else if (num > max) {
                    max = num;
                }

            } else {
                break;
            }

            scanner.nextLine();

        }

        scanner.close();
        System.out.println("Your min is = " + min + " and your max is = " + max);

    }

}
