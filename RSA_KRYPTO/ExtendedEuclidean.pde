import java.math.BigInteger;
/*
* Det er ikke mig der har skrevet denne kode
* https://github.com/ergesmema/RSA-Java
*/

public class ExtendedEuclidean{
    public class Triplet{
        //Laver en datatype 
        BigInteger a;
        BigInteger x;
        BigInteger y;
        
        //Constructor er en metode der forklare hver gang du laver en instance af klassen hvad der skal indeholde
        public Triplet(BigInteger a, BigInteger x, BigInteger y){
            this.a = a;
            this.x = x;
            this.y = y;
        }
    }

    public Triplet gcd(BigInteger a, BigInteger b){

        if(BigInteger.ZERO.equals(b)){
            return new Triplet(a, BigInteger.ONE, BigInteger.ZERO);
        }
        Triplet ans = extendedEuclideanAlgo(b, a.mod(b));
        return ans;
    }
    
    //a=e b=phi
    public Triplet extendedEuclideanAlgo(BigInteger a, BigInteger b){
      //Check hvis phi = 0
        if(BigInteger.ZERO.equals(b)){
            //Triplet(a,x,y)
                return new Triplet(a, BigInteger.ONE, BigInteger.ZERO);
        }
        //b=phi e mod phi
        Triplet ans = extendedEuclideanAlgo(b, a.mod(b));
        
        //result = (a,y,x-a/b*y)
        Triplet result = new Triplet(ans.a, ans.y, ans.x.subtract((a.divide(b)).multiply(ans.y)));
        return result;
    }
    
    //a=e m=phi
    public BigInteger modInverse(BigInteger a, BigInteger m){
        Triplet ans = extendedEuclideanAlgo(a, m);
        //D=((x mod phi + phi) mod phi)
            return  (ans.x.mod(m).add(m)).mod(m);
    }

}
