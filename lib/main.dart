
import 'package:banking_system_project_dart/model/accounts/saving_account.dart';

void main(List<String> args) {

  final mohammed = SavingAccount("mohammed nashat", 100);
  try {
  print(mohammed.getBalance(mohammed.id)); 
  mohammed.withdraw(55255); 
  print(mohammed.getBalance(mohammed.id)); 
  } catch (e) {
  print(e);    
  } 
 
  

}