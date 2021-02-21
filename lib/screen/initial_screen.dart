import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home_tab_screen.dart';

class InitialScreen extends StatelessWidget {
  static const routeName = '/intial_screen';
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.purple,
      seconds: 5,
      useLoader: false,
      photoSize: 200,
      title: Text(
        'Sparks Bank',
        style: TextStyle(
          color: Colors.amber,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
      image: Image.asset(
        'assets/images/initloading.gif',
        fit: BoxFit.cover,
      ),
      navigateAfterSeconds: HomeScreen(),
    );
  }
}
