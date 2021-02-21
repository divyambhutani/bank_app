import 'package:flutter/material.dart';
import '../dummy_data.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';
import '../widgets/no_transactions.dart';

class TransactionsScreen extends StatefulWidget {
  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final amountController = TextEditingController();

  final recieverNameController = TextEditingController();

  final upiIdController = TextEditingController();

  onTap(BuildContext context) {
    amountController.clear();
    recieverNameController.clear();
    upiIdController.clear();
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
              height: 600,
              child: Column(
                children: [
                  Container(
                    color: Colors.amber,
                    child: Text(
                      'New Transaction',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  TextField(
                    controller: recieverNameController,
                    decoration: InputDecoration(labelText: 'Reciever\'s Name'),
                  ),
                  TextField(
                    controller: upiIdController,
                    decoration: InputDecoration(labelText: 'UPI ID'),
                  ),
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(),
                    controller: amountController,
                    decoration: InputDecoration(labelText: 'Amount'),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                        child: Text(
                          'Enter',
                          style: TextStyle(color: Colors.white),
                        ),
                        elevation: 8,
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          if (double.parse(amountController.text) <= 0 ||
                              double.parse(amountController.text) >
                                  me.balance) {
                            Navigator.of(context).pop();
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Enter valid amount'),
                              ),
                            );
                          }
                          setState(() {
                            transactionsList.insert(
                              0,
                              Transactions(
                                id: 5,
                                date: DateTime.now(),
                                amount: double.parse(amountController.text),
                                senderName: me.name,
                                recieverName: recieverNameController.text,
                              ),
                            );
                            me.balance -= double.parse(amountController.text);
                          });
                          Navigator.of(context).pop();
                          Scaffold.of(context).showSnackBar(SnackBar(
                            elevation: 5,
                            padding: EdgeInsets.all(3),
                            content: Container(
                              height: 50,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text('Balance : ${me.balance}'),
                            ),
                            duration: Duration(seconds: 2),
                          ));
                        }),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return transactionsList.isEmpty
        ? Column(
            children: [
              NoTransactions(),
              Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: FloatingActionButton(
                  onPressed: () => onTap(context),
                  child: Icon(Icons.add),
                  splashColor: Theme.of(context).primaryColor,
                  tooltip: 'Create a new transactin',
                ),
              ),
            ],
          )
        : Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.73,
              child: ListView.builder(
                itemCount: transactionsList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Card(
                      color: Theme.of(context).accentColor.withOpacity(0.8),
                      elevation: 6,
                      child: ListTile(
                        title: Text('${transactionsList[index].recieverName}'),
                        subtitle: Text(DateFormat.yMMMd()
                            .format(transactionsList[index].date)),
                        trailing: CircleAvatar(
                            radius: 30,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                '-${transactionsList[index].amount}',
                              ),
                            )),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: FloatingActionButton(
                onPressed: () => onTap(context),
                child: Icon(Icons.add),
                splashColor: Theme.of(context).primaryColor,
                tooltip: 'Create a new transactin',
              ),
            ),
          ]);
  }
}
