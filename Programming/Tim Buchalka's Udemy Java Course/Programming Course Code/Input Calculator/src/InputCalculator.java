import java.util.Scanner;

public class InputCalculator {

    public static void inputThenPrintSumAndAverage() {

        int sum = 0;
        int counter = 0;

        Scanner scanner = new Scanner(System.in);

        while(true){

            boolean isAnInt = scanner.hasNextInt();

            if(isAnInt) {

                int num = scanner.nextInt();
                sum += num;
                counter++;

            } else {
                break;
            }

        }

        scanner.close();
        System.out.println("SUM = " + sum + " AVG = " + Math.round( (double) sum/counter ));

    }

}
