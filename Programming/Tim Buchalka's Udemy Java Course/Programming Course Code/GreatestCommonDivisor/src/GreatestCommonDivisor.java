public class GreatestCommonDivisor {

    public static int getGreatestCommonDivisor(int first, int second) {

        if(first < 10 || second < 10) {
            return -1;
        }

        int stored = 0;

        for(int i=1; i<=Math.min(first, second); i++) {

            if((Math.min(first, second) % i == 0) && (Math.max(first, second) % i == 0)) {

                stored = i;

            }

        }

        return stored;

    }

}
