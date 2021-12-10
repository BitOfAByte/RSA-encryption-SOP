import java.math.BigInteger;

public class EuklidsAlgo {
  BigInteger gcd;
  BigInteger y;
  BigInteger x;
  
  public EuklidsAlgo(BigInteger gcd, BigInteger x, BigInteger y) {
    this.gcd = gcd;
    this.x = x;
    this.y = y;
  }
}

public EuklidsAlgo extendedEuclideanAlgo(BigInteger a, BigInteger b) {

  if (BigInteger.ZERO.equals(b)) {
    return new EuklidsAlgo(a, BigInteger.ONE, BigInteger.ZERO);
  }
  EuklidsAlgo ans = extendedEuclideanAlgo(b, a.mod(b));

  EuklidsAlgo result = new EuklidsAlgo(ans.gcd, ans.y, ans.x.subtract((a.divide(b)).multiply(ans.y)));
  return result;
}

public BigInteger modInverse(BigInteger a, BigInteger m) {
  EuklidsAlgo ans = extendedEuclideanAlgo(a, m);
  return  (ans.x.mod(m).add(m)).mod(m);
}
