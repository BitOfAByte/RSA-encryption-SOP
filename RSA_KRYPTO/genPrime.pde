class genPrime {
  //Fix me
  public boolean isPrime(long num) {
    for(int i = 2; i < Math.sqrt(num); i++) {
      if(num % i == 0) {
        return false;
      }
    }
    return true;
  }
}
