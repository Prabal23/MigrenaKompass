import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:migrena_kompas/ApplicationSettings/ApplicationDiarySettings.dart';

import '../main.dart';

class ApplicationDiaryScreen extends StatefulWidget {
  @override
  _ApplicationDiaryScreenState createState() => _ApplicationDiaryScreenState();
}

class _ApplicationDiaryScreenState extends State<ApplicationDiaryScreen> {
  bool setReminderSelected = false;
  DateTime now = new DateTime.now();
  String formattedDate = "";
  String formattedTime = "";

  List injectionList = [];

  @override
  void initState() {
    setState(() {
      // Timer.periodic(Duration(seconds: 1), (timer) {
      //   print(DateTime.now());
      //   DateTime now = new DateTime.now();
      //   formattedDate = DateFormat("MMM dd, yyyy").format(now);
      //   formattedTime = DateFormat("hh:mm a").format(now);
      //   print(formattedTime);
      // });
      formattedDate = DateFormat("MMM dd, yyyy").format(now);
      formattedTime = DateFormat("hh:mm a").format(now);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: Container(
                    margin: EdgeInsets.only(left: 18),
                    child: BackButton(color: Colors.white)),
                actions: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ))
                ],
                expandedHeight: 120.0,
                floating: true,
                pinned: true,
                backgroundColor: Color(0xFF008990),
                // title: Text('APPLICATION DIARY'),
                flexibleSpace: FlexibleSpaceBar(
                  // background: Image.asset('assets/images/main_logo.png'),
                  centerTitle: true,
                  title: Container(
                    margin: EdgeInsets.only(left: 15),
                    // padding: EdgeInsets.only(bottom: 10, top: 15),
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: Text(
                      "APPLICATION DIARY",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/flower1.png"),
                            fit: BoxFit.fill)),
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
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  !setReminderSelected
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white,
                            color: Color(0xFFF5FFFB),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[300],
                                blurRadius: 7,
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.only(top: 5),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'Next Application',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10, bottom: 25),
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      if (setReminderSelected == false) {
                                        setReminderSelected = true;
                                      } else {
                                        setReminderSelected = false;
                                      }
                                    });
                                  },
                                  padding: EdgeInsets.only(
                                    left: 45,
                                    right: 45,
                                    top: 12,
                                    bottom: 12,
                                  ),
                                  color: Color(0xFF008990),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.notifications_active,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      Text(
                                        'Set Reminder',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'poppins',
                                          // fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                        color: Color(0xFF008990),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0XffF5FFFB),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[300],
                                blurRadius: 7,
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Next Application',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 15),
                                    child: Icon(
                                      Icons.more_vert,
                                      size: 25,
                                      color: Color(0xFFA8A8A8),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: subColor,
                                ),
                                padding: EdgeInsets.only(
                                    left: 20, top: 25, bottom: 17),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(right: 15),
                                            child: Text(
                                              "$formattedDate",
                                              style: TextStyle(
                                                fontFamily: 'poppins',
                                                fontSize: 26,
                                                color: Color(0xFF8ACBCC),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(right: 15),
                                            child: Text(
                                              "$formattedTime",
                                              style: TextStyle(
                                                fontFamily: 'poppins',
                                                fontSize: 26,
                                                color: Color(0xFF8ACBCC),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(right: 5),
                                              child: FlatButton(
                                                onPressed: () {},
                                                color: Color(0xFFF5FFFB),
                                                padding: EdgeInsets.only(
                                                    top: 12, bottom: 12),
                                                child: Text(
                                                  'How to apply Injection?',
                                                  style: TextStyle(
                                                      color: Color(0xFF008990),
                                                      fontFamily: 'poppins',
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    side: BorderSide(
                                                      color: Color(0xFF008990),
                                                      width: 1.25,
                                                    )),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: FlatButton(
                                                onPressed: () {
                                                  setState(() {
                                                    formattedDate =
                                                        DateFormat("dd.MM.yyyy")
                                                            .format(now);
                                                    injectionList.add({
                                                      "time": formattedTime,
                                                      "date": formattedDate,
                                                      "status": "Pending"
                                                    });
                                                  });
                                                },
                                                padding: EdgeInsets.only(
                                                    top: 12, bottom: 12),
                                                color: Color(0xFF008990),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 5),
                                                        child: Image.asset(
                                                          "assets/images/injection.png",
                                                          height: 16,
                                                          width: 16,
                                                        )),
                                                    Text(
                                                      'Inject Now',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'poppins',
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    side: BorderSide(
                                                      color: Color(0xFF008990),
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                  ///////////////////////////////////
                  ///////////////////////////////////
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.white,
                      color: Color(0xFFF5FFFB),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.only(top: 5),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'History',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        injectionList.length == 0
                            ? Center(
                                child: Container(
                                  child: Image.asset(
                                    'assets/images/search_inj.png',
                                    width: 150,
                                    height: 150,
                                  ),
                                ),
                              )
                            : Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      color: Color(0xFFE1F9F0),
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 10,
                                          bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              'Date',
                                              style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  fontSize: 13,
                                                  color: Color(0xFF008990),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Time',
                                              style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  fontSize: 13,
                                                  color: Color(0xFF008990),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Confirmation',
                                              style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  fontSize: 13,
                                                  color: Color(0xFF008990),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Container(
                                    //   // color: Color(0xFFE1F9F0),
                                    //   padding: EdgeInsets.only(
                                    //       left: 20, right: 20, top: 10, bottom: 10),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.spaceEvenly,
                                    //     children: <Widget>[
                                    //       Expanded(
                                    //         child: Text(
                                    //           '27.01.2020',
                                    //           style: TextStyle(
                                    //               fontFamily: 'poppins',
                                    //               fontSize: 13,
                                    //               // color: Color(0xFF008990),
                                    //               fontWeight: FontWeight.w600),
                                    //         ),
                                    //       ),
                                    //       Expanded(
                                    //         child: Container(
                                    //           padding: EdgeInsets.only(right: 0),
                                    //           child: Text(
                                    //             '11:00 PM',
                                    //             style: TextStyle(
                                    //                 fontFamily: 'poppins',
                                    //                 fontSize: 13,
                                    //                 // color: Color(0xFF008990),
                                    //                 fontWeight: FontWeight.w600),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //       Expanded(
                                    //         child: GestureDetector(
                                    //           onTap: () {
                                    //             Navigator.push(
                                    //               context,
                                    //               MaterialPageRoute(
                                    //                   builder: (context) =>
                                    //                       ApplicationDiarySettings()),
                                    //             );
                                    //           },
                                    //           child: Container(
                                    //               //  /alignment: Alignment.center,
                                    //               padding: EdgeInsets.only(right: 0),
                                    //               child: Image.asset(
                                    //                 'assets/images/diary_edit.png',
                                    //                 height: 22,
                                    //                 width: 22,
                                    //               )),
                                    //         ),
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),
                                    Column(
                                        children: List.generate(
                                            injectionList.length, (int index) {
                                      return Container(
                                        // color: Color(0xFFE1F9F0),
                                        padding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '${injectionList[index]['date']}',
                                                style: TextStyle(
                                                    fontFamily: 'poppins',
                                                    fontSize: 13,
                                                    // color: Color(0xFF008990),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(right: 0),
                                                child: Text(
                                                  '${injectionList[index]['time']}',
                                                  style: TextStyle(
                                                      fontFamily: 'poppins',
                                                      fontSize: 13,
                                                      // color: Color(0xFF008990),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ApplicationDiarySettings()),
                                                  );
                                                },
                                                child: Container(
                                                    //  /alignment: Alignment.center,
                                                    padding: EdgeInsets.only(
                                                        right: 0),
                                                    child: Image.asset(
                                                      injectionList[index]
                                                                  ['status'] ==
                                                              "Pending"
                                                          ? 'assets/images/diary_edit.png'
                                                          : 'assets/images/diary_cancel.png',
                                                      height: 22,
                                                      width: 22,
                                                    )),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }))
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
