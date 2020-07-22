import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:migrena_kompas/SplashScreen/SplashScreen.dart';

Color mainColor = Color(0xFFE2F9F1);
Color subColor = Color(0xFFF6FFFC);
Color selectedColor = Color(0xFF008991);
Color unselectedColor = Color(0xFF9EC2C4);
Color itemColor = Color(0xFFf5fffb);
Color itemSelectedColor = Color(0xFFe9f9f7);
Color backColor = Color(0xFF8ACBCC);
Color progColor = Color(0xFF47AAAE);

int bottomNavIndex = 0;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(selectedColor);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
