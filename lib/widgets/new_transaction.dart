import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitDate() {
    final enterdTitle = titleController.text;
    final enterdAmount = double.parse(amountController.text);

    if (!(enterdTitle.isEmpty || enterdAmount <= 0)) {
      widget.addNewTransaction(
        enterdTitle,
        enterdAmount,
      );

      Navigator.of(context).pop();
    }
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
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitDate(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitDate(),
            ),
            FlatButton(
              textColor: Colors.purple,
              onPressed: submitDate,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
