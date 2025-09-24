import 'package:banking_system_project_dart/model/accounts/account_type.dart';
import 'package:banking_system_project_dart/util/amount_mixins.dart';
import 'package:uuid/uuid.dart';

abstract class Account with AmountMixins {
  final String id;
  final String customerName;
  final AccountType acountType;
  double _balance;
  final DateTime dateOpened;

  Account({
    required this.customerName,
    required this.acountType,
    required double balance,
  }) : id = Uuid().v4(),
       dateOpened = DateTime.now(),
       _balance = balance;


  bool withdraw(double amount);

  bool deposit(double amount);

  double getBalance (String id){
    if (id != this.id) {
      throw Exception("You not allowed to get balance");
    }
    return balance;
  }

  double get balance => _balance;
  void setBalance(double amount) => _balance += amount;
  void decreaseBalance(double amount) => _balance -= amount; 
  @override
  String toString() {
    return "{ id = $id ,customerName = $customerName , acountType = $acountType , dateOpened = $dateOpened , }";
  }
}
