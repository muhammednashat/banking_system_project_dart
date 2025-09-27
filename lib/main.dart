import 'package:banking_system_project_dart/model/accounts/account.dart';
import 'package:banking_system_project_dart/model/accounts/saving_account.dart';
import 'package:banking_system_project_dart/model/bank.dart';
import 'package:banking_system_project_dart/util/bank_service.dart';

void main(List<String> args) async {
  final schedualer = BankSchedual();
  final bank = Bank(schedualer);

  final List<Account> accounts = [
    SavingAccount("mohammed", 100),
    SavingAccount("nashat", 1200),
    SavingAccount("ahmed", 500),
  ];

  bank.registerAcconts(accounts);
  final service = BankService() ;
  service.transferMoney(accounts[0], accounts[1], 20);

  // await bank.schedualMothlyCycle();
}
