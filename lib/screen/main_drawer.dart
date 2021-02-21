import 'package:bank/widgets/user_profile.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/qr_code.dart';

import '../widgets/e_card.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool flag = false;

  void toggle(bool temp) {
    setState(() {
      flag1 = false;
      flag = temp;
    });
  }

  bool flag1 = false;

  void toggle1(bool temp1) {
    setState(() {
      flag = false;
      flag1 = temp1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.93,
      child: Drawer(
        child: Column(children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Welcome ${me.name}',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(UserProfile.routeName);
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.calendar_view_day_rounded),
            title: Text(
              'E-Card',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
            trailing: Switch(value: flag, onChanged: (temp) => toggle(temp)),
          ),
          if (flag) ECard(),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.qr_code),
            title: Text(
              'QR Code',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
            trailing:
                Switch(value: flag1, onChanged: (temp1) => toggle1(temp1)),
          ),
          if (flag1) QRCode(),
        ]),
      ),
    );
  }
}
