import 'package:bank/screen/main_drawer.dart';
import 'package:flutter/material.dart';
import '../screen/contacts_screen.dart';
import '../screen/transactions_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, Object>> _tabs = [
    {'screen': ContactsScreen(), 'title': 'Contacts'},
    {'screen': TransactionsScreen(), 'title': 'Transactions'}
  ];

  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Sparks Bank'),
      ),
      body: _tabs[_selectedPageIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _selectedPage(index),
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).canvasColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows_rounded),
            label: 'Transactions',
          )
        ],
      ),
    );
  }
}
