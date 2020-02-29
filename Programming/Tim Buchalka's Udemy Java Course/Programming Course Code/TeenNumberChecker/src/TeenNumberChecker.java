public class TeenNumberChecker {

    public static boolean hasTeen (int first, int second, int third) {

        if(first >= 13 && first <= 19) {
            return true;
        }
        if(second >= 13 && second <= 19) {
            return true;
        }
        if(third >= 13 && third <= 19) {
            return true;
        }

        return false;
    }

    public static boolean isTeen (int num) {

        if (num >= 13 && num <= 19) {
            return true;
        }

        return false;

    }

}
