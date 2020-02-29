package com.packageexample;

public class Series {

    public static int nSum(int num) {
        int sum = 0;
        for(int i=0; i<num; i++) {
            sum += (num - i);
        }
        return sum;
    }

    public static int factorial(int num) {
        int product = 1;
        for(int i=0; i<num; i++) {
            product *= (num - i);
        }
        return product;
    }

    public static int fibonacci(int num) {
        if(num == 0) {
            return 0;
        } else if(num == 1) {
            return 1;
        }
        int nMinus1 = 1;
        int nMinus2 = 0;
        int fib = 0;
        for(int i=1; i<num; i++) {
            fib = (nMinus2 + nMinus1);
            nMinus2 = nMinus1;
            nMinus1 = fib;
        }
        return fib;
    }

}
