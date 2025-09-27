import 'dart:async';

import 'package:banking_system_project_dart/model/accounts/account.dart';

class Bank {
  final BankSchedual scheduler;
  Bank(this.scheduler);
  List<Account> accounts = [];

  void registerAcconts(List<Account> newAccounts) {
    for (var account in newAccounts) {
      accounts.add(account);
    }
  }

  Future<void> schedualMothlyCycle() async {
    await scheduler.startMonthlyCycle(accounts);
  }
}



class BankSchedual {
  Future<void> startMonthlyCycle(List<Account> accounts) async {
    int counter = 0;
    final completer = Completer();
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      counter++;
      if (counter == 4) {
        timer.cancel();
        completer.complete();
      } else {
        accounts.forEach((ac) {
          ac.applyInterestOrFee();
        });
      }
    });

    return completer.future;
  }
}
