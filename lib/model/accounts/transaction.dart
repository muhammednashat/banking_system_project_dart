
enum TypeTransaction{
  newAccount,
  deposit,
  withdraw,
  interest,
  fee,
}

enum Status{
  success,
  failed
}


class Transaction {
final String accountId;
final double amount;
final double balanceAfter;
final Status status;
final TypeTransaction type;
final DateTime dateTime = DateTime.now();

Transaction(this.accountId, this.amount, this.balanceAfter ,this.status, this.type,);

@override
  String toString() {
    // return 'Transaction( amount: $amount, balanceAfter: $balanceAfter, type: $type, )';
    // return 'Transaction( amount: $amount, balanceAfter: $balanceAfter, type: $type, )';
    return 'Transaction( type: $type, amount: $amount, balanceAfter: $balanceAfter, )';
  }

}

