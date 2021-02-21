import 'package:bank/screen/home_tab_screen.dart';
import 'package:bank/widgets/user_profile.dart';
import 'package:flutter/material.dart';

import './screen/initial_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay More',
      theme: ThemeData(
        primaryColor: Colors.purple,
        fontFamily: 'Raleway',
        accentColor: Colors.amber,
        canvasColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: InitialScreen(),
      initialRoute: InitialScreen.routeName,
      routes: {
        InitialScreen.routeName: (ctx) => InitialScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        UserProfile.routeName: (ctx) => UserProfile(),
      },
    );
  }
}
