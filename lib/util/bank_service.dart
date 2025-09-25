import 'package:banking_system_project_dart/model/accounts/account.dart';

class BankService {


  Future<void> transferMoney(Account from, Account to, double amount)async{
    try{
     await from.withdraw(amount);
     await _addMonyToReciver(from,to, amount);
    }catch(e){
      rethrow;
    }

  }
   Future<void> _addMonyToReciver(Account from, Account to, double amount)async{
     
     try{
     await to.deposit(amount);
    }catch(e){
      await from.deposit(amount);
      rethrow;
    }
   
   }
  
}