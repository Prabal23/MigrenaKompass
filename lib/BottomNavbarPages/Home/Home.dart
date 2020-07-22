import 'package:flutter/material.dart';
import 'package:migrena_kompas/AddMigraineRecord/AddMigraineRecord.dart';
//import 'package:migrena_kompas/BottomNavbarPages/dairy.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../main.dart';
import 'package:flutter/physics.dart';
//import 'package:slider_button/slider_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool visible = true; /////slide show listview
  bool report = true; ////graph show
  bool isReminder = false; ////ajovy show
  bool isTips = false; ////reminder show

  List details = [
    {
      //"image": "assets/images/timer.png",
      "title": "Dec 21, 2019",
      "subtitle": "10+",
      "text": "Hrs",
      "colorCode": Color(0xFFFF9900)
    },
    {
      //"image": "assets/images/timer.png",
      "title": "Dec 11, 2019",
      "subtitle": "4-6",
      "text": "Hrs",
      "colorCode": Color(0xFFEB0000)
    },
    {
      //"image": "assets/images/timer.png",
      "title": "Dec 21, 2019",
      "subtitle": "10+",
      "text": "Hrs",
      "colorCode": Color(0xFFFFCC00)
    },
  ];

  List<DropdownMenuItem<String>> _dropDownSitutionItems;
  ////dropdown list String
  List arr = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ]; ////dropdown list array items
  String val = "", migration = "", imp = ""; ////////dropdown value pass
  double dayMig = 0.0, improve = 0.0;
  @override
  void initState() {
    //////dropdown method
    _dropDownSitutionItems = getDropDownSitutionItems();
    val = _dropDownSitutionItems[0].value;

    super.initState();

    _seriesLineData = List<charts.Series<LinearReports, int>>();
    _generateData();
  }

  List<DropdownMenuItem<String>> getDropDownSitutionItems() {
    ////////drop down button
    List<DropdownMenuItem<String>> items = new List();
    for (String monthList in arr) {
      items.add(new DropdownMenuItem(
          value: monthList,
          child: new Text(
            monthList,
            textAlign: TextAlign.end,
            style: TextStyle(
                fontSize: 12, color: Color(0xFF008990), fontFamily: "Poppins"),
          )));
    }
    return items;
  }

////////////graph list////////////
  List<charts.Series<LinearReports, int>> _seriesLineData;

  _generateData() {
    var data = [
      new LinearReports(0, 35),
      new LinearReports(5, 45),
      new LinearReports(10, 75),
      new LinearReports(15, 65),
      new LinearReports(20, 85),
      new LinearReports(25, 100),
      new LinearReports(30, 95),
    ];

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xFF008990)),
        id: 'Reports',
        data: data,
        domainFn: (LinearReports reports, _) => reports.mig,
        measureFn: (LinearReports reports, _) => reports.day,
      ),
    );
  }

////////////graph list////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: SafeArea(
            child: Stack(children: <Widget>[
          NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  // SliverAppBar(
                  //   expandedHeight: 190.0,
                  //   floating: true,
                  //   pinned: true,
                  //   backgroundColor: selectedColor,
                  //   flexibleSpace: FlexibleSpaceBar(
                  //       centerTitle: true,
                  //       title: Container(
                  //         padding: EdgeInsets.only(
                  //           top: 10,
                  //         ),
                  //         width: MediaQuery.of(context).size.width / 1.8,
                  //         child: Align(
                  //           child: Text("WELCOME Mr./Mrs XYZ",
                  //               style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontSize: 15.0,
                  //                   fontFamily: 'Poppins',
                  //                   fontWeight: FontWeight.bold)),
                  //         ),
                  //       ),
                  //       background: Stack(
                  //         children: <Widget>[
                  //           Container(
                  //             decoration: BoxDecoration(
                  //                 image: DecorationImage(
                  //                     image: AssetImage(
                  //                         "assets/images/flower1.png"),
                  //                     fit: BoxFit.fill)),
                  //           ),
                  //           Container(
                  //             height: 60,
                  //             width: 100,
                  //             margin: EdgeInsets.only(
                  //                 bottom: 40, top: 60, left: 60),
                  //             child: Align(
                  //               alignment: Alignment.center,
                  //               child: Text("Days without \n   migrane",
                  //                   style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 14.0,
                  //                       fontFamily: 'Poppins',
                  //                       fontWeight: FontWeight.bold)),
                  //             ),
                  //           ),
                  //           Container(
                  //             height: 60,
                  //             width: 100,
                  //             margin: EdgeInsets.only(
                  //                 bottom: 40, top: 60, left: 190),
                  //             child: Align(
                  //               alignment: Alignment.center,
                  //               child: Text("Improvement",
                  //                   style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 14.0,
                  //                       fontFamily: 'Poppins',
                  //                       fontWeight: FontWeight.bold)),
                  //             ),
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(top: 110, left: 70),
                  //             child: CircularPercentIndicator(
                  //                 radius: 60.0,
                  //                 lineWidth: 5.0,
                  //                 percent: 0.3,
                  //                 center: new Text(
                  //                   '?',
                  //                   style: TextStyle(
                  //                       color: Colors.white, fontSize: 20),
                  //                 ),
                  //                 backgroundColor: Color(0xFFAFEEEC),
                  //                 progressColor: Color(0xFF4BB1BD)),
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(top: 110, left: 200),
                  //             child: CircularPercentIndicator(
                  //                 radius: 60.0,
                  //                 lineWidth: 5.0,
                  //                 percent: 0.75,
                  //                 center: new Text(
                  //                   '?',
                  //                   style: TextStyle(
                  //                       color: Colors.white, fontSize: 20),
                  //                 ),
                  //                 backgroundColor: Color(0xFFAFEEEC),
                  //                 progressColor: Color(0xFF4BB1BD)),
                  //           ),
                  //         ],
                  //       )),
                  // ),
                  SliverAppBar(
                    actions: <Widget>[
                      Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          ))
                    ],
                    expandedHeight: 190.0,
                    floating: true,
                    pinned: true,
                    backgroundColor: Color(0xFF008990),
                    //title: Text('APPLICATION DIARY'),
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Container(
                          //margin: EdgeInsets.only(bottom:20),
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          width: MediaQuery.of(context).size.width / 1.8,
                          child: Align(
                            child: Text(
                                migration == ""
                                    ? "WELCOME Mr./Ms. XYZ"
                                    : "YOUR RESULTS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        background: Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                //color: Colors.red,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/flower1.png"),
                                      fit: BoxFit.contain)),
                            ),
                            SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top: 40),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(top: 20),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    //height: 60,
                                                    //width: 100,
                                                    margin: EdgeInsets.only(
                                                        bottom: 0, top: 0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                          "Days without\nmigrane",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    //height: 60,
                                                    //width: 100,
                                                    margin: EdgeInsets.only(
                                                        bottom: 0,
                                                        top: 0,
                                                        left: 0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text("Improvement",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 0, left: 0),
                                                    child:
                                                        CircularPercentIndicator(
                                                            radius: 130.0,
                                                            lineWidth: 15.0,
                                                            percent: dayMig,
                                                            center: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          30),
                                                              child: new Text(
                                                                migration == ""
                                                                    ? '?'
                                                                    : migration,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontFamily:
                                                                        "Poppins",
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ),
                                                            backgroundColor:
                                                                progColor,
                                                            progressColor: Color(
                                                                0xFFFFFFFF)),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 0, left: 0),
                                                    child:
                                                        CircularPercentIndicator(
                                                            radius: 130.0,
                                                            lineWidth: 15.0,
                                                            percent: improve,
                                                            center: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          30),
                                                              child: new Text(
                                                                imp == ""
                                                                    ? '?'
                                                                    : imp,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontFamily:
                                                                        "Poppins",
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ),
                                                            backgroundColor:
                                                                progColor,
                                                            progressColor: Color(
                                                                0xFFFFFFFF)),
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
                            ),
                          ],
                        )),

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    !isTips
                        ? Container()
                        : Container(
                            //height: 160,
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                  )
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 15,
                                              margin: EdgeInsets.only(
                                                  left: 10, right: 10, top: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/tips.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: 10,
                                              ),
                                              child: Text(
                                                'Largest Tips',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (isTips) {
                                                isTips = false;
                                              }
                                            });
                                          },
                                          child: Icon(Icons.close,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    'Do not forget to get a drink. Right drinking regime helps reduce risk of headache.',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20, top: 20),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            height: 40,
                                            margin: EdgeInsets.only(
                                                left: 20, right: 5),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  width: 1,
                                                  color: Color(0xFF008990),
                                                )),
                                            child: Center(
                                              child: Text(
                                                'Show All Tips',
                                                style: TextStyle(
                                                  color: selectedColor,
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (isTips) {
                                                isTips = false;
                                              }
                                            });
                                          },
                                          child: Container(
                                            height: 40,
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: BoxDecoration(
                                              color: Color(0xFF008990),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Confirm',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),

                    !isReminder
                        ? Container()
                        : Container(
                            //height: 160,
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                  )
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 15,
                                              margin: EdgeInsets.only(
                                                  left: 10, right: 10, top: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/bell.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: 10,
                                              ),
                                              child: Text(
                                                'Reminder',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (isReminder) {
                                                isReminder = false;
                                              }
                                            });
                                          },
                                          child: Icon(Icons.close,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    'Please apply your Ajovy Injection',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20, top: 20),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            height: 40,
                                            margin: EdgeInsets.only(
                                                left: 20, right: 5),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  width: 1,
                                                  color: Color(0xFF008990),
                                                )),
                                            child: Center(
                                              child: Text(
                                                'Application Dairy',
                                                style: TextStyle(
                                                  color: selectedColor,
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (isReminder) {
                                                isReminder = false;
                                              }
                                            });
                                          },
                                          child: Container(
                                            height: 40,
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: BoxDecoration(
                                              color: Color(0xFF008990),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Confirm',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                    Container(
                      margin: EdgeInsets.only(left: 22, top: 10, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Migraine",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                          Container(
                              width: 60,
                              margin: EdgeInsets.only(bottom: 0, right: 20),
                              child:
                                  Image.asset("assets/images/powered_by.png"))
                        ],
                      ),
                    ),
                    isReminder == true
                        ? Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Container(
                                color: mainColor,
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: details.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.8,
                                          child: Container(
                                              margin: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: details[index]
                                                      ['colorCode'],
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(0, 1),
                                                      color: Colors.grey,
                                                      blurRadius: 2.0,
                                                    )
                                                  ]),
                                              child: Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 12),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(10),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10)),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 20,
                                                            left: 20,
                                                          ),
                                                          child: Text(
                                                            details[index]
                                                                ['title'],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 18),
                                                          )),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 5),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  //height: 15,
                                                                  width: 15,
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10,
                                                                          bottom:
                                                                              15,
                                                                          right:
                                                                              10),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/timer1.png',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .only(
                                                                    bottom: 15,
                                                                  ),
                                                                  child: Text(
                                                                    details[index]
                                                                        [
                                                                        'subtitle'],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16,
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 10,
                                                                    right: 10),
                                                            child: Text(
                                                              details[index]
                                                                  ['text'],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ))));
                                    })),
                          )
                        : Container(),
                    // Stack(
                    //   children: <Widget>[
                    //     GestureDetector(
                    //       onTap: () {
                    //         setState(() {
                    //           ////////////////when click on icon close container,again click tn open////////////////

                    //           if (visible == false) {
                    //             visible = true;
                    //           }
                    //           if (isReminder == false) {
                    //             isReminder = true;
                    //           }
                    //           if (isTips == true) {
                    //             isTips = false;
                    //           }
                    //           dayMig = 0.6;
                    //           improve = 0.3;
                    //           migration = "18/30";
                    //           imp = "30%";
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       AddMigraineRecord()));
                    //         });
                    //       },
                    //       child: Container(
                    //         height: 60,
                    //         margin: EdgeInsets.only(
                    //             left: 20, right: 20, bottom: 30, top: 20),
                    //         decoration: BoxDecoration(
                    //             color: Color(0xFF008991),
                    //             borderRadius: BorderRadius.circular(10)),
                    //         child: Align(
                    //           alignment: Alignment.center,
                    //           child: Text("Add Migrane Record",
                    //               style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 16.0,
                    //                   fontFamily: 'Poppins',
                    //                   fontWeight: FontWeight.bold)),
                    //         ),
                    //       ),
                    //     ),
                    //     Container(
                    //         margin: EdgeInsets.only(
                    //           left: 30,
                    //         ),
                    //         child: Image.asset("assets/images/pain.png"))
                    //   ],
                    // ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          ////////////////when click on icon close container,again click tn open////////////////

                          if (visible == false) {
                            visible = true;
                          }
                          if (isReminder == false) {
                            isReminder = true;
                          }
                          if (isTips == true) {
                            isTips = false;
                          }
                          dayMig = 0.6;
                          improve = 0.3;
                          migration = "18/30";
                          imp = "30%";
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddMigraineRecord()));
                        });
                      },
                      child: Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 15, bottom: 15),
                                margin: EdgeInsets.only(
                                    top: 20, bottom: 10, left: 20, right: 20),
                                decoration: BoxDecoration(
                                    color: selectedColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(width: 1, color: selectedColor)),
                                child: Text("Add Migraine Record",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Poppins"))),
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 10),
                              height: 60,
                              width: 60,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Image.asset("assets/images/pain.png", height: 60, width: 55,))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 20, right: 10),
                                height: 130,
                                width: MediaQuery.of(context).size.width / 2.2,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 1),
                                        color: Colors.grey,
                                        blurRadius: 2.0,
                                      )
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/dairy.png',
                                              ),
                                              fit: BoxFit.fill),
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    Text('Diary',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold))
                                  ],
                                )),
                          ),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                height: 130,
                                width: MediaQuery.of(context).size.width / 2.2,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 1),
                                        color: Colors.grey,
                                        blurRadius: 2.0,
                                      )
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/treat.png',
                                              ),
                                              fit: BoxFit.fill),
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    Text('Treatment',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold))
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(height: 20),
                    !isReminder
                        ? Container()
                        : Container(
                            padding: EdgeInsets.only(
                              top: 20,
                            ),
                            margin: EdgeInsets.only(top: 20),
                            child: SwipeButton(
                              content: Container(
                                padding: EdgeInsets.only(top: 20),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 1),
                                        color: Colors.grey,
                                        blurRadius: 1.0,
                                      )
                                    ]),
                                child: Row(
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        padding: EdgeInsets.only(left: 30),
                                        child: Image.asset(
                                            'assets/images/injection1.png',
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              left: 35, top: 10, right: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text('03:15 pm',
                                                  style: TextStyle(
                                                      color: Color(0xFF818181),
                                                      fontSize: 11,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 4),
                                              Text('AJOVY INJECTION',
                                                  style: TextStyle(
                                                      color: Color(0xFF000000),
                                                      fontSize: 16,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 4),
                                              Text(
                                                  'Slide right to mark complete',
                                                  style: TextStyle(
                                                      color: Color(0xFF000000),
                                                      fontSize: 13,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.normal)),
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              onChanged: (result) {
                                print('onChanged $result');
                                setState(() {
                                  if (isTips == false) {
                                    isTips = true;
                                  } else {
                                    isTips = false;
                                  }
                                  if (isReminder == false) {
                                    isReminder = true;
                                  } else {
                                    isReminder = false;
                                  }
                                });
                              },
                            ),
                          ),
                    SizedBox(height: 20),

                    //////////slide button container//////////
                    Container(
                      //height: 350,
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/Eback.png',
                            ),
                            fit: BoxFit.fill),
                        color: mainColor,
                      ),
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 30),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10,
                                              bottom: 0,
                                              left: 20,
                                              right: 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 15),
                                                // padding: EdgeInsets.only(left: 5),
                                                color: Color(0xFFE1F9F0),
                                                child: Text(
                                                  'Reports',
                                                  style: TextStyle(
                                                    fontFamily: 'poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 20),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Monthly Migraine Report',
                                            style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 10,
                                              // fontWeight: FontWeight.bold,
                                              color: Color(0xFF707070),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 70,
                                    padding: EdgeInsets.only(left: 16),
                                    child: DropdownButtonHideUnderline(
                                      child: Container(
                                        child: DropdownButton(
                                          //icon: Icon(Icons.arrow_drop_down),
                                          isExpanded: true,
                                          // iconDisabledColor:
                                          //     Color(0xFF008990),
                                          iconEnabledColor: Color(0xFF008990),
                                          // iconSize: 40,

                                          //hint: Text('Select Situation'),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF008990),
                                          ),
                                          value: val,
                                          items: _dropDownSitutionItems,
                                          icon: Icon(
                                            Icons.expand_more,
                                            size: 20,
                                          ),
                                          onChanged: (String value) {
                                            setState(() {
                                              val = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              ///////////////////////graph report////////////////
                              report == false
                                  ? Container(
                                      //margin: EdgeInsets.only(left:25, top:20),
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 25, top: 20, right: 30),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  2.75,
                                              // height: 200,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,

                                              // child:  charts.LineChart(seriesList, animate: animate),
                                              child: charts.LineChart(
                                                _seriesLineData,
                                                defaultRenderer: new charts
                                                        .LineRendererConfig(
                                                    includeArea: true),
                                                animate: true,
                                                animationDuration:
                                                    Duration(seconds: 3),
                                                // behaviors: [
                                                //   new charts.ChartTitle('Day',
                                                //       behaviorPosition:
                                                //           charts.BehaviorPosition.end,
                                                //       titleOutsideJustification:
                                                //           charts.OutsideJustification.middleDrawArea),
                                                // ]
                                              ),
                                            ),
                                          ),
                                          Container(
                                            //color: selectedColor,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2.65,
                                            // height: 200,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: EdgeInsets.only(
                                                left: 0,
                                                top: 5,
                                                bottom: 10,
                                                right: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10, left: 25),
                                                  child: Text(
                                                    "Mig",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.redAccent,
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      margin: EdgeInsets.only(
                                                          right: 0,
                                                          bottom: 0,
                                                          left: 20,
                                                          top: 33),
                                                      child: Text(
                                                        "Day",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.redAccent,
                                                        ),
                                                      ),
                                                    ),
                                                    // Container(
                                                    //   margin: EdgeInsets.only(top:50),
                                                    //   child: Image.asset(
                                                    //     "assets/images/slider.png",
                                                    //     height: 30,
                                                    //     width: 40,
                                                    //   ),
                                                    // )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2.7,
                                            margin: EdgeInsets.only(top: 50),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(),
                                                Image.asset(
                                                  "assets/images/slider.png",
                                                  height: 30,
                                                  width: 40,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )

                                  /////////////graph page///////
                                  : Container(
                                      height: 205,
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(
                                          top: 20, left: 25, right: 25),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF5FFFB),
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 1),
                                              color: Colors.grey,
                                              blurRadius: 5.0,
                                            )
                                          ]),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 40, bottom: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10)),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 40, bottom: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text('Enter your data',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18.0,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Text(
                                                    'You need to enter data to generate reports. Reports give insights on your personality.',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF818181),
                                                        fontSize: 10,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      ////////////////when click on icon close container,again click tn open////////////////
                                                      if (report == false) {
                                                        report = true;
                                                      } else {
                                                        report = false;
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                      //height: 40,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4,
                                                      margin: EdgeInsets.only(
                                                          top: 10),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xFF02898F),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              offset:
                                                                  Offset(0, 1),
                                                              color:
                                                                  Colors.grey,
                                                              blurRadius: 2.0,
                                                            )
                                                          ]),
                                                      child: Center(
                                                        child: Text(
                                                            'Enter Data',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      )),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                            ],
                          )),
                    ),
                    Container(
                      //height: 125,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFE1F9F0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 115,
                            margin: EdgeInsets.only(top: 9),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/back.png',
                                    ),
                                    fit: BoxFit.cover),
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                  )
                                ]),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Image.asset('assets/images/back1.png'),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50, bottom: 20),
                            child: Image.asset('assets/images/back2.png'),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15, top: 95),
                            child: Image.asset('assets/images/Ground.png'),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 105, top: 20),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Useful Facts',
                                    style: TextStyle(
                                        color: Color(0xFF02898F),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold)),
                                Text('Know about Migriane',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    '10 Useful facts about migraine to easily cure this problem',
                                    style: TextStyle(
                                        color: Color(0xFF818181),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //height: 125,
                      margin: EdgeInsets.only(left: 10, right: 20, top: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFE1F9F0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 115,
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/back3.png',
                                    ),
                                    fit: BoxFit.fill),
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                  )
                                ]),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 15, right: 30),
                            child: Image.asset('assets/images/people.png'),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(left: 15, top: 92),
                          //   child: Image.asset('assets/images/Ground.png'),
                          // ),
                          Container(
                            margin: EdgeInsets.only(left: 115, top: 10),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('GOALS',
                                    style: TextStyle(
                                        color: Color(0xFF02898F),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold)),
                                Text('Your Weekly Challenges',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    'Complete this 10 challenges to live a happy life',
                                    style: TextStyle(
                                        color: Color(0xFF818181),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 140,
                              margin: EdgeInsets.only(top: 30, bottom: 25),
                              child:
                                  Image.asset("assets/images/main_logo.png")),
                          Container(
                              width: 60,
                              margin: EdgeInsets.only(bottom: 40),
                              child:
                                  Image.asset("assets/images/powered_by.png"))
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          // Container(
          //   padding: EdgeInsets.only(
          //     top: 5,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: <Widget>[
          //       Container(
          //           margin: EdgeInsets.only(left: 310, top: 10),
          //           child: Icon(
          //             Icons.info_outline,
          //             color: Colors.white,
          //           )),
          //     ],
          //   ),
          //),
        ])));
  }
}

////graph class////
class LinearReports {
  final int mig;
  final int day;

  LinearReports(this.mig, this.day);
}
////graph class////

//////////slide button //////
enum SwipePosition {
  SwipeLeft,
  SwipeRight,
}

class SwipeButton extends StatefulWidget {
  const SwipeButton({
    Key key,
    this.content,
    BorderRadius borderRadius,
    this.initialPosition = SwipePosition.SwipeLeft,
    @required this.onChanged,
    this.height = 130,
  })  : assert(initialPosition != null && onChanged != null && height != null),
        this.borderRadius = borderRadius ?? BorderRadius.zero,
        super(key: key);

  final Widget content;
  final BorderRadius borderRadius;
  final double height;
  final SwipePosition initialPosition;
  final ValueChanged<SwipePosition> onChanged;

  @override
  SwipeButtonState createState() => SwipeButtonState();
}

class SwipeButtonState extends State<SwipeButton>
    with SingleTickerProviderStateMixin {
  final GlobalKey _containerKey = GlobalKey();
  final GlobalKey _positionedKey = GlobalKey();

  AnimationController _controller;
  Animation<double> _contentAnimation;
  Offset _start = Offset.zero;

  RenderBox get _positioned => _positionedKey.currentContext.findRenderObject();

  RenderBox get _container => _containerKey.currentContext.findRenderObject();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
    _contentAnimation = Tween<double>(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    if (widget.initialPosition == SwipePosition.SwipeRight) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: widget.height,
      child: Stack(
        key: _containerKey,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: widget.borderRadius,
            ),
            child: ClipRRect(
              clipper: _SwipeButtonClipper(
                animation: _controller,
                borderRadius: widget.borderRadius,
              ),
              borderRadius: widget.borderRadius,
              child: SizedBox.expand(
                child: Padding(
                  padding: EdgeInsets.only(left: 30, right: 20),
                  child: FadeTransition(
                    opacity: _contentAnimation,
                    child: widget.content,
                  ),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              return Align(
                alignment: Alignment((_controller.value * 2.0) - 1.0, 0.0),
                child: child,
              );
            },
            child: GestureDetector(
              onHorizontalDragStart: _onDragStart,
              onHorizontalDragUpdate: _onDragUpdate,
              onHorizontalDragEnd: _onDragEnd,
              child: Container(
                key: _positionedKey,
                width: 20,
                height: widget.height,
                decoration: BoxDecoration(
                  color: Color(0xFF008990),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  //child: widget.thumb,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    final pos = _positioned.globalToLocal(details.globalPosition);
    _start = Offset(pos.dx, 0.0);
    _controller.stop(canceled: true);
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final pos = _container.globalToLocal(details.globalPosition) - _start;
    final extent = _container.size.width - _positioned.size.width;
    _controller.value = (pos.dx.clamp(0.0, extent) / extent);
  }

  void _onDragEnd(DragEndDetails details) {
    final extent = _container.size.width - _positioned.size.width;
    var fractionalVelocity = (details.primaryVelocity / extent).abs();
    if (fractionalVelocity < 0.5) {
      fractionalVelocity = 0.5;
    }
    SwipePosition result;
    double acceleration, velocity;
    if (_controller.value > 0.5) {
      acceleration = 0.5;
      velocity = fractionalVelocity;
      result = SwipePosition.SwipeRight;
    } else {
      acceleration = -0.5;
      velocity = -fractionalVelocity;
      result = SwipePosition.SwipeLeft;
    }
    final simulation = _SwipeSimulation(
      acceleration,
      _controller.value,
      1.0,
      velocity,
    );
    _controller.animateWith(simulation).then((_) {
      if (widget.onChanged != null) {
        widget.onChanged(result);
      }
    });
  }
}

class _SwipeSimulation extends GravitySimulation {
  _SwipeSimulation(
      double acceleration, double distance, double endDistance, double velocity)
      : super(acceleration, distance, endDistance, velocity);

  @override
  double x(double time) => super.x(time).clamp(0.0, 1.0);

  @override
  bool isDone(double time) {
    final _x = x(time).abs();
    return _x <= 0.0 || _x >= 1.0;
  }
}

class _SwipeButtonClipper extends CustomClipper<RRect> {
  const _SwipeButtonClipper({
    @required this.animation,
    @required this.borderRadius,
  })  : assert(animation != null && borderRadius != null),
        super(reclip: animation);

  final Animation<double> animation;
  final BorderRadius borderRadius;

  @override
  RRect getClip(Size size) {
    return borderRadius.toRRect(
      Rect.fromLTRB(
        size.width * animation.value,
        0.0,
        size.width,
        size.height,
      ),
    );
  }

  @override
  bool shouldReclip(_SwipeButtonClipper oldClipper) => true;
}
//////slide Button/////////////
