import '../models/contacts.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/contact_item.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contacts> contactList = [
    Contacts(name: 'Gagan', upiId: 'gagan@okaxis'),
    Contacts(name: 'Girish', upiId: 'girish@okaxis'),
    Contacts(name: 'Mukul', upiId: 'mukul@okaxis'),
    Contacts(name: 'Ritik', upiId: 'ritik@okaxis'),
    Contacts(name: 'Bunty', upiId: 'bunty@okaxis'),
    Contacts(name: 'Ani', upiId: 'Ani@okaxis'),
  ];

  final nameController = TextEditingController();
  final upiIdController = TextEditingController();

  void onFloatTap() {
    nameController.clear();
    upiIdController.clear();
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Add contact'),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                  ),
                  TextField(
                    controller: upiIdController,
                    decoration: InputDecoration(labelText: 'Upi Id'),
                  ),
                ],
              ),
            ),
            actions: [
              RaisedButton(
                  color: Colors.purple,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        upiIdController.text.isEmpty) {
                      nameController.clear();
                      upiIdController.clear();
                    } else {
                      setState(() {
                        ContactsList.add(Contacts(
                            name: nameController.text,
                            upiId: upiIdController.text));

                        Navigator.pop(context);
                      });
                    }
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: EdgeInsets.all(15),
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top) *
            0.75,
        width: double.infinity,
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: ContactsList.map((item) => ContactsItem(
                name: item.name,
                upiId: item.upiId,
              )).toList(),
        ),
      ),
      Container(
        padding: EdgeInsets.only(bottom: 20),
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: onFloatTap,
          child: Icon(Icons.add),
          splashColor: Theme.of(context).primaryColor,
          tooltip: 'New contact',
        ),
      ),
    ]);
  }
}
