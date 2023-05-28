import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants.dart';
import '../widgets/custom_icon.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState((){
            pageIndex = index;
          });
        },
        backgroundColor: backgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: pageIndex,
        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 30),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: CustomIcon(),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message, size: 30),
          label: 'Message',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 30),
          label: 'Profile',
        ),
      ]),
      body: Center(
        child: pages[pageIndex],
      ),
    );
  }
}
