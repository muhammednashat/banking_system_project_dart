import 'dart:async';

import 'package:banking_system_project_dart/model/accounts/transaction.dart';
import 'package:banking_system_project_dart/util/amount_mixins.dart';
import 'package:uuid/uuid.dart';

enum AccountType { savingsAccount, checkingAccount }

abstract class Account with AmountMixins {
  
  final StreamController<Transaction> _streamController = StreamController();
  Stream<Transaction> get transactionStream => _streamController.stream;


  final String id = Uuid().v4();
  final DateTime dateOpened = DateTime.now();
  final String customerName;
  final AccountType acountType;
  final List<Transaction> transactions = [];

  double _balance;

  Account({
    required this.customerName,
    required this.acountType,
    required double balance,
  }) : _balance = balance{
    registerListerToTransacions();
    saveTransaction(balance, TypeTransaction.newAccount, Status.success);
  }


   void registerListerToTransacions(){
    transactionStream.listen((tr){
     print(tr); 
       print('--------------------');
    });
   }


  Future<void> withdraw(double amount);

  Future<void> deposit(double amount);


  void applyInterestOrFee();

  double getBalance(String id) {
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

  
  void  saveTransaction(
    double amount,
    TypeTransaction type,
    Status status,
  ){
    final transaction = Transaction(id, amount, balance, status, type);
    transactions.add(transaction);
    _streamController.add(transaction);
  }

  void printHistory(){
    for (var element in transactions) {
      print(element);
    }
  }


   void dispose(){
     _streamController.close();
   }
}
