import 'package:amazonclone/cart.dart';
import 'package:amazonclone/homepage.dart';
import 'package:amazonclone/you.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  dynamic cartitem = [];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      Homepage(cartitem: cartitem),
      const you(),
      const Text(
        'Index 2: More ',
      ),
      cart(arraydata: cartitem),
      const Text(
        'Index 2: Menu',
      ),
    ];

    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined, color: Colors.black),
            label: 'You',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz, color: Colors.black),
            label: 'More',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout_outlined,
                color: Colors.black),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined, color: Colors.black),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
