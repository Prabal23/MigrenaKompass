import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../main.dart';

class PhysicianPage extends StatefulWidget {
  @override
  _PhysicianPageState createState() => _PhysicianPageState();
}

class _PhysicianPageState extends State<PhysicianPage> {
  CalendarController _calendarController = new CalendarController();
  Map<DateTime, List> _events;

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
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.only(bottom: 80),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          color: Color(0xFFF5FFFB),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              // color: Color(0xFF939393),
                              color: Colors.grey[300],
                              blurRadius: 5,
                            )
                          ],
                        ),
                        child:
                            //  Row(children: <Widget>[
                            //   Expanded(child: TableCalendar(calendarController: _calendarController)),
                            //    Expanded(child: TableCalendar(calendarController: _calendarController)),
                            // ],),
                            TableCalendar(
                          events: _events,
                          calendarController: _calendarController,
                          startingDayOfWeek: StartingDayOfWeek.monday,
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
                            selectedDayBuilder: (context, date, _) {
                              return Container(
                                margin: const EdgeInsets.all(5.0),
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(5),

                                  border: Border(
                                    top: BorderSide(
                                        width: 1.0, color: Color(0xFF2511AE)),
                                    left: BorderSide(
                                        width: 1.0, color: Color(0xFF2511AE)),
                                    right: BorderSide(
                                        width: 1.0, color: Color(0xFF2511AE)),
                                    bottom: BorderSide(
                                        width: 4.0, color: Color(0xFF2511AE)),
                                  ),
                                  // color: Color(0xFF008990),
                                  color: Color(0xFFF5FFFB),
                                ),
                                width: 100,
                                height: 100,
                                child: Container(
                                  padding: EdgeInsets.only(left: 4),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF2511AE),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    '${date.day}',

                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),

                                    //     .copyWith(fontSize: 16.0),
                                  ),
                                ),
                              );
                            },
                            todayDayBuilder: (context, date, _) {
                              return Container(
                                margin: const EdgeInsets.all(7.0),
                                padding: const EdgeInsets.all(8.0),
                                // color: Colors.amber[400],
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFFB2DFDB),
                                ),
                                width: 100,
                                height: 100,
                                child: Text(
                                  '${date.day}',
                                ),
                              );
                            },
                            markersBuilder: (context, date, events, holidays) {
                              final children = <Widget>[];

                              if (events.isNotEmpty) {
                                children.add(
                                  Positioned(
                                    right: 1,
                                    top: 1,
                                    child: _buildEventsMarker(date, events),
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
                          borderRadius: BorderRadius.circular(10),
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
                                  margin: EdgeInsets.only(left: 8),
                                  child:
                                      //  Icon(
                                      //   Icons.notifications_active,
                                      //   size: 18,
                                      //   color: Color(0xFF2511AE),
                                      // ),
                                      Image.asset(
                                    "assets/images/first_aid_kit_icon.png",
                                    height: 21,
                                    width: 14,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${activityList[0]['date']}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                activityList[0]['status'] == ""
                                    ? Container()
                                    : Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5,
                                                color: selectedColor),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        child: Text(
                                          "${activityList[0]['status']}",
                                          style: TextStyle(
                                              color: selectedColor,
                                              fontFamily: 'Poppins',
                                              fontSize: 9,
                                              fontWeight: FontWeight.w600),
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
                                      left: MediaQuery.of(context).size.width -
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
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Color(0xFF707070),
                                                )),
                                            Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: Color(0xFF707070),
                                                  fontFamily: 'poppins'),
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
                                "${activityList[0]['day']}".toUpperCase(),
                                style: TextStyle(
                                  color: selectedColor,
                                  fontFamily: 'Poppins',
                                  fontSize: 8,
                                  // fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 36),
                                    child: Text(
                                      "Physician's Visit",
                                      style: TextStyle(
                                        color: Color(0xFF859592),
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
                              margin:
                                  EdgeInsets.only(top: 10, left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    height: 35,
                                    width: 120,
                                    margin: EdgeInsets.only(
                                        top: 5, bottom: 5, left: 20),
                                    child: FlatButton(
                                      onPressed: () {},
                                      color: Color(0xFFF5FFFB),
                                      padding: EdgeInsets.all(5),
                                      // padding: EdgeInsets.only(
                                      //     left: 20,
                                      //     right: 20,
                                      //     top: 12,
                                      //     bottom: 12),
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(
                                          color: Color(0xFF008990),
                                          fontFamily: 'poppins',
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(
                                            color: Color(0xFF008990),
                                            width: 1.25,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    height: 35,
                                    width: 120,
                                    margin: EdgeInsets.only(
                                        top: 5, bottom: 5, right: 15),
                                    child: FlatButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.all(5),
                                      // padding: EdgeInsets.only(left: 42, right: 42, top: 12, bottom: 12),
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
                                  margin: EdgeInsets.only(left: 8),
                                  child:
                                      // Icon(
                                      //   Icons.notifications_active,
                                      //   size: 18,
                                      //   color: Color(0xFF2511AE),
                                      // ),
                                      Image.asset(
                                    "assets/images/first_aid_kit_icon.png",
                                    height: 21,
                                    width: 14,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${activityList[0]['date']}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                activityList[0]['status'] == ""
                                    ? Container()
                                    : Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5,
                                                color: selectedColor),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        child: Text(
                                          "${activityList[0]['status']}",
                                          style: TextStyle(
                                              color: selectedColor,
                                              fontFamily: 'Poppins',
                                              fontSize: 9,
                                              fontWeight: FontWeight.w600),
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
                                      left: MediaQuery.of(context).size.width -
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
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Color(0xFF707070),
                                                )),
                                            Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: Color(0xFF707070),
                                                  fontFamily: 'poppins'),
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
                                "${activityList[0]['day']}".toUpperCase(),
                                style: TextStyle(
                                  color: selectedColor,
                                  fontFamily: 'Poppins',
                                  fontSize: 8,
                                  // fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 36),
                                    child: Text(
                                      "Physician's Visit",
                                      style: TextStyle(
                                        color: Color(0xFF859592),
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
                              margin:
                                  EdgeInsets.only(top: 10, left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    height: 35,
                                    width: 120,
                                    margin: EdgeInsets.only(
                                        top: 5, bottom: 5, left: 20),
                                    child: FlatButton(
                                      onPressed: () {},
                                      color: Color(0xFFF5FFFB),
                                      padding: EdgeInsets.all(5),
                                      // padding: EdgeInsets.only(
                                      //     left: 20,
                                      //     right: 20,
                                      //     top: 12,
                                      //     bottom: 12),
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(
                                          color: Color(0xFF008990),
                                          fontFamily: 'poppins',
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(
                                            color: Color(0xFF008990),
                                            width: 1.25,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    height: 35,
                                    width: 120,
                                    margin: EdgeInsets.only(
                                        top: 5, bottom: 5, right: 15),
                                    child: FlatButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.all(5),
                                      // padding: EdgeInsets.only(left: 42, right: 42, top: 12, bottom: 12),
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
                                  margin: EdgeInsets.only(left: 10),
                                  child: Image.asset(
                                    "assets/images/first_aid_kit_icon.png",
                                    height: 21,
                                    width: 14,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${activityList[0]['date']}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                activityList[0]['status'] == ""
                                    ? Container()
                                    : Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5,
                                                color: selectedColor),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        child: Text(
                                          "${activityList[0]['status']}",
                                          style: TextStyle(
                                              color: selectedColor,
                                              fontFamily: 'Poppins',
                                              fontSize: 9,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width -
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
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Color(0xFF707070),
                                                )),
                                            Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: Color(0xFF707070),
                                                  fontFamily: 'poppins'),
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
                                "${activityList[0]['day']}".toUpperCase(),
                                style: TextStyle(
                                  color: selectedColor,
                                  fontFamily: 'Poppins',
                                  fontSize: 8,
                                  // fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 36),
                                    child: Text(
                                      "Physician's Visit",
                                      style: TextStyle(
                                        color: Color(0xFF859592),
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
                              margin:
                                  EdgeInsets.only(top: 10, left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    height: 35,
                                    width: 120,
                                    margin: EdgeInsets.only(
                                        top: 5, bottom: 5, left: 20),
                                    child: FlatButton(
                                      onPressed: () {},
                                      color: Color(0xFFF5FFFB),
                                      padding: EdgeInsets.all(5),
                                      // padding: EdgeInsets.only(
                                      //     left: 20,
                                      //     right: 20,
                                      //     top: 12,
                                      //     bottom: 12),
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(
                                          color: Color(0xFF008990),
                                          fontFamily: 'poppins',
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(
                                            color: Color(0xFF008990),
                                            width: 1.25,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    height: 35,
                                    width: 120,
                                    margin: EdgeInsets.only(
                                        top: 5, bottom: 5, right: 15),
                                    child: FlatButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.all(5),
                                      // padding: EdgeInsets.only(left: 42, right: 42, top: 12, bottom: 12),
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
                  // Container(
                  //   child: Column(
                  //     mainAxisAlignment:
                  //         MainAxisAlignment.end,
                  //     children: <Widget>[
                  //       Stack(
                  //         children: <Widget>[
                  //           Container(
                  //               alignment: Alignment.center,
                  //               padding: EdgeInsets.only(
                  //                   top: 15, bottom: 15),
                  //               margin: EdgeInsets.only(
                  //                   top: 10,
                  //                   bottom: 10,
                  //                   left: 40,
                  //                   right: 30),
                  //               decoration: BoxDecoration(
                  //                   color: selectedColor,
                  //                   borderRadius:
                  //                       BorderRadius
                  //                           .circular(10),
                  //                   border: Border.all(
                  //                       width: 1,
                  //                       color: mainColor)),
                  //               child: Text(
                  //                   "Add Physician's Visit",
                  //                   style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 16,
                  //                       fontWeight:
                  //                           FontWeight.w700,
                  //                       fontFamily:
                  //                           "Poppins"))),
                  //           Container(
                  //             margin: EdgeInsets.only(
                  //                 left: 20, top: 2),
                  //             height: 50,
                  //             width: 50,
                  //             padding: EdgeInsets.all(10),
                  //             decoration: BoxDecoration(
                  //                 color: Colors.black
                  //                     .withOpacity(0.2),
                  //                 borderRadius:
                  //                     BorderRadius.circular(
                  //                         100)),
                  //           ),
                  //           Container(
                  //               margin: EdgeInsets.only(
                  //                   left: 20),
                  //               child: Image.asset(
                  //                 "assets/images/add_phy.png",
                  //                 height: 45,
                  //               ))
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          Container(
            child: Column(
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
                        child: Image.asset(
                          "assets/images/add_phy.png",
                          height: 45,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
