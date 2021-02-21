import 'package:flutter/material.dart';

class NoTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.topCenter,
          child: Text(
            'No Transactions',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          alignment: Alignment.topCenter,
          child: Image.asset(
            'assets/images/waiting.png',
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
