import java.util.Random;

long rand, primeCount, prime1, prime2, N, phi;


void setup() {
  encryptMessage();
}


void draw() {
}

void encryptMessage() {
    while(primeCount < 2) {
    Random r = new Random();
    
    // hvis problemet er at du får negative tal, så brug et mindre primtal. De negative tal kommer fordi datatypen (long) ikke er stor nok og derfor starter den bare forfra. (overflow) 
    //rand = r.nextLong();
    rand = r.nextInt();
    if (isPrime(rand) && primeCount == 0 && rand > 0) { //<>//
      prime1 = rand;
      primeCount++;
    } else if (isPrime(rand) && primeCount == 1 && rand > 0) {
      prime2 = rand;
      N = prime1*prime2;
      phi = (prime1 -1)*(prime2-1);
      primeCount++;
      /*
      Fix me
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
