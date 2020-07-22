import 'package:flutter/material.dart';
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

class Dairy extends StatefulWidget {
  @override
  _DairyState createState() => _DairyState();
}

class _DairyState extends State<Dairy> {
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

  Map<DateTime, List> _events;
  CalendarController _calendarController = new CalendarController();

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
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      border: Border.all(color: mainColor)),
                  margin: EdgeInsets.only(left: 8.5, right: 9),
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
                  margin: EdgeInsets.only(left: 8.5, right: 9),
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
                  margin: EdgeInsets.only(left: 8.5, right: 9),
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
                  margin: EdgeInsets.only(left: 8.5, right: 9, top: 0),
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

  Widget _simplePopup() => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Text("Edit"),
          ),
          PopupMenuItem(
            value: 2,
            child: Text("Delete"),
          ),
        ],
      );

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
                            "DIARY",
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
                                      image: AssetImage(
                                          "assets/images/flower1.png"),
                                      fit: BoxFit.fill)),
                            ),
                            Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(right: 60, top: 0),
                                child: Image.asset(
                                  "assets/images/dairyIcon.png",
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
                  length: 2,
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
                                labelStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                tabs: [
                                  new Tab(
                                    text: "Migraines",
                                  ),
                                  new Tab(
                                    text: "Calendar",
                                  ),
                                ],
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
                              SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.only(bottom: 90),
                                        child: Column(
                                          children: List.generate(
                                              activityList.length, (int index) {
                                            return Column(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    left: 15,
                                                    right: 15,
                                                    top: 15,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: subColor,
                                                    border: Border.all(
                                                        color:
                                                            activityList[index]
                                                                ['color']),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10)),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5,
                                                                right: 5,
                                                                top: 5),
                                                        child: Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  child: Row(
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                5,
                                                                            right:
                                                                                5),
                                                                        child:
                                                                            Text(
                                                                          "${activityList[index]['date']}",
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                      ),
                                                                      activityList[index]['status'] ==
                                                                              ""
                                                                          ? Container()
                                                                          : Container(
                                                                              padding: EdgeInsets.all(3),
                                                                              decoration: BoxDecoration(border: Border.all(width: 0.5, color: selectedColor), borderRadius: BorderRadius.circular(5)),
                                                                              margin: EdgeInsets.only(left: 5, right: 5),
                                                                              child: Text(
                                                                                "${activityList[index]['status']}",
                                                                                style: TextStyle(color: selectedColor, fontFamily: 'Poppins', fontSize: 9, fontWeight: FontWeight.w600),
                                                                              ),
                                                                            ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    PopupMenuButton<
                                                                        int>(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .more_vert,
                                                                    size: 20,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  itemBuilder:
                                                                      (context) =>
                                                                          [
                                                                    PopupMenuItem(
                                                                      value: 1,
                                                                      child:
                                                                          Row(
                                                                        children: <
                                                                            Widget>[
                                                                          Container(
                                                                              padding: EdgeInsets.only(right: 10),
                                                                              child: Icon(
                                                                                Icons.edit,
                                                                                color: Color(0xFF707070),
                                                                              )),
                                                                          Text(
                                                                            "Edit",
                                                                            style:
                                                                                TextStyle(color: Color(0xFF707070), fontFamily: 'poppins'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    PopupMenuDivider(),
                                                                    PopupMenuItem(
                                                                      value: 2,
                                                                      child:
                                                                          Row(
                                                                        children: <
                                                                            Widget>[
                                                                          Container(
                                                                              padding: EdgeInsets.only(right: 10),
                                                                              child: Icon(
                                                                                Icons.delete,
                                                                                color: Color(0xFF707070),
                                                                              )),
                                                                          Text(
                                                                            "Delete",
                                                                            style:
                                                                                TextStyle(color: Color(0xFF707070), fontFamily: 'poppins'),
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
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                        child: Text(
                                                          activityList[index][
                                                                      'time'] ==
                                                                  ""
                                                              ? "${activityList[index]['day']}"
                                                              : "${activityList[index]['day']}, ${activityList[index]['time']}",
                                                          style: TextStyle(
                                                              color:
                                                                  selectedColor,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            right: 10,
                                                            top: 10),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Image.asset(
                                                                "assets/images/mig_type.png"),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 10),
                                                              child: Text(
                                                                "${activityList[index]['pain']}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    right: 10,
                                                                    top: 10),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Image.asset(
                                                                    "assets/images/pain_type.png"),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10),
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration: BoxDecoration(
                                                                        color: activityList[index]
                                                                            [
                                                                            'color'],
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child: Text(
                                                                      "${activityList[index]['type']}",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 50,
                                                                    right: 10,
                                                                    top: 10),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Image.asset(
                                                                    "assets/images/timer.png"),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10),
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    child: Text(
                                                                      "${activityList[index]['hrs']}",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.normal),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            right: 10,
                                                            top: 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: <Widget>[
                                                            Container(
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                child: Text(
                                                                  "Pills Taken",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                child: Text(
                                                                  "Triggers",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 0,
                                                                    right: 10,
                                                                    top: 0),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10),
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    child: Text(
                                                                      "${activityList[index]['pills']}",
                                                                      style: TextStyle(
                                                                          color:
                                                                              selectedColor,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.normal),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Image.asset(
                                                                    "assets/images/pill_num.png"),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 0,
                                                                    right: 5,
                                                                    top: 0),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              0,
                                                                          right:
                                                                              10,
                                                                          top:
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/cloud2.png",
                                                                    height: 20,
                                                                    width: 20,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              0,
                                                                          right:
                                                                              10,
                                                                          top:
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/apple2.png",
                                                                    height: 20,
                                                                    width: 20,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              0,
                                                                          right:
                                                                              10,
                                                                          top:
                                                                              0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/glass2.png",
                                                                    height: 20,
                                                                    width: 20,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                      left: 15,
                                                      right: 15,
                                                    ),
                                                    height: 6,
                                                    decoration: BoxDecoration(
                                                      color: activityList[index]
                                                          ['color'],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                    ))
                                              ],
                                            );
                                          }),
                                        )),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 90),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          // color: Colors.white,
                                          color: Color(0xFFF5FFFB),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              // color: Color(0xFF939393),
                                              color: Colors.grey[300],
                                              blurRadius: 5,
                                            )
                                          ],
                                        ),
                                        child: TableCalendar(
                                          events: _events,
                                          calendarController:
                                              _calendarController,

                                          startingDayOfWeek:
                                              StartingDayOfWeek.monday,
                                          weekendDays: [DateTime.sunday],
                                          calendarStyle: CalendarStyle(
                                            selectedColor: Color(0xFF008990),
                                            todayColor: Color(0xFFA4D8DB),
                                            // outsideDaysVisible: false,
                                          ),
                                          daysOfWeekStyle: DaysOfWeekStyle(
                                            weekendStyle: TextStyle().copyWith(
                                              color: Color(0xFFFD687D),
                                            ),
                                          ),
                                          headerStyle: HeaderStyle(
                                            titleTextStyle: TextStyle(
                                              fontFamily: 'poppins',
                                              color: Color(0xFF008990),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          // builders: CalendarBuilders(

                                          //  )
                                          builders: CalendarBuilders(
                                            selectedDayBuilder:
                                                (context, date, _) {
                                              return Container(
                                                margin:
                                                    const EdgeInsets.all(5.0),
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                decoration: BoxDecoration(
                                                  // borderRadius: BorderRadius.circular(5),

                                                  border: Border(
                                                    top: BorderSide(
                                                        width: 1.0,
                                                        color:
                                                            Color(0xFF2511AE)),
                                                    left: BorderSide(
                                                        width: 1.0,
                                                        color:
                                                            Color(0xFF2511AE)),
                                                    right: BorderSide(
                                                        width: 1.0,
                                                        color:
                                                            Color(0xFF2511AE)),
                                                    bottom: BorderSide(
                                                        width: 4.0,
                                                        color:
                                                            Color(0xFF2511AE)),
                                                  ),
                                                  // color: Color(0xFF008990),
                                                  color: Color(0xFFF5FFFB),
                                                ),
                                                width: 100,
                                                height: 100,
                                                child: Container(
                                                  padding:
                                                      EdgeInsets.only(left: 4),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF2511AE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Text(
                                                    '${date.day}',

                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'poppins',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),

                                                    //     .copyWith(fontSize: 16.0),
                                                  ),
                                                ),
                                              );
                                            },
                                            todayDayBuilder:
                                                (context, date, _) {
                                              return Container(
                                                margin:
                                                    const EdgeInsets.all(7.0),
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                // color: Colors.amber[400],
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Color(0xFFB2DFDB),
                                                ),
                                                width: 100,
                                                height: 100,
                                                child: Text(
                                                  '${date.day}',
                                                ),
                                              );
                                            },
                                            markersBuilder: (context, date,
                                                events, holidays) {
                                              final children = <Widget>[];

                                              if (events.isNotEmpty) {
                                                children.add(
                                                  Positioned(
                                                    right: 1,
                                                    top: 1,
                                                    child: _buildEventsMarker(
                                                        date, events),
                                                  ),
                                                );
                                              }

                                              return children;
                                            },
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
                                        // height: 300,
                                        decoration: BoxDecoration(
                                          // color: Colors.white,
                                          color: Color(0xFFF5FFFB),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              // color: Color(0xFF939393),
                                              color: Colors.grey[300],
                                              blurRadius: 5,
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Image.asset(
                                                    "assets/images/head_dark.png",
                                                    height: 21,
                                                    width: 14,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "${activityList[0]['date']}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                activityList[0]['status'] == ""
                                                    ? Container()
                                                    : Container(
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color:
                                                                    selectedColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        margin: EdgeInsets.only(
                                                            left: 5, right: 5),
                                                        child: Text(
                                                          "${activityList[0]['status']}",
                                                          style: TextStyle(
                                                              color:
                                                                  selectedColor,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 9,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                // GestureDetector(
                                                //   onTap: () {
                                                //     setState(() {
                                                //       _simplePopup();
                                                //     });
                                                //   },
                                                //   child: Container(
                                                //       margin: EdgeInsets.only(
                                                //           left: MediaQuery.of(
                                                //                       context)
                                                //                   .size
                                                //                   .width -
                                                //               190),
                                                //       padding: EdgeInsets.all(5),
                                                //       child: Icon(
                                                //         Icons.more_vert,
                                                //         size: 20,
                                                //         color: Colors.grey,
                                                //       )),
                                                // )
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              205),
                                                  child: PopupMenuButton<int>(
                                                    icon: Icon(
                                                      Icons.more_vert,
                                                      size: 20,
                                                      color: Colors.grey,
                                                    ),
                                                    itemBuilder: (context) => [
                                                      PopupMenuItem(
                                                        value: 1,
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            10),
                                                                child: Icon(
                                                                  Icons.edit,
                                                                  color: Color(
                                                                      0xFF707070),
                                                                )),
                                                            Text(
                                                              "Edit",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF707070),
                                                                  fontFamily:
                                                                      'poppins'),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      PopupMenuDivider(),
                                                      PopupMenuItem(
                                                        value: 2,
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            10),
                                                                child: Icon(
                                                                  Icons.delete,
                                                                  color: Color(
                                                                      0xFF707070),
                                                                )),
                                                            Text(
                                                              "Delete",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF707070),
                                                                  fontFamily:
                                                                      'poppins'),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 36),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "${activityList[0]['day']}"
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                  color: selectedColor,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 8,
                                                  // fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: 20, top: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 36),
                                                    child: Text(
                                                      "${activityList[0]['pain']}, ${activityList[0]['hrs']}",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF859592),
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          color: activityList[0]
                                                              ['color'],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Text(
                                                        "${activityList[0]['type']} ",
                                                        //  "${activityList[index]['hrs']}",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 15, right: 15),
                                              child: Row(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment
                                                //         .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      margin: EdgeInsets.only(
                                                          left: 17),
                                                      child: Text(
                                                        "Pills Taken",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF008990),
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    child: Text(
                                                      "${activityList[0]['pills']}",
                                                      style: TextStyle(
                                                          color: selectedColor,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 20,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                  ),
                                                  Image.asset(
                                                      "assets/images/pill_num.png"),
                                                  Container(
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      margin: EdgeInsets.only(
                                                          left: 38),
                                                      child: Text(
                                                        "Triggers",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF008990),
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 0,
                                                        right: 10,
                                                        top: 0),
                                                    child: Image.asset(
                                                      "assets/images/cloud.png",
                                                      height: 15,
                                                      width: 15,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 0,
                                                        right: 10,
                                                        top: 0),
                                                    child: Image.asset(
                                                      "assets/images/apple.png",
                                                      height: 15,
                                                      width: 15,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 0,
                                                        right: 10,
                                                        top: 0),
                                                    child: Image.asset(
                                                      "assets/images/glass.png",
                                                      height: 15,
                                                      width: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(),
                                            Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 8),
                                                  child: Icon(
                                                    Icons.notifications_active,
                                                    size: 18,
                                                    color: Color(0xFF2511AE),
                                                  ),
                                                  //  Image.asset(
                                                  //   "assets/images/head_dark.png",
                                                  //   height: 21,
                                                  //   width: 14,
                                                  // ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "${activityList[0]['date']}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                activityList[0]['status'] == ""
                                                    ? Container()
                                                    : Container(
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color:
                                                                    selectedColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        margin: EdgeInsets.only(
                                                            left: 5, right: 5),
                                                        child: Text(
                                                          "${activityList[0]['status']}",
                                                          style: TextStyle(
                                                              color:
                                                                  selectedColor,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 9,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                // GestureDetector(
                                                //   onTap: () {
                                                //     setState(() {
                                                //       _simplePopup();
                                                //     });
                                                //   },
                                                //   child: Container(
                                                //       margin: EdgeInsets.only(
                                                //           left: MediaQuery.of(
                                                //                       context)
                                                //                   .size
                                                //                   .width -
                                                //               190),
                                                //       padding: EdgeInsets.all(5),
                                                //       child: Icon(
                                                //         Icons.more_vert,
                                                //         size: 20,
                                                //         color: Colors.grey,
                                                //       )),
                                                // )
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              205),
                                                  child: PopupMenuButton<int>(
                                                    icon: Icon(
                                                      Icons.more_vert,
                                                      size: 20,
                                                      color: Colors.grey,
                                                    ),
                                                    itemBuilder: (context) => [
                                                      // PopupMenuItem(
                                                      //   value: 1,
                                                      //   child: Row(
                                                      //     children: <Widget>[
                                                      //       Container(
                                                      //           padding: EdgeInsets
                                                      //               .only(
                                                      //                   right:
                                                      //                       10),
                                                      //           child: Icon(
                                                      //             Icons.edit,
                                                      //             color: Color(
                                                      //                 0xFF707070),
                                                      //           )),
                                                      //       Text(
                                                      //         "Edit",
                                                      //         style: TextStyle(
                                                      //             color: Color(
                                                      //                 0xFF707070),
                                                      //             fontFamily:
                                                      //                 'poppins'),
                                                      //       ),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                      // PopupMenuDivider(),
                                                      PopupMenuItem(
                                                        value: 2,
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            10),
                                                                child: Icon(
                                                                  Icons.delete,
                                                                  color: Color(
                                                                      0xFF707070),
                                                                )),
                                                            Text(
                                                              "Delete",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF707070),
                                                                  fontFamily:
                                                                      'poppins'),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 36),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "${activityList[0]['day']}"
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                  color: selectedColor,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 8,
                                                  // fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: 20, top: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 36),
                                                    child: Text(
                                                      "Morning Walk, 08:00-09:00",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF859592),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,
                                                        // fontWeight:
                                                        //     FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 15, right: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                    height: 35,
                                                    width: 120,
                                                    margin: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 20),
                                                    child: FlatButton(
                                                      onPressed: () {},
                                                      color: Color(0xFFF5FFFB),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      // padding: EdgeInsets.only(
                                                      //     left: 20,
                                                      //     right: 20,
                                                      //     top: 12,
                                                      //     bottom: 12),
                                                      child: Text(
                                                        'Edit',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF008990),
                                                          fontFamily: 'poppins',
                                                        ),
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              side: BorderSide(
                                                                color: Color(
                                                                    0xFF008990),
                                                                width: 1.25,
                                                              )),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 35,
                                                    width: 120,
                                                    margin: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        right: 15),
                                                    child: FlatButton(
                                                      onPressed: () {},
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      // padding: EdgeInsets.only(left: 42, right: 42, top: 12, bottom: 12),
                                                      color: Color(0xFF008990),
                                                      child: Text(
                                                        'Confirm',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'poppins',
                                                        ),
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              side: BorderSide(
                                                                color: Color(
                                                                    0xFF008990),
                                                              )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(),
                                            Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Image.asset(
                                                    "assets/images/calendar_dark.png",
                                                    height: 21,
                                                    width: 14,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "${activityList[0]['date']}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                activityList[0]['status'] == ""
                                                    ? Container()
                                                    : Container(
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.5,
                                                                color:
                                                                    selectedColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        margin: EdgeInsets.only(
                                                            left: 5, right: 5),
                                                        child: Text(
                                                          "${activityList[0]['status']}",
                                                          style: TextStyle(
                                                              color:
                                                                  selectedColor,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 9,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              205),
                                                  child: PopupMenuButton<int>(
                                                    icon: Icon(
                                                      Icons.more_vert,
                                                      size: 20,
                                                      color: Colors.grey,
                                                    ),
                                                    itemBuilder: (context) => [
                                                      // PopupMenuItem(
                                                      //   value: 1,
                                                      //   child: Row(
                                                      //     children: <Widget>[
                                                      //       Container(
                                                      //           padding: EdgeInsets
                                                      //               .only(
                                                      //                   right:
                                                      //                       10),
                                                      //           child: Icon(
                                                      //             Icons.edit,
                                                      //             color: Color(
                                                      //                 0xFF707070),
                                                      //           )),
                                                      //       Text(
                                                      //         "Edit",
                                                      //         style: TextStyle(
                                                      //             color: Color(
                                                      //                 0xFF707070),
                                                      //             fontFamily:
                                                      //                 'poppins'),
                                                      //       ),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                      // PopupMenuDivider(),
                                                      PopupMenuItem(
                                                        value: 2,
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            10),
                                                                child: Icon(
                                                                  Icons.delete,
                                                                  color: Color(
                                                                      0xFF707070),
                                                                )),
                                                            Text(
                                                              "Delete",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF707070),
                                                                  fontFamily:
                                                                      'poppins'),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 36),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "${activityList[0]['day']}"
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                  color: selectedColor,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 8,
                                                  // fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: 20, top: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 36),
                                                    child: Text(
                                                      "Flower Exhibition, Harley Street",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF859592),
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,
                                                        // fontWeight:
                                                        //     FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 15, right: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                    height: 35,
                                                    width: 120,
                                                    margin: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 20),
                                                    child: FlatButton(
                                                      onPressed: () {},
                                                      color: Color(0xFFF5FFFB),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      // padding: EdgeInsets.only(
                                                      //     left: 20,
                                                      //     right: 20,
                                                      //     top: 12,
                                                      //     bottom: 12),
                                                      child: Text(
                                                        'Edit',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF008990),
                                                          fontFamily: 'poppins',
                                                        ),
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              side: BorderSide(
                                                                color: Color(
                                                                    0xFF008990),
                                                                width: 1.25,
                                                              )),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 35,
                                                    width: 120,
                                                    margin: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        right: 15),
                                                    child: FlatButton(
                                                      onPressed: () {},
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      // padding: EdgeInsets.only(left: 42, right: 42, top: 12, bottom: 12),
                                                      color: Color(0xFF008990),
                                                      child: Text(
                                                        'Confirm',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'poppins',
                                                        ),
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              side: BorderSide(
                                                                color: Color(
                                                                    0xFF008990),
                                                              )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
              // Container(
              //   padding: EdgeInsets.only(top: 5),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: <Widget>[
              //       Container(
              //           margin: EdgeInsets.only(left: 15),
              //           child: BackButton(color: Colors.white)),
              //       Container(
              //           margin: EdgeInsets.only(right: 20),
              //           child: Icon(
              //             Icons.info_outline,
              //             color: Colors.white,
              //           ))
              //     ],
              //   ),
              // )
            ],
          ),
        ));
  }
}
