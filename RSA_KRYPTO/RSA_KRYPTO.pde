import controlP5.*; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

import java.util.Random;
import java.util.List;


float messageLength, value;
int ascii;
List<Integer> asc = new ArrayList<Integer>();
List<Long> encrypedMessage = new ArrayList<Long>();
//List<Double> decryptedMessage = new ArrayList<Double>();
List<Long> decryptedMessage = new ArrayList<Long>();
ArrayList<GUI> g = new ArrayList<GUI>();
int cryptedMessage;

ControlP5 cp5;
GUI gui;

void setup() {
  size(800, 600);
  fill(0);
  textSize(14);
  cp5 = new ControlP5(this);
  gui = new GUI();
  encyptMessage("Hej");
}


void draw() {
  background(215);
  String result = gui.getTextField();
  //int cryptedMessage = encryptMessage(result);
  //println(cryptedMessage+" "+result);
}

int encyptMessage(String message) {
  long p = 3; //<>//
  long q = 7;
  long n = p*q;
  long e = 5;
  long phi = (p-1)*(q-1);
  while (e < phi) {
    if (sfd(e, phi)==1) {
      break;
    } else {
      e++;
    }
  }
  long d = (1+(e*phi))/e;
  messageLength = message.length();
  for (int i = 0; i < messageLength; i++) {
    char character = message.charAt(i);
    //ascii = (float) character;
    ascii = Integer.valueOf(character) ; //<>//
    asc.add(ascii);
  }

  println("list: ", asc);
  
  
  int[] arr = new int[asc.size()];
  int index = 0;
  int val = 0;
  //for (double value : arr) {
    for (int value : arr) {
    value = asc.get(index++);
    //value = Math.round(value);
    println(value);
  }
   //<>//
  
  //Encryption
  for (int i = 0; i < asc.size(); i++) {
    long element = (int)Math.pow(asc.get(i), e);
    println("Element: ", element);
    encrypedMessage.clear();
    encrypedMessage.add(element);
  }


  //Decryption
  for (int i = 0; i < encrypedMessage.size(); i++) {
    long element = (long)Math.pow(encrypedMessage.get(i), e);
    decryptedMessage.add(element);
  }


  println("Encryption: ", encrypedMessage);
  println("Decryption: ", decryptedMessage);

  return cryptedMessage;
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
public long sfd(float a, float b) {
  if (a == 0) {
    return (long) b;
  }

  return sfd(b % a, a);
}
