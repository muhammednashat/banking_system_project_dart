import 'package:banking_system_project_dart/model/accounts/saving_account.dart';
import 'package:banking_system_project_dart/util/bank_service.dart';

void main(List<String> args) async {
        final mohammed = SavingAccount("mohammed nashat", 1000);
     final ahmend = SavingAccount("ahmed", 1000);
  try {
   final bank = BankService();
   await bank.transferMoney(mohammed, ahmend, 50);
  } catch (e) {
    print(e);
  }finally{
    print(mohammed.balance);
    print(ahmend.balance);
  }



   
 

   


  // try {
  // print(mohammed.getBalance(mohammed.id));
  // mohammed.withdraw(55255);
  // print(mohammed.getBalance(mohammed.id));
  // } catch (e) {
  // print(e);
  // }
}
