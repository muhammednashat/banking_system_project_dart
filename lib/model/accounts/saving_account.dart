import 'package:banking_system_project_dart/model/accounts/account.dart';
import 'package:banking_system_project_dart/model/accounts/account_type.dart';

class SavingAccount extends Account{
  SavingAccount(String customerName, double balance)
    : super(
        customerName: customerName,
        balance: balance,
        acountType: AccountType.savingsAccount,
      );

  @override
  bool deposit(double amount) {
   try{
   isAmountValid(amount);
   setBalance(amount);
   print("Your balance is increased now");
   return true;
   }catch(e){
    print(e);
    rethrow;
   }  
 
  }

  @override
  bool withdraw(double amount) {
    try {
      isAmountValid(amount);
     if (amount > balance) {
     throw Exception("Insufficient funds");
     }

      decreaseBalance(amount);
      print("Wait for your money....");
      Future.delayed(Duration(microseconds: 500));
      print("Your money is ready ");
      return true;
    } catch (e) {
      print(e);
      rethrow;
    }
  
  
  }
}
