public class Main {

    public static void main(String[] args) {

        String numberAsString = "2018.125";
        System.out.println("numberAsString = " + numberAsString);

        double number = Double.parseDouble(numberAsString);
        System.out.println("number = " + number);

        number =+ 1;

        System.out.println("number = " + number);

    }

}
