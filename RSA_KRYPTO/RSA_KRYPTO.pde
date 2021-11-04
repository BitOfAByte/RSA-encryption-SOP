import java.util.Random;

long rand, primeCount, prime1, prime2;



void setup() {
}


void draw() {
  encryptMessage();
}

//Fixme
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


//Works! 
boolean isPrime(long num) {
  for(int i = 2; i < Math.sqrt(num); i++) {
    if(num % i == 0) {
      print("NOPE");
      return false;
    }
  }
  print("Yes! " + num);
  return true;
}
