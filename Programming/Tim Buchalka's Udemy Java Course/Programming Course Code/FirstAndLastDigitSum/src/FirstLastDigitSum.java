public class FirstLastDigitSum {

    public static int sumFirstAndLastDigit(int num) {

        if(num < 0) {
            return -1;
        }

        int lastNum = num % 10;

        while(num >= 10) {

            num /= 10;

        }

        return lastNum + num;

    }

}
