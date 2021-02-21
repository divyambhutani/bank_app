import 'package:flutter/foundation.dart';

class User {
  final String name;
  final String upiId;
  double balance;
  final String pin = '1111';

  User({
    @required this.name,
    @required this.upiId,
    @required this.balance,
  });
}
