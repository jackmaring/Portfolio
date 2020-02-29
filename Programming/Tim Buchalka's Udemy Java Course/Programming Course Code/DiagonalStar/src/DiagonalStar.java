public class DiagonalStar {


    public static void printSquareStar (int num) {

        if (num < 5) {
            System.out.println("Invalid Value");
        } else {

            for (int i = 1; i <= num; i++) {

                for (int j = 1; j <= num; j++) {

                    if (i == 1 || i == j || j == 1 || i == num || j == num || (j == num - i + 1)) {
                        System.out.print("*");
                    } else {
                        System.out.print(" ");
                    }

                }
                System.out.println();
            }
        }
    }
}