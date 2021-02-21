import 'package:flutter/foundation.dart';

enum PaymentMethod { UPI, DebitCard, CreditCard }

class Transactions {
  final int id;
  final DateTime date;
  final double amount;
  final String senderName;
  final String recieverName;

  Transactions({
    @required this.id,
    @required this.date,
    @required this.amount,
    @required this.senderName,
    @required this.recieverName,
  });
}
