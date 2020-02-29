public class NumberPalindrome {

    public static boolean isPalindrome(int num) {

        int trueNum = num;
        int reverse = 0;

        while(num != 0) {
            int slicedOff = num % 10;
            reverse *= 10;
            reverse += slicedOff;
            num /= 10;
        }

        if(reverse == trueNum) {
            return true;
        } else {
            return false;
        }

    }

}
