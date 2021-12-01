import java.util.Random;
import java.util.Scanner;

int rand, primeCount, prime1, prime2, N, phi;
int MIN = 10000;
int MAX = 1000000;

void setup() {
     Scanner scanner = new Scanner(System.in);
     System.out.println("Enter a message");
     String message = scanner.nextLine();
     println("Message: " +message);
}


void draw() {
}

void encryptMessage() {
    while(primeCount < 2) {
    Random r = new Random();
    rand = r.nextInt((MAX - MIN) + 1) + MIN; 
   if (isPrime(rand) && primeCount == 0 && rand > 0) { //<>//
      prime1 = rand;
      primeCount++;
    } else if (isPrime(rand) && primeCount == 1 && rand > 0) {
      prime2 = rand;
      N = prime1*prime2;
      phi = (prime1 -1)*(prime2-1);
      primeCount++;
      /*
      Christan Help mig med at save filen og loade den please me
      PrintWriter output = createWriter("Primes.txt");
      output.flush();
      output.close();
      */
     }
  } 
  print("Prime 1: " + prime1 + " \nPrime 2: " + prime2 + "\nN: " + N + "\nPhi(N): " + phi);
}

/*
https://stackoverflow.com/questions/20435289/prime-number-generator-logic
*/
public boolean isPrime(long num) {
    for(int i = 2; i < Math.sqrt(num); i++) {
      if(num % i == 0) {
        return false;
      }
    }
    return true;
  }
  
  
/*
https://www.geeksforgeeks.org/eulers-totient-function/
*/
public long sfd(long a, long b) {
  if(a == 0) {
    return b;
  }
  
  return sfd(b % a, a);
}

/*
https://www.geeksforgeeks.org/eulers-totient-function/
public long phi(long n) {
  long result = 1;
  for(int i = 2; i < n; i++) {
    if(sfd(i,n)==1) {
      result++;
    }
  }
  return result;
}
*/
