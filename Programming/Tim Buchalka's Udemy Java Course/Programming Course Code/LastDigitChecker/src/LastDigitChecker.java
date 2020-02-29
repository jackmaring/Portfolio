public class LastDigitChecker {

    public static boolean hasSameLastDigit(int first, int second, int third) {

        int firstLastNum = first % 10;
        int secondLastNum = second % 10;
        int thirdLastNum = third % 10;

        if(isValid(first) && isValid(second) && isValid(third)) {

            if(firstLastNum == secondLastNum || firstLastNum == thirdLastNum) {
                return true;
            } else if (secondLastNum == thirdLastNum) {
                return true;
            }

        }

        return false;

    }

    public static boolean isValid(int num) {

        if(num >= 10 && num <= 1000) {

            return true;

        }

        return false;

    }

}
