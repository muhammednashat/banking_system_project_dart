import 'package:banking_system_project_dart/model/accounts/account.dart';
import 'package:banking_system_project_dart/model/accounts/transaction.dart';

class SavingAccount extends Account{
  SavingAccount(String customerName, double balance)
    : super(
        customerName: customerName,
        balance: balance,
        acountType: AccountType.savingsAccount,
      );

  @override
   Future<void> deposit(double amount) async{
    var status = Status.success;
   try{
   await isAmountValid(amount);
   setBalance(amount);
   await Future.delayed(Duration(seconds: 10));
   }catch(e){
    print(e);
    status = Status.failed;
    rethrow;
   }  
    finally{
    saveTransaction(amount, TypeTransaction.deposit, status); 
    }
  }

  @override
  Future<void> withdraw(double amount) async{
    Status status = Status.success;
    try {
     await isAmountValid(amount);
     if (amount > balance) {
     throw Exception("Insufficient funds");
     }
      decreaseBalance(amount);
      await Future.delayed(Duration(seconds: 10));
      
    } catch (e) {
      status = Status.failed;
      rethrow;
    }
   finally{
    saveTransaction(amount, TypeTransaction.withdraw, status); 
    }
  }
  
  @override
  void applyInterestOrFee() {
    final interst = balance * 5 / 100;
    setBalance(interst);
    saveTransaction(interst, TypeTransaction.interest, Status.success); 

  }
  
 
  
}
