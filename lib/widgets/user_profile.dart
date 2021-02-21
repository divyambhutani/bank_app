import 'dart:ui';

import 'package:flutter/material.dart';
import '../dummy_data.dart';

class UserProfile extends StatelessWidget {
  static const routeName = '/user_profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: Theme.of(context).primaryColor,
              ),
            ),
            margin: EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/user.png',
              height: 300,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'User',
                  style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.purple,
                  ),
                ),
                Text(
                  ':',
                  style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.purple,
                  ),
                ),
                Text(
                  '${me.name}',
                  style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Balance',
                  style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Colors.purple),
                ),
                Text(
                  ':',
                  style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Colors.purple),
                ),
                Text(
                  '${me.balance}',
                  style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Colors.purple),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(20),
              child: Image.asset('assets/images/card.png'))
        ],
      ),
    );
  }
}
