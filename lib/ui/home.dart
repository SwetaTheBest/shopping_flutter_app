import 'package:assignment_dec_flutter_app/ui/bottom/about_us.dart';
import 'package:assignment_dec_flutter_app/ui/bottom/map_screen.dart';
import 'package:assignment_dec_flutter_app/ui/bottom/special_discount.dart';
import 'package:flutter/material.dart';

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

  // void _onTapped(String name) {
  //    setState(() {
  //      nameString = name;
  //      Navigator.push(
  //        context,
  //        MaterialPageRoute(builder: (context) => name),
  //      );
  //    });
  //  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SWETA SHOPPING MALL '),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // _widgetOptions.elementAt(_selectedIndex),
            Text(
              nameString,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Container(
              color: Colors.white,
              child: FlutterLogo(size: MediaQuery.of(context).size.height * .4),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
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
              leading: Icon(Icons.home),
              title: Text('HOME'),
            ),
            ListTile(
              leading: Icon(Icons.money_rounded),
              title: Text('MY WALLET'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('REDEEM'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('OFFERS'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('10+1 PLAN'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('MY GOLDMINE'),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('FAQ'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LOG OUT'),
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
