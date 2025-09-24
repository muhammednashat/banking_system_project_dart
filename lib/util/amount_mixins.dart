mixin AmountMixins {

  
  bool isAmountValid(double amount) {
    if (amount < 0) {
      throw Exception("Negative amounts is not allowed");
    }
    if (amount == 0) {
      throw Exception("You must enter amount grater than 0");
    }
     
    return true;
  }
}
