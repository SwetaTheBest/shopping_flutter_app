import 'package:assignment_dec_flutter_app/cloud/firebase_data.dart';
import 'package:assignment_dec_flutter_app/cloud/jewel_data.dart';
import 'package:assignment_dec_flutter_app/cloud/users.dart';
import 'package:assignment_dec_flutter_app/cloud/users_data.dart';
import 'package:assignment_dec_flutter_app/ui/bottom/about_us.dart';
import 'package:assignment_dec_flutter_app/ui/bottom/map_screen.dart';
import 'package:assignment_dec_flutter_app/ui/bottom/special_discount.dart';
import 'package:assignment_dec_flutter_app/ui/drawer/offers.dart';
import 'package:flutter/material.dart';

import 'drawer/faq.dart';
import 'drawer/redeem.dart';
import 'login.dart';

class MyHomePage extends StatelessWidget {
  static const String _title = 'Drawer Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String nameString;
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('About us',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Products List',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Contact us',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Special discounts',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductCard()),
        );
      }
      if (_selectedIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LocateUs()),
        );
      }
      if (_selectedIndex == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SpecialDiscount()),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    nameString = "Welcome";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalyan Jewels '),
        backgroundColor: Colors.blueGrey,
      ),
      body: JewelsData(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'My Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('HOME'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JewelsData()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.money_rounded),
              title: Text('ADD/EDIT/DELETE PRODUCTS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirebaseData()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.card_giftcard),
              title: Text('REDEEM'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Redeem()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.payment_rounded),
              title: Text('OFFERS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Offers()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('ADD/EDIT USERS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserData()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('MY USERS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Users()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('FAQ'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Faq()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LOG OUT'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'About us',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Products List',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: 'Contact us',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Special discounts',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.greenAccent,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
