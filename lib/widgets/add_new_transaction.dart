import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewTransaction extends StatefulWidget {
  final Function adding;

  AddNewTransaction(this.adding);

  @override
  State<AddNewTransaction> createState() => _AddNewTransactionState();
}

class _AddNewTransactionState extends State<AddNewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitDate() {
    if (_amountController.text.isEmpty){
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null){
      return;
    }
    widget.adding(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime.now()).then((pickedDate){
      if (pickedDate == null){
          return;
      }
       setState(() {
      _selectedDate = pickedDate;
    });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: _titleController,
              onSubmitted: (_) => _submitDate,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitDate,
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text(_selectedDate == null ?'No Date Chosen!' : 'Picked Date: ${DateFormat.yMMMd().format(_selectedDate!)}',),
                  TextButton(onPressed: _presentDatePicker, child: Text("Choose Date", style: TextStyle(fontWeight: FontWeight.bold)))
                ]
              ),
            ),
            ElevatedButton(
              onPressed: () => {_submitDate()},
              child: Text(
                "Add",
              ),
            )
          ],
        ),
      ),
    );
  }
}
