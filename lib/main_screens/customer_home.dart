import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tswsmart/main_screens/category.dart';

import 'home.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectindex = 0;
  final List<Widget> _tab = const [
    HomeSrceen(),
    CategoryScreen(),
    Center(child: Text('Stores Screen')),
    Center(child: Text('Cart Screen')),
    Center(child: Text('Profile Screen')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tab[_selectindex],
      bottomNavigationBar: BottomNavigationBar(
        //ปุ่มเมนูด้านล่าง ต้องผ่านค่า List itemsที่เป็นปุ่มเข้าไป
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: const Color.fromARGB(125, 246, 172, 61),
        currentIndex: _selectindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Stores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectindex = index;
          });
        },
      ),
    );
  }
}
