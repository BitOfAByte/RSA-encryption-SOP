import controlP5.*; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

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

ExtendedEuclidean Euclidean;

void setup() {
  size(800, 600);
  fill(0);
  textSize(14);
  cp5 = new ControlP5(this);
  gui = new GUI();
  Euclidean = new ExtendedEuclidean();
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
  BigInteger phi = p.subtract(BigInteger.ONE).multiply(q.subtract(BigInteger.ONE));
  BigInteger e = BigInteger.valueOf(49);
  BigInteger d = Euclidean.modInverse(e, phi);
  String msg = message;
  byte[] b = msg.getBytes();
  
  println("P:", p + " Q:", q + " N:", n + " Phi:", phi + " E:", e + " D:", d);
  
  cryptedMessage = encrypt(b, e, n);
  println(cryptedMessage);
  
  BigInteger dMessage = decrypt(b,d,n);
  println(dMessage);
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

public BigInteger modPow(BigInteger base, BigInteger exponent, BigInteger mod) {
  if (exponent.equals(BigInteger.ZERO)) {
    return BigInteger.ONE;
  }
  BigInteger z = modPow(base, exponent.divide(BigInteger.TWO), mod);
  if (exponent.mod(BigInteger.TWO).equals(BigInteger.ZERO)) {
    return z.multiply(z).mod(mod);
  } else
    return base.multiply(z.multiply(z)).mod(mod);
}


public BigInteger encrypt(byte[] message, BigInteger e, BigInteger N) {
  return modPow(new BigInteger(message), e, N);
}

public BigInteger decrypt(byte[] message, BigInteger d, BigInteger N) {
  return modPow(new BigInteger(message), d, N);
}
