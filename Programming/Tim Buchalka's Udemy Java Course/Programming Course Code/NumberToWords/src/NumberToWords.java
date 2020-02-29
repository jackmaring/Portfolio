public class NumberToWords {

    public static void numberToWords(int num) {

        if (num < 0) {
            System.out.println("Invalid Value");
        }
        int reverseNumber = reverse(num);
        int originalCount = getDigitCount(num);
        int reversedCount = getDigitCount(reverseNumber);

        if (reverseNumber == 0) {
            System.out.println("Zero");
        }
        int reverseDigit;
        while (reverseNumber != 0) {
            reverseDigit = reverseNumber % 10;
            switch (reverseDigit) {
                case 0:
                    System.out.println("Zero");
                    break;
                case 1:
                    System.out.println("One");
                    break;
                case 2:
                    System.out.println("Two");
                    break;
                case 3:
                    System.out.println("Three");
                    break;
                case 4:
                    System.out.println("Four");
                    break;
                case 5:
                    System.out.println("Five");
                    break;
                case 6:
                    System.out.println("Six");
                    break;
                case 7:
                    System.out.println("Seven");
                    break;
                case 8:
                    System.out.println("Eight");
                    break;
                case 9:
                    System.out.println("Nine");
                    break;
            }
            reverseNumber /= 10;
        }
        while (reversedCount != originalCount) {
            System.out.println("Zero");
            reversedCount++;
        }

    }

    public static int reverse(int num) {

        int reverse = 0;

        while(num != 0) {
            int slicedOff = num % 10;
            reverse *= 10;
            reverse += slicedOff;
            num /= 10;
        }

        return reverse;

    }

    public static int getDigitCount(int num) {

        if(num < 0) {
            return -1;
        }

        if(num == 0) {
            return 1;
        }

        int counter = 0;

        while(num > 0) {

            num /= 10;
            counter++;

        }

        return counter;

    }

}
