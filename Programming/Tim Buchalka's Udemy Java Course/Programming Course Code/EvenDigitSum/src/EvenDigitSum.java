public class EvenDigitSum {

    public static int getEvenDigitSum(int num) {

        if(num < 0) {
            return -1;
        }

        int sum = 0;
        int slicedOff;

        while(num > 0) {

            slicedOff = num % 10;

            if(slicedOff % 2 == 0) {

                sum += slicedOff;

            }

            num /= 10;

        }

        return sum;

    }

}
