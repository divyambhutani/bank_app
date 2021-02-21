import '../models/transactions.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../dummy_data.dart';

class ContactsItem extends StatelessWidget {
  final String name;
  final String upiId;
  int i = 5;

  ContactsItem({this.name, this.upiId});

  final amountController = TextEditingController();

  void showSnackbar(BuildContext context, double amount) {
    Scaffold.of(context).showSnackBar(SnackBar(
      elevation: 5,
      padding: EdgeInsets.all(3),
      content: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text('Balance : $amount'),
      ),
      duration: Duration(seconds: 2),
    ));
  }

  void onTapHandler(context) {
    amountController.clear();

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return Container(
            padding: EdgeInsets.only(
                top: 10,
                right: 10,
                left: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        'Pay $name',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(upiId),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Enter Amount'),
                  controller: amountController,
                  keyboardType: TextInputType.numberWithOptions(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                        color: Colors.amberAccent,
                        child: Text('Pay'),
                        onPressed: () {
                          if (amountController.text.isEmpty ||
                              double.parse(amountController.text) < 0 ||
                              double.parse(amountController.text) >
                                  me.balance) {
                          } else {
                            transactionsList.insert(
                              0,
                              Transactions(
                                senderName: me.name,
                                amount: double.parse(amountController.text),
                                date: DateTime.now(),
                                id: i++,
                                recieverName: name,
                              ),
                            );
                            me.balance = me.balance -
                                double.parse(amountController.text);
                            Navigator.pop(context);
                            showSnackbar(context, me.balance);
                          }
                        }),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    List<Color> _colorList = [
      Colors.amber,
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.pink,
      Colors.indigo
    ];
    final _random = Random();

    var color = _colorList[_random.nextInt(_colorList.length)];

    return InkWell(
      onTap: () => onTapHandler(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(name, style: Theme.of(context).textTheme.headline6),
            Text(upiId, style: Theme.of(context).textTheme.headline6),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.6), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
