public class LargestPrime {

    public static int getLargestPrime(int num) {

        if(num <= 1) {
            return -1;
        }

        int stored = 0;

        for(int i=2; i<=num; i++) {

            if(num % i == 0) {
                stored = i;
                num /= i;
                i--;
            }


        }

        return stored;

    }

}
