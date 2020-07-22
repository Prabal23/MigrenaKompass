import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:migrena_kompas/Ajovy/Ajovy.dart';
import 'package:migrena_kompas/ApplicationDiary/ApplicationDiaryScreen.dart';
import 'package:migrena_kompas/BiologicalPage/BiologicalPage.dart';
import 'package:migrena_kompas/PhysicianPage/PhysicianPage.dart';
import 'package:migrena_kompas/TipsTricksPage/TipsTricksPage.dart';
import 'package:passcode/passcode.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../main.dart';
import '../../main.dart';
import '../../main.dart';
import '../../main.dart';
import '../../main.dart';
import '../../main.dart';
import '../../main.dart';
import '../../main.dart';
import '../../main.dart';

class Treatment extends StatefulWidget {
  @override
  _TreatmentState createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> {
  CalendarController _calendarController = new CalendarController();
  Map<DateTime, List> _events;
  bool _isCodeGiven = false, isChecked = false, isError = false;
  String pinCode = "1234567", pin = "";
  TextEditingController p1Cont = new TextEditingController();
  TextEditingController p2Cont = new TextEditingController();
  TextEditingController p3Cont = new TextEditingController();
  TextEditingController p4Cont = new TextEditingController();
  TextEditingController p5Cont = new TextEditingController();
  TextEditingController p6Cont = new TextEditingController();
  TextEditingController p7Cont = new TextEditingController();

  List activityList = [
    {
      "date": "DEC 21, 2019",
      "day": "Saturday",
      "time": "08:00 AM - 06:00 PM",
      "pain": "Migraine with aura",
      "type": "MID PAIN",
      "hrs": "10 Hrs",
      "pills": "0",
      "color": Color(0xFFff9900),
      "status": ""
    },
    {
      "date": "DEC 21, 2019",
      "day": "Saturday",
      "time": "06:00 PM - 09:00 PM",
      "pain": "Migraine without aura",
      "type": "BIG PAIN",
      "hrs": "5 Hrs",
      "pills": "2",
      "color": Color(0xFFeb0101),
      "status": ""
    },
    {
      "date": "DEC 21, 2019",
      "day": "Saturday",
      "time": "",
      "pain": "N/A",
      "type": "LOW PAIN",
      "hrs": "N/A",
      "pills": "0",
      "color": Color(0xFFfecb00),
      "status": "INCOMPLETE"
    },
  ];

  @override
  void initState() {
    _calendarController = CalendarController();
    final _selectedDay = DateTime.now();
    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Event A0',
        'Event B0',
        'Event C0'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Event A5',
        'Event B5',
        'Event C5'
      ],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 3)):
          Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
    };
    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        // shape: BoxShape.rectangle,
        shape: BoxShape.circle,
        color: _calendarController.isSelected(date)
            ? Color(0xFF008990)
            : _calendarController.isToday(date)
                ? Color(0xFF008990)
                : Color(0xFF008990),
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 9.0,
            fontFamily: 'poppins',
          ),
        ),
      ),
    );
  }

  Future<Null> _showAlertDialog() async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Column(
              children: <Widget>[
                Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        image: DecorationImage(
                            image: AssetImage(
                          "assets/images/medicines.png",
                        )))),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: mainColor, border: Border.all(color: mainColor)),
                  margin: EdgeInsets.only(left: 0, right: 0),
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Pop up type",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: mainColor, border: Border.all(color: mainColor)),
                  margin: EdgeInsets.only(left: 0, right: 0),
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    "Bold Heading of Pop up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: selectedColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: mainColor, border: Border.all(color: mainColor)),
                  margin: EdgeInsets.only(left: 0, right: 0),
                  padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Text(
                    "Donec quis mi a mauris condimentum elementum. Suspendisse suscipit arcu et mattis tincidunt.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0, right: 0, top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            margin:
                                EdgeInsets.only(top: 0, bottom: 20, right: 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5)),
                            ),
                            child: Text("Cancel",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins"))),
                      ),
                      Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            margin:
                                EdgeInsets.only(top: 0, bottom: 20, left: 0),
                            decoration: BoxDecoration(
                              color: selectedColor,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5)),
                            ),
                            child: Text("Confirm",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins"))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            NestedScrollView(
              physics: BouncingScrollPhysics(),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    leading: Container(
                        margin: EdgeInsets.only(left: 18),
                        child: BackButton(color: Colors.white)),
                    actions: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _showAlertDialog();
                        },
                        child: Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            )),
                      )
                    ],
                    expandedHeight: 150.0,
                    floating: true,
                    //pinned: true,
                    backgroundColor: Color(0xFF008990),
                    // title: Text('APPLICATION DIARY'),
                    flexibleSpace: FlexibleSpaceBar(
                      // background: Image.asset('assets/images/main_logo.png'),
                      centerTitle: true,
                      title: Container(
                        height: 45,
                        padding: EdgeInsets.only(top: 20),
                        margin: EdgeInsets.only(left: 15),
                        // padding: EdgeInsets.only(bottom: 10, top: 15),
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          "Treatment",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      background: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/flower1.png"),
                                    fit: BoxFit.fill)),
                          ),
                          Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(right: 60, top: 0),
                              child: Image.asset(
                                "assets/images/treatIcon.png",
                                height: 80,
                                width: 80,
                              ))
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                  ),
                ];
              },
              body: DefaultTabController(
                length: 3,
                child: SafeArea(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        child: new Material(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              color: mainColor,
                            ),
                            child: new TabBar(
                              onTap: (index) {
                                print(index);
                              },
                              labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              tabs: [
                                new Tab(
                                  text: "Biological Treatment",
                                ),
                                new Tab(
                                  text: "Useful Information",
                                ),
                                new Tab(
                                  text: "Physician's Visit",
                                ),
                              ],
                              isScrollable: true,
                              indicatorColor: selectedColor,
                              unselectedLabelColor: Colors.black26,
                              unselectedLabelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(
                                    width: 4.0, color: selectedColor),
                              ),
                              labelColor: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: new TabBarView(
                          children: [
                            BiologicalPage(),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Container(
                                  child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 15, right: 15, top: 15),
                                    decoration: BoxDecoration(
                                        color: subColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[300],
                                            blurRadius: 17,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: MediaQuery.of(context).size.width,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 15,
                                          bottom: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Stack(
                                            children: <Widget>[
                                              Image.asset(
                                                "assets/images/u1.png",
                                                width: 45,
                                                height: 45,
                                              ),
                                              Container(
                                                width: 45,
                                                height: 45,
                                                alignment: Alignment.center,
                                                child: Image.asset(
                                                  "assets/images/u6.png",
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 15),
                                              child: Text(
                                                "About the disease",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.chevron_right,
                                            color: unselectedColor,
                                            size: 22,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 15, right: 15, top: 15),
                                    decoration: BoxDecoration(
                                        color: subColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[300],
                                            blurRadius: 17,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: MediaQuery.of(context).size.width,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 15,
                                          bottom: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Stack(
                                            children: <Widget>[
                                              Image.asset(
                                                "assets/images/b1.png",
                                                width: 45,
                                                height: 45,
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 15),
                                              child: Text(
                                                "Useful links and pages",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.chevron_right,
                                            color: unselectedColor,
                                            size: 22,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 15, right: 15, top: 15),
                                    decoration: BoxDecoration(
                                        color: subColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[300],
                                            blurRadius: 17,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: MediaQuery.of(context).size.width,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 15,
                                          bottom: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Image.asset(
                                            "assets/images/u3.png",
                                            width: 45,
                                            height: 45,
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 15),
                                              child: Text(
                                                "Maps",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.chevron_right,
                                            color: unselectedColor,
                                            size: 22,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 15, right: 15, top: 15),
                                    decoration: BoxDecoration(
                                        color: subColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[300],
                                            blurRadius: 17,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: MediaQuery.of(context).size.width,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 15,
                                          bottom: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Image.asset(
                                            "assets/images/u4.png",
                                            width: 45,
                                            height: 45,
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 15),
                                              child: Text(
                                                "Mini encyclopedia",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.chevron_right,
                                            color: unselectedColor,
                                            size: 22,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TipsTricksPage()));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 15, right: 15, top: 15),
                                      decoration: BoxDecoration(
                                          color: subColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[300],
                                              blurRadius: 17,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: MediaQuery.of(context).size.width,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 15,
                                            bottom: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/images/u5.png",
                                              width: 45,
                                              height: 45,
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 15),
                                                child: Text(
                                                  "Tips and tricks",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Poppins',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.chevron_right,
                                              color: unselectedColor,
                                              size: 22,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                            width: 140,
                                            margin: EdgeInsets.only(
                                                top: 30, bottom: 25),
                                            child: Image.asset(
                                                "assets/images/main_logo.png")),
                                        Container(
                                            width: 60,
                                            margin: EdgeInsets.only(bottom: 40),
                                            child: Image.asset(
                                                "assets/images/powered_by.png"))
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            PhysicianPage()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: <Widget>[
      //       Stack(
      //         children: <Widget>[
      //           Container(
      //               alignment: Alignment.center,
      //               padding: EdgeInsets.only(top: 15, bottom: 15),
      //               margin: EdgeInsets.only(
      //                   top: 10, bottom: 10, left: 40, right: 30),
      //               decoration: BoxDecoration(
      //                   color: selectedColor,
      //                   borderRadius: BorderRadius.circular(10),
      //                   border: Border.all(width: 1, color: mainColor)),
      //               child: Text("Add Record",
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.w700,
      //                       fontFamily: "Poppins"))),
      //           Container(
      //             margin: EdgeInsets.only(left: 20, top: 2),
      //             height: 50,
      //             width: 50,
      //             padding: EdgeInsets.all(10),
      //             decoration: BoxDecoration(
      //                 color: Colors.black.withOpacity(0.2),
      //                 borderRadius: BorderRadius.circular(100)),
      //           ),
      //           Container(
      //               margin: EdgeInsets.only(left: 20),
      //               child: Image.asset(
      //                 "assets/images/add_phy.png",
      //                 height: 45,
      //               ))
      //         ],
      //       ),
      //     ],
      //   ),
      // )
    );
  }
}
