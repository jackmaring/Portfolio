public class DecimalComparator {

    public static boolean areEqualByThreeDecimalPlaces (double first, double second) {

        first = (int) (first * 1000);
        second = (int) (second * 1000);

        if (first == second) {
            return true;
        }

        return false;

    }

}
