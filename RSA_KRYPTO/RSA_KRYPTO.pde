import controlP5.*; //<>//

import java.util.Random;
import java.util.List;

int rand, primeCount, prime1, prime2, phi;
float e, d, messageLength, ascii, N;

int MIN = 100;
int MAX = 500;
List<Float> asc = new ArrayList<Float>();
ArrayList<GUI> g = new ArrayList<GUI>();

ControlP5 cp5;
GUI gui;

void setup() {
  size(800, 600);
   fill(0);
   textSize(14);
   cp5 = new ControlP5(this);
   gui = new GUI();
  //encryptMessage("Hej");
}


void draw() {
  background(215);
}

void encryptMessage(String message) {
  while (primeCount < 2) {
    Random r = new Random();
    rand = r.nextInt((MAX - MIN) + 1) + MIN;
    if (isPrime(rand) && primeCount == 0 && rand > 0) {
      prime1 = rand;
      primeCount++;
    } else if (isPrime(rand) && primeCount == 1 && rand > 0) {
      prime2 = rand;
      N = prime1*prime2;
      phi = (prime1 -1)*(prime2-1);
      primeCount++;
      e = N/phi*4003*1/2;
      d = e-1 % phi;
      messageLength = message.length();
      for (int i = 0; i < messageLength; i++) {
        char character = message.charAt(i);
        ascii = (float) character;
        asc.add(ascii);
      }
      /*
      Virker perfekt.... 
      PrintWriter output = createWriter("Primes.txt");
       output.println("Prime 1: " + prime1 + "\nPrime 2: " + prime2 + "\nN: " + N + "\nPhi: " + phi + "\nASCII: " + asc);
       output.flush();
       output.close();
       */
       
      //Virker ikke.... Den outputter 0.0 
      final float[] arr = new float[asc.size()];
      int index = 0;
      for (final Float value : arr) {
        arr[index++] = value;
        println(value);
      }
    }
  }
  println("Prime 1: " + prime1 + " \nPrime 2: " + prime2 + "\nN: " + N + "\nPhi(N): " + phi + "\nAscii " + asc + "\ne: " + e + "\nd: " + d);
}

/*
https://stackoverflow.com/questions/20435289/prime-number-generator-logic
 */
public boolean isPrime(long num) {
  for (int i = 2; i < Math.sqrt(num); i++) {
    if (num % i == 0) {
      return false;
    }
  }
  return true;
}


/*
https://www.geeksforgeeks.org/eulers-totient-function/
 */
public long sfd(long a, long b) {
  if (a == 0) {
    return b;
  }

  return sfd(b % a, a);
}

/*
ControlP5 2.2.6 infos, comments, questions at http://www.sojamo.de/libraries/controlP5
Dec 05, 2021 6:55:29 PM controlP5.ControlP5 checkName
WARNING: Controller with name "/encr" already exists. overwriting reference of existing controller.
Dec 05, 2021 6:55:29 PM controlP5.ControlP5 checkName
WARNING: Controller with name "/text" already exists. overwriting reference of existing controller.
[RSA_KRYPTO$GUI@3acf5fbe]
*/
public void encr() {
  String result = cp5.get(Textfield.class, "text").getText();
  GUI FUCK = new GUI();
  gui.setTask(result);
  g.add(FUCK);
  print(g);
  clear();
}

public void clear() {
  cp5.get(Textfield.class, "text").clear();
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
