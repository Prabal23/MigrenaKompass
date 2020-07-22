import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:migrena_kompas/ApplicationDiary/ApplicationDiaryScreen.dart';

import '../main.dart';

class ApplicationDiarySettings extends StatefulWidget {
  @override
  _ApplicationDiarySettingsState createState() =>
      _ApplicationDiarySettingsState();
}

class NumberList {
  String number;
  int index;
  NumberList({this.number, this.index});
}

class _ApplicationDiarySettingsState extends State<ApplicationDiarySettings> {
  bool isSelectedDosage = false,
      isSelectedType = false,
      isSelectedLocation = false,
      isSelectedDate = false,
      isSelectedNotifs = false;
  bool isChecked = false;
  String dosage = "", type = "", location = "", date = "", notifs = "";

  List<NumberList> nList = [
    NumberList(
      index: 1,
      number: "1 per month",
    ),
    NumberList(
      index: 2,
      number: "1 per three months",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Container(
          child: NestedScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
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
                        "APPLICATION SETTINGS",
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
                child: Container(
                  child: Column(
                    children: <Widget>[
                      ////// <<<<< Dosage container start >>>>> //////
                      isSelectedDosage == false
                          ? Container(
                              // height: MediaQuery.of(context).size.height / 9,
                              height: 60,
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.white),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 7,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                        ),
                                        color: Color(0xFF3327D9),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Dosage',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'poppins',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(right: 12),
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.info_outline,
                                            size: 20,
                                            color: Colors.black26,
                                          ),
                                          onPressed: () {}),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isSelectedDosage == false) {
                                              isSelectedDosage = true;
                                              print('true');
                                            } else {
                                              isSelectedDosage = false;
                                              print('false');
                                            }
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: dosage ==
                                                            "1 per month"
                                                        ? 90
                                                        : dosage ==
                                                                "1 per three months"
                                                            ? 45
                                                            : 0),
                                                child: Text(
                                                  // '1 per three months',
                                                  dosage == ""
                                                      ? "Select prescribed dosage"
                                                      : dosage,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'poppins',
                                                    color: dosage == ""
                                                        ? Color(0xFF8ACBCC)
                                                        : Color(0xFF008990),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Icon(
                                                Icons.expand_more,
                                                size: 25,
                                                color: Color(0xFF8ACBCC),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
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
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Dosage',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins',
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.only(right: 12),
                                        child: IconButton(
                                            icon: Icon(
                                              Icons.info_outline,
                                              size: 20,
                                              color: Colors.black26,
                                            ),
                                            onPressed: () {}),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (isSelectedDosage == false) {
                                                isSelectedDosage = true;
                                                print('true');
                                              } else {
                                                isSelectedDosage = false;
                                                print('false');
                                              }
                                            });
                                          },
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: dosage ==
                                                              "1 per month"
                                                          ? 90
                                                          : dosage ==
                                                                  "1 per three months"
                                                              ? 45
                                                              : 0),
                                                  child: Text(
                                                    // '1 per three months',
                                                    dosage == ""
                                                        ? "Select prescribed dosage"
                                                        : dosage,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontFamily: 'poppins',
                                                      color: dosage == ""
                                                          ? Color(0xFF8ACBCC)
                                                          : Color(0xFF008990),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Icon(
                                                  Icons.expand_more,
                                                  size: 25,
                                                  color: Color(0xFF8ACBCC),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        dosage = "1 per month";
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: dosage == "1 per month"
                                            ? itemSelectedColor
                                            : Colors.white,
                                      ),
                                      padding: EdgeInsets.only(
                                          left: 25, top: 7, bottom: 7),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                              child: dosage == "1 per month"
                                                  ? Icon(
                                                      Icons
                                                          .radio_button_checked,
                                                      color: Color(0xFF008990),
                                                      size: 22,
                                                    )
                                                  : Icon(
                                                      Icons
                                                          .radio_button_unchecked,
                                                      color: Color(0xFF008990),
                                                      size: 22,
                                                    )),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text("1 per month",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 13.0,
                                                    fontFamily: 'poppins',
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        dosage = "1 per three months";
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: dosage == "1 per three months"
                                            ? itemSelectedColor
                                            : Colors.white,
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.grey[300],
                                        //     blurRadius: 7,
                                        //     offset: Offset(
                                        //       0, // horizontal, move right 10
                                        //       3, // vertical, move down 10
                                        //     ),
                                        //   ),
                                        // ],
                                      ),
                                      padding: EdgeInsets.only(
                                          left: 25, top: 7, bottom: 7),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: Container(
                                                child: dosage ==
                                                        "1 per three months"
                                                    ? Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        color:
                                                            Color(0xFF008990),
                                                        size: 22,
                                                      )
                                                    : Icon(
                                                        Icons
                                                            .radio_button_unchecked,
                                                        color:
                                                            Color(0xFF008990),
                                                        size: 22,
                                                      )),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text("1 per three months",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 13.0,
                                                    fontFamily: 'poppins',
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                      ////// <<<<< Dosage container end >>>>> //////
                      ////// <<<<< Type container start >>>>> //////
                      isSelectedType == false
                          ? Container(
                              height: 60,
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Color(0xFFF5FFFB),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 7,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                        ),
                                        color: Color(0xFF275BDC),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Type',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'poppins',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.info_outline,
                                          size: 20,
                                          color: Colors.black26,
                                        ),
                                        onPressed: () {}),
                                    Expanded(
                                        child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (isSelectedType == false) {
                                            isSelectedType = true;
                                            print('true');
                                          } else {
                                            isSelectedType = false;
                                            print('false');
                                          }
                                        });
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: type == "Injection"
                                                      ? 140
                                                      : type == "Syringe"
                                                          ? 145
                                                          : 110),
                                              child: Text(
                                                // 'Syringe',
                                                type == ""
                                                    ? "Select device"
                                                    : type,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: 'poppins',
                                                  color: type == ""
                                                      ? Color(0xFF8ACBCC)
                                                      : Color(0xFF008990),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Icon(
                                              Icons.expand_more,
                                              size: 25,
                                              color: Color(0xFF8ACBCC),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
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
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Type',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins',
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.info_outline,
                                            size: 20,
                                            color: Colors.black26,
                                          ),
                                          onPressed: () {}),
                                      Expanded(
                                          child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isSelectedType == false) {
                                              isSelectedType = true;
                                              print('true');
                                            } else {
                                              isSelectedType = false;
                                              print('false');
                                            }
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: type == "Injection"
                                                        ? 140
                                                        : type == "Syringe"
                                                            ? 145
                                                            : 110),
                                                child: Text(
                                                  // 'Syringe',
                                                  type == ""
                                                      ? "Select device"
                                                      : type,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'poppins',
                                                    color: type == ""
                                                        ? Color(0xFF8ACBCC)
                                                        : Color(0xFF008990),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Icon(
                                                Icons.expand_more,
                                                size: 25,
                                                color: Color(0xFF8ACBCC),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        type = "Injection";
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: type == "Injection"
                                            ? itemSelectedColor
                                            : Colors.white,
                                      ),
                                      padding: EdgeInsets.only(
                                          left: 25, top: 7, bottom: 7),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                              child: type == "Injection"
                                                  ? Icon(
                                                      Icons
                                                          .radio_button_checked,
                                                      color: Color(0xFF008990),
                                                      size: 22,
                                                    )
                                                  : Icon(
                                                      Icons
                                                          .radio_button_unchecked,
                                                      color: Color(0xFF008990),
                                                      size: 22,
                                                    )),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text("Injection",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 13.0,
                                                    fontFamily: 'poppins',
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        type = "Syringe";
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: type == "Syringe"
                                            ? itemSelectedColor
                                            : Colors.white,
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.grey[300],
                                        //     blurRadius: 7,
                                        //     offset: Offset(
                                        //       0, // horizontal, move right 10
                                        //       3, // vertical, move down 10
                                        //     ),
                                        //   ),
                                        // ],
                                      ),
                                      padding: EdgeInsets.only(
                                          left: 25, top: 7, bottom: 7),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: Container(
                                                child: type == "Syringe"
                                                    ? Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        color:
                                                            Color(0xFF008990),
                                                        size: 22,
                                                      )
                                                    : Icon(
                                                        Icons
                                                            .radio_button_unchecked,
                                                        color:
                                                            Color(0xFF008990),
                                                        size: 22,
                                                      )),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text("Syringe",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 13.0,
                                                    fontFamily: 'poppins',
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      ////// <<<<< Type container end >>>>> //////
                      ////// <<<<< Date container start >>>>> //////
                      !isSelectedDate
                          ? Container(
                              height: 60,
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.white),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 7,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                        ),
                                        color: Color(0xFF1E81DE),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Start date and time',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'poppins',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.info_outline,
                                          size: 20,
                                          color: Colors.black26,
                                        ),
                                        onPressed: () {}),
                                    Flexible(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isSelectedDate == false) {
                                              isSelectedDate = true;
                                              print('true');
                                            } else {
                                              isSelectedDate = false;
                                              print('false');
                                            }
                                          });
                                        },
                                        child: Container(
                                          // padding: EdgeInsets.only(left: 0),
                                          child: Text(
                                            'Dec 21, 2019 - 8:00 PM',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: 'poppins',
                                              // fontWeight: FontWeight.w500,
                                              color: Color(0xFF008990),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (isSelectedDate == false) {
                                            isSelectedDate = true;
                                            print('true');
                                          } else {
                                            isSelectedDate = false;
                                            print('false');
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.expand_more,
                                          size: 25,
                                          color: Color(0xFF8ACBCC),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
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
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Start date and time',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'poppins',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.info_outline,
                                            size: 20,
                                            color: Colors.black26,
                                          ),
                                          onPressed: () {}),
                                      Flexible(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 100),
                                          child: Text(
                                            '',
                                            // 'Dec 21, 2019 ~ 08:00 PM',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins',
                                              color: Color(0xFF008990),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isSelectedDate == false) {
                                              isSelectedDate = true;
                                              print('true');
                                            } else {
                                              isSelectedDate = false;
                                              print('false');
                                            }
                                          });
                                        },
                                        child: Container(
                                          child: Icon(
                                            Icons.expand_more,
                                            size: 25,
                                            color: Color(0xFF8ACBCC),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.only(
                                        left: 20, top: 15, bottom: 17),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(bottom: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 15),
                                                child: Text(
                                                  'Dec 21, 2019     08:00 PM',
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
                                        FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              isSelectedDate = false;
                                            });
                                          },
                                          padding: EdgeInsets.only(
                                              left: 42,
                                              right: 42,
                                              top: 12,
                                              bottom: 12),
                                          color: Color(0xFF008990),
                                          child: Text(
                                            'Confirm',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'poppins',
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              side: BorderSide(
                                                color: Color(0xFF008990),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                      ////// <<<<< Date container end >>>>> //////
                      ////// <<<<< Application place container start >>>>> //////
                      !isSelectedLocation
                          ? Container(
                              height: 60,
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.white),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 7,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                        ),
                                        color: Color(0xFF0FBEE1),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Application place',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'poppins',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.info_outline,
                                          size: 20,
                                          color: Colors.black26,
                                        ),
                                        onPressed: () {}),
                                    Expanded(
                                        child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (isSelectedLocation == false) {
                                            isSelectedLocation = true;
                                            print('true');
                                          } else {
                                            isSelectedLocation = false;
                                            print('false');
                                          }
                                        });
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: location == "Home"
                                                      ? 70
                                                      : location ==
                                                              "Medical Center"
                                                          ? 10
                                                          : 15),
                                              child: Text(
                                                location == ""
                                                    ? "Select location"
                                                    : location,
                                                // 'Medical Center',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: 'poppins',
                                                  color: location == ""
                                                      ? Color(0xFF8ACBCC)
                                                      : Color(0xFF008990),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Icon(
                                              Icons.expand_more,
                                              size: 25,
                                              color: Color(0xFF8ACBCC),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
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
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Application place',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins',
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.info_outline,
                                            size: 20,
                                            color: Colors.black26,
                                          ),
                                          onPressed: () {}),
                                      Expanded(
                                          child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isSelectedLocation == false) {
                                              isSelectedLocation = true;
                                              print('true');
                                            } else {
                                              isSelectedLocation = false;
                                              print('false');
                                            }
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: location == "Home"
                                                        ? 70
                                                        : location ==
                                                                "Medical Center"
                                                            ? 10
                                                            : 15),
                                                child: Text(
                                                  location == ""
                                                      ? "Select location"
                                                      : location,
                                                  // 'Medical Center',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'poppins',
                                                    color: location == ""
                                                        ? Color(0xFF8ACBCC)
                                                        : Color(0xFF008990),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Icon(
                                                Icons.expand_more,
                                                size: 25,
                                                color: Color(0xFF8ACBCC),
                                              ),
                                            )
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        location = "Home";
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: location == "Home"
                                            ? itemSelectedColor
                                            : Colors.white,
                                      ),
                                      padding: EdgeInsets.only(
                                          left: 25, top: 7, bottom: 7),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                              child: location == "Home"
                                                  ? Icon(
                                                      Icons
                                                          .radio_button_checked,
                                                      color: Color(0xFF008990),
                                                      size: 22,
                                                    )
                                                  : Icon(
                                                      Icons
                                                          .radio_button_unchecked,
                                                      color: Color(0xFF008990),
                                                      size: 22,
                                                    )),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text("Home",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 13.0,
                                                    fontFamily: 'poppins',
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        location = "Medical Center";
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: location == "Medical Center"
                                            ? itemSelectedColor
                                            : Colors.white,
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.grey[300],
                                        //     blurRadius: 7,
                                        //     offset: Offset(
                                        //       0, // horizontal, move right 10
                                        //       3, // vertical, move down 10
                                        //     ),
                                        //   ),
                                        // ],
                                      ),
                                      padding: EdgeInsets.only(
                                          left: 25, top: 7, bottom: 7),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: Container(
                                                child: location ==
                                                        "Medical Center"
                                                    ? Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        color:
                                                            Color(0xFF008990),
                                                        size: 22,
                                                      )
                                                    : Icon(
                                                        Icons
                                                            .radio_button_unchecked,
                                                        color:
                                                            Color(0xFF008990),
                                                        size: 22,
                                                      )),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text("Medical Center",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 13.0,
                                                    fontFamily: 'poppins',
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                      ////// <<<<< Application place container end >>>>> //////
                      ////// <<<<< Notifications container end >>>>> //////
                      isSelectedNotifs == false
                          ? Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.white),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 7,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                        ),
                                        color: Color(0xFF03EFE4),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Notifications',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.info_outline,
                                          size: 20,
                                          color: Colors.black26,
                                        ),
                                        onPressed: () {}),
                                    Flexible(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isSelectedNotifs == false) {
                                              isSelectedNotifs = true;
                                              print('true');
                                            } else {
                                              isSelectedNotifs = false;
                                              print('false');
                                            }
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left:
                                                  isChecked == true ? 90 : 65),
                                          child: Text(
                                            // 'Allowed',
                                            isChecked == true
                                                ? "Allowed"
                                                : "Not Allowed",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'poppins',
                                              color: Color(0xFF008990),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (isSelectedNotifs == false) {
                                            isSelectedNotifs = true;
                                            print('true');
                                          } else {
                                            isSelectedNotifs = false;
                                            print('false');
                                          }
                                        });
                                      },
                                      child: Container(
                                        child: Icon(
                                          Icons.expand_more,
                                          size: 25,
                                          color: Color(0xFF8ACBCC),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
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
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Notifications',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'poppins',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.info_outline,
                                            size: 20,
                                            color: Colors.black26,
                                          ),
                                          onPressed: () {}),
                                      Flexible(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (isSelectedNotifs == false) {
                                                isSelectedNotifs = true;
                                                print('true');
                                              } else {
                                                isSelectedNotifs = false;
                                                print('false');
                                              }
                                            });
                                          },
                                          child: Container(
                                            // padding: EdgeInsets.only(left: 70),
                                            padding: EdgeInsets.only(
                                                left: isChecked == true
                                                    ? 90
                                                    : 65),
                                            child: Text(
                                              // 'Allowed',
                                              isChecked == true
                                                  ? "Allowed"
                                                  : "Not Allowed",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'poppins',
                                                color: Color(0xFF008990),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isSelectedNotifs == false) {
                                              isSelectedNotifs = true;
                                              print('true');
                                            } else {
                                              isSelectedNotifs = false;
                                              print('false');
                                            }
                                          });
                                        },
                                        child: Container(
                                          child: Icon(
                                            Icons.expand_more,
                                            size: 25,
                                            color: Color(0xFF8ACBCC),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.only(
                                        left: 25, top: 15, bottom: 17),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(bottom: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                'Allow notifications',
                                                style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  fontSize: 13,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isChecked = !isChecked;
                                                  });
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      right: 20),
                                                  child: CustomSwitchButton(
                                                    backgroundColor:
                                                        Color(0xFF008990),
                                                    unCheckedColor:
                                                        Colors.white,
                                                    animationDuration: Duration(
                                                        milliseconds: 400),
                                                    checkedColor:
                                                        Color(0xFF8ACBCC),
                                                    checked: isChecked,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              setState(() {
                                                if (isSelectedNotifs == false) {
                                                  isSelectedNotifs = true;
                                                  print('true');
                                                } else {
                                                  isSelectedNotifs = false;
                                                  print('false');
                                                }
                                              });
                                            });
                                          },
                                          padding: EdgeInsets.only(
                                              left: 42,
                                              right: 42,
                                              top: 12,
                                              bottom: 12),
                                          color: Color(0xFF008990),
                                          child: Text(
                                            'Confirm',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'poppins',
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              side: BorderSide(
                                                color: Color(0xFF008990),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      ////// <<<<< Notifications container end >>>>> //////
                      /////////////// buttons start///////////
                      isSelectedDosage == true ||
                              isSelectedType == true ||
                              isSelectedDate == true ||
                              isSelectedLocation == true ||
                              isSelectedNotifs == true
                          ? buildButtons()
                          : Container(),
                      /////////////// buttons start///////////

                      Container(
                          width: 140,
                          margin: EdgeInsets.only(top: 30, bottom: 25),
                          child: Image.asset("assets/images/main_logo.png")),
                      Container(
                          width: 60,
                          margin: EdgeInsets.only(bottom: 40),
                          child: Image.asset("assets/images/powered_by.png")),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildButtons() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            color: mainColor,
            padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
            child: Text(
              'Clear Settings',
              style: TextStyle(
                color: Color(0xFF008990),
                fontFamily: 'poppins',
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color: Color(0xFF008990),
                  width: 1.25,
                )),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                isSelectedDosage = false;
                isSelectedType = false;
                isSelectedDate = false;
                isSelectedLocation = false;
                isSelectedNotifs = false;
              });
            },
            padding: EdgeInsets.only(left: 42, right: 42, top: 12, bottom: 12),
            color: Color(0xFF008990),
            child: Text(
              'Confirm',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'poppins',
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color: Color(0xFF008990),
                )),
          ),
        ],
      ),
    );
  }
}
