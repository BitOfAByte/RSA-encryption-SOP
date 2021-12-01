import java.io.*;
import java.util.Random;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;

public class Main {
    static long primeCount, rand, prime1, prime2, n, phi, rand2, e, d, c;
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter a message");
        String message = scanner.nextLine();
        genPrimes(message);
    }


    public static void genPrimes(String message) {
        while(primeCount < 2) {
            Random r = new Random();
            rand = r.nextLong();
            if(isPrime(rand) && primeCount == 0 && rand > 0) {
                prime1 = rand;
                primeCount++;
            } else if(isPrime(rand) && primeCount == 1 && rand > 0) {
                primeCount++;
                prime2 = rand;
                n = prime1 * prime2;
                phi = (prime1 - 1) * (prime2 - 1);
                Random random = new Random();
                rand2 = random.nextLong();
                if(e != 0 && e < phi && sfd(e,phi) == 1) {
                    e = rand2;
                }
                //c = (long) (Math.pow(Double.parseDouble(message),e) % n);
                System.out.println("Prime 1 " + prime1 + " Prime 2: " + prime2 + " e: " + e);
                System.out.println("Encrypted message is " + c);
            }
        }

    }

    static boolean isPrime(long num) {
        for(int i = 2; i < Math.sqrt(num); i++) {
            if(num % i == 0)
                return false;

        }
        return true;
    }

    /*
https://www.geeksforgeeks.org/eulers-totient-function/
*/
    public static long sfd(long a, long b) {
        if(a == 0) {
            return b;
        }
        return sfd(b % a, a);
    }
}
