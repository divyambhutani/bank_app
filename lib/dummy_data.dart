import 'package:flutter/material.dart';
import './models/user.dart';
import './models/contacts.dart';
import './models/transactions.dart';

final transactionsList = [];

final ContactsList = [
  Contacts(name: 'Gagan', upiId: 'gagan@gosbi'),
  Contacts(name: 'Girish', upiId: 'girish@yoyobank'),
  Contacts(name: 'Mukul', upiId: 'mukul@okaxis'),
  Contacts(name: 'Ritik', upiId: 'ritik@citybank'),
  Contacts(name: 'Bunty', upiId: 'bunty@okaxis'),
];

var me = User(name: 'Divyam', balance: 500000, upiId: 'Divyam@okaxis');
