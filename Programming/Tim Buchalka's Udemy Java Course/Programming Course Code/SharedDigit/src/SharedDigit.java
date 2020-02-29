public class SharedDigit {

    public static boolean hasSharedDigit(int first, int second) {

        if((first >= 10 && first <= 99) && (second >= 10 && second <= 99)) {

            int firstSecondNum = first % 10;
            int firstFirstNum = first / 10;

            int secondSecondNum = second % 10;
            int secondFirstNum = second / 10;

            if ((firstFirstNum == secondFirstNum || firstFirstNum == secondSecondNum)
                    || (firstSecondNum == secondFirstNum || firstSecondNum == secondSecondNum)) {
                return true;
            }

        }

        return false;

    }

}
