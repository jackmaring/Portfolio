public class SumOddRange {

    public static boolean isOdd(int num) {

        if(num >= 0) {
            if(num % 2 == 1) {
                return true;
            }
        }
        return false;
    }

    public static int sumOdd(int start, int end) {

        int sum = 0;

        if((end >= start) && (end >= 0) && (start >= 0)) {

            for(int i=start; i<=end; i++) {

                if(isOdd(i)) {

                    sum += i;

                }

            }

            return sum;

        }

        return -1;

    }

}
