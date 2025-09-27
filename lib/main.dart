import 'dart:isolate';

import 'package:banking_system_project_dart/model/bank.dart';

void main(List<String> args) async {

 final receivePortAlex = ReceivePort();
 
 final alexBank = Bank(BankSchedual());
 alexBank.atachedPort(receivePortAlex.sendPort);
 final isol = await Isolate.spawn((_) => alexBank.test(), null); 
 
 receivePortAlex.listen((message){
 print(message);
  receivePortAlex.close();
  isol.kill();
 });

}

