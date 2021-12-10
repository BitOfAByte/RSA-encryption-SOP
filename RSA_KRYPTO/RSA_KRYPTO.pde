import controlP5.*; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

import java.util.Random;
import java.util.List;
import java.math.BigInteger;

float messageLength, value;
int ascii;
List<Integer> asc = new ArrayList<Integer>();
List<Long> encrypedMessage = new ArrayList<Long>();
//List<Double> decryptedMessage = new ArrayList<Double>();
List<Long> decryptedMessage = new ArrayList<Long>();
ArrayList<GUI> g = new ArrayList<GUI>();
BigInteger cryptedMessage;
BigInteger bigI;

ControlP5 cp5;
GUI gui;

EuklidsAlgo EA;

void setup() {
  size(800, 600);
  fill(0);
  textSize(14);
  cp5 = new ControlP5(this);
  gui = new GUI();
  EA = new EuklidsAlgo();
  encyptMessage("H");
}


void draw() {
  background(215);
  String result = gui.getTextField();
  //int cryptedMessage = encryptMessage(result);
  //println(cryptedMessage+" "+result);
}

/*
* https://www.geeksforgeeks.org/rsa-algorithm-cryptography/
 * https://github.com/ergesmema/RSA-Java/blob/main/src/RSA/RSA.java
 */

BigInteger encyptMessage(String message) {
  BigInteger p = BigInteger.valueOf(1031);
  BigInteger q = BigInteger.valueOf(907);
  BigInteger n = p.multiply(q);
  BigInteger phi = p.subtract(BigInteger.ONE).multiply(q.subtract(BigInteger.ONE)); //Det er det samme som (p-1)*(q-1);
  BigInteger e = BigInteger.valueOf(49);
  BigInteger gcd = gcd(e, phi);
  //modInverse Does not exist
  BigInteger d = EA.modInverse(e, phi);

  messageLength = message.length();
  for (int i = 0; i < messageLength; i++) {
    char character = message.charAt(i);
    ascii = (int) character;
    asc.add(ascii);
  }
  
  /*
  *The method pow(double, double) in the type Math is not applicable for the arguments (Double, BigInteger)
  */
  for (int i = 0; i < asc.size(); i++) {
    double element = Math.pow(asc.get(i), e) % n;
    encrypedMessage.add(element);
  }
  
  /*
  *The method pow(double, double) in the type Math is not applicable for the arguments (Double, BigInteger)
  */
  for (int i = 0; i < encrypedMessage.size(); i++) {
    double element = Math.pow(encrypedMessage.get(i), d) % n;
    decryptedMessage.add(element);
  }
  
  cryptedMessage = (BigInteger) encrypedMessage;
  println(cryptedMessage);
  return cryptedMessage;
}

/*
* https://github.com/ergesmema/RSA-Java/blob/main/src/RSA/RSA.java
 * Line: 51
 */
public BigInteger gcd(BigInteger a, BigInteger b) {
  if (BigInteger.ZERO.equals(b)) {
    return a;
  }
  BigInteger gcd = gcd(b, a.mod(b));
  return gcd;
}
