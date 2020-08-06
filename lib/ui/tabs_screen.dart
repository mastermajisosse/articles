import 'dart:io';

import 'package:afaq/ui/add/add_screen.dart';
import 'package:afaq/ui/home/home_screen.dart';
import 'package:afaq/ui/others/contactus_screen.dart';
import 'package:afaq/ui/profile/profile_screen.dart';
import 'package:afaq/utils/mystyle.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  bool callApi = true;
  int numb = 30;
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(0);
    // selectedIndex = 0;
  }

  Future<bool> checkcon() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
      return true;
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Mystyle.primarycolo,
        body: [
          HomeScreen(),
          AddScreen(),
          ProfileScreen(),
        ].elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          showUnselectedLabels: false,
          unselectedItemColor: Mystyle.primarycolo,
          selectedItemColor: Mystyle.primarycolo.withBlue(222),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text(
                'مواضيع',
                textAlign: TextAlign.center,
              ),
              icon: Icon(
                Icons.book,
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                'شارك',
                textAlign: TextAlign.center,
              ),
              icon: Icon(
                Icons.add,
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                'بروفيل',
                textAlign: TextAlign.center,
              ),
              icon: Icon(
                Icons.contacts,
              ),
            ),
          ],
          unselectedFontSize: 12,
          selectedFontSize: 14,
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
