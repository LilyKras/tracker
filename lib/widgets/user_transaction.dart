import 'package:flutter/material.dart';

import './transactionList.dart';
import '../models/transaction.dart';
import './add_new_transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction();

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: '1', title: "New notebook", amount: 10, date: DateTime.now()),
    Transaction(id: '2', title: "New book", amount: 12, date: DateTime.now())
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [AddNewTransaction(), TransactionList(_userTransaction)]);
  }
}
