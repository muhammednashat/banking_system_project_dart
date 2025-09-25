mixin AmountMixins {

  
 Future<void> isAmountValid(double amount)async {
   print("Check validation.........");

    if (amount < 0) {
      throw Exception("Negative amounts is not allowed");
    }
    if (amount == 0) {
      throw Exception("You must enter amount grater than 0");
    }
   await Future.delayed(Duration(seconds: 5));
   print("Validation passed ");
  }
}
