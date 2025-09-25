
enum TypeTransaction{
  deposit,
  withdraw
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
    return 'Transaction(accountId: $accountId, amount: $amount, balanceAfter: $balanceAfter, status: $status, type: $type, dateTime: $dateTime)';
  }

}

