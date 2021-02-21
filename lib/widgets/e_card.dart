import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';
import '../dummy_data.dart';

class ECard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top: 50, left: 10, right: 10),
      child: FlipCard(
        front: Stack(children: [
          Image.asset('assets/images/debitcard.png'),
          Container(
            child: Text(
              me.name.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'RobotoCondensed'),
            ),
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(bottom: 35, left: 60),
          ),
          Container(
            child: Text(
              'SPARKS   BANK',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'RobotoCondesed'),
            ),
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 30),
          )
        ]),
        back: Image.asset('assets/images/back.png'),
      ),
    );
  }
}
