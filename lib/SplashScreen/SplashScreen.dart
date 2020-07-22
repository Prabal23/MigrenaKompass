import 'dart:async';

import 'package:flutter/material.dart';
import 'package:migrena_kompas/HomePage/HomePage.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        children: <Widget>[
          Container(
              //margin: EdgeInsets.only(left:55, right:55),
              child: Center(
                  child: Image.asset(
            "assets/images/main_logo.png",
            height: 100,
          ))),
          Container(
              margin: EdgeInsets.only(bottom: 60),
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/powered_by.png",
                height: 50,
              ))
        ],
      ),
    );
  }
}
