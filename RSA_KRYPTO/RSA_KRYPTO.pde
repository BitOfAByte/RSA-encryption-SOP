import java.util.Random;

long rand, primeCount, prime1, prime2;



void setup() {
}


void draw() {
}

void encryptMessage() {
    while(primeCount < 2) {
    Random r = new Random();
    rand = r.nextLong();
    if (isPrime(rand) && primeCount == 0) {
      prime1 = rand;
      primeCount++;
    } else if (isPrime(rand) && primeCount == 1) {
      prime2 = rand;
      primeCount++;     
     }
  } 
  print(prime1 + " " + prime2);
}

public boolean isPrime(long num) {
    for(int i = 2; i < Math.sqrt(num); i++) {
      if(num % i == 0) {
        return false;
      }
    }
    return true;
  }
