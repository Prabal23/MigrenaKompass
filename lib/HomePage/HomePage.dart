import 'package:flutter/material.dart';
import 'package:migrena_kompas/BottomNavbarPages/Dairy/Dairy.dart';
import 'package:migrena_kompas/BottomNavbarPages/Goals/goal.dart';
import 'package:migrena_kompas/BottomNavbarPages/Home/Home.dart';
import 'package:migrena_kompas/BottomNavbarPages/Report/Report.dart';
import 'package:migrena_kompas/BottomNavbarPages/Treatment/Treatment.dart';

import '../main.dart';
import '../main.dart';
import '../main.dart';
import '../main.dart';
import '../main.dart';
import '../main.dart';
import '../main.dart';
import '../main.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = bottomNavIndex;

  final children = [
    Home(),
    Dairy(),
    Treatment(),
    Report(),
    Goal(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          children[_currentIndex],
          _currentIndex == 1
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            margin: EdgeInsets.only(
                                top: 10, bottom: 10, left: 40, right: 30),
                            decoration: BoxDecoration(
                                color: selectedColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1, color: mainColor)),
                            child: Text("Add Record",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Poppins"))),
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 2),
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Image.asset("assets/images/button_add.png"))
                      ],
                    ),
                  ],
                )
              : Container(),
        ],
      ),
      bottomNavigationBar: Wrap(
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                canvasColor: Colors.green,
                // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                primaryColor: Colors.red,
                textTheme: Theme.of(context)
                    .textTheme
                    .copyWith(caption: new TextStyle(color: Colors.yellow))),
            child: BottomNavigationBar(
              backgroundColor: subColor,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: selectedColor,
              unselectedItemColor: unselectedColor,
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                  bottomNavIndex = _currentIndex;
                });
              },
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 20),
                    title: Text("Home",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 12))),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today, size: 20),
                    title: Text("Diary",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 12))),
                BottomNavigationBarItem(
                    icon: Icon(Icons.business_center, size: 20),
                    title: Text("Treatment",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 12))),
                BottomNavigationBarItem(
                    icon: Icon(Icons.equalizer, size: 20),
                    title: Text("Reports",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 12))),
                BottomNavigationBarItem(
                    icon: Icon(Icons.flag, size: 20),
                    title: Text("Goals",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 12))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int bottomNavIndex) {
    setState(() {
      _currentIndex = bottomNavIndex;
    });
  }
}
