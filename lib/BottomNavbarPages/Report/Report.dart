import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../main.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  static double _height = 200,
      _offset = 20,
      _one = -(_height - _offset),
      _two = (_height - _offset);
  final double _oneFixed = -(_height - _offset);
  final double _twoFixed = (_height - _offset);
  List<charts.Series<LinearReports, int>> _seriesLineData;
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
  ];
  String val = "";

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
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(selectedColor),
        id: 'Reports',
        data: data,
        domainFn: (LinearReports reports, _) => reports.mig,
        measureFn: (LinearReports reports, _) => reports.day,
      ),
    );
  }

  void initState() {
    super.initState();
    _seriesLineData = List<charts.Series<LinearReports, int>>();
    _dropDownSitutionItems = getDropDownSitutionItems();
    val = _dropDownSitutionItems[0].value;
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
                  expandedHeight: 150.0,
                  floating: true,
                  pinned: true,
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
                        "REPORTS",
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
                              "assets/images/reportIcon.png",
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
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: 10, bottom: 0, left: 25, right: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 15),
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
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25),
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
                    Stack(
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2.75,
                            // height: 200,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(15),
                            padding: EdgeInsets.only(
                                top: 15, left: 25, right: 25, bottom: 40),
                            // color: Color(0xFF008990),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [0.1, 0.9],
                                colors: [
                                  Color(0xFFA3DADC),
                                  Color(0xFFE1F9F0),
                                ],
                              ),
                            ),
                            // child:  charts.LineChart(seriesList, animate: animate),
                            child: charts.LineChart(
                              _seriesLineData,
                              defaultRenderer: new charts.LineRendererConfig(
                                  includeArea: true),
                              animate: true,
                              animationDuration: Duration(seconds: 3),
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
                          height: MediaQuery.of(context).size.height / 2.8,
                          // height: 200,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 0, top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 42),
                                child: Text(
                                  "Mig",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerRight,
                                    margin:
                                        EdgeInsets.only(right: 25, bottom: 10),
                                    child: Text(
                                      "Day",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Image.asset(
                                      "assets/images/slider.png",
                                      height: 30,
                                      width: 40,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: FlatButton(
                        onPressed: () {},
                        padding: EdgeInsets.only(
                            left: 42, right: 42, top: 12, bottom: 12),
                        color: Color(0xFF008990),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Image.asset(
                                'assets/images/export.png',
                                height: 20,
                                width: 20,
                                // fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              'Export',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'poppins',
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
                    Container(
                        width: 140,
                        margin: EdgeInsets.only(top: 50, bottom: 25),
                        child: Image.asset("assets/images/main_logo.png")),
                  ],
                ),
              ),
            ),
          ),
        ])));
  }
}

/// Sample linear data type.
class LinearReports {
  final int mig;
  final int day;

  LinearReports(this.mig, this.day);
}
