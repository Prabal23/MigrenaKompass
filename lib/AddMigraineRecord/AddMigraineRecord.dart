import 'package:flutter/material.dart';
import '../main.dart';

class AddMigraineRecord extends StatefulWidget {
  @override
  _AddMigraineRecordState createState() => _AddMigraineRecordState();
}

class _AddMigraineRecordState extends State<AddMigraineRecord> {
  bool isPainded = false,
      isType = false,
      isDuration = false,
      isTrigger = false,
      isActivity = false,
      isMedication = false;
  bool triggerDone = false, ibalginOpen = false, paralenOpen = false;
  String pain = "", type = "", duration = "", ibalgin = "1.5", paralen = "3";
  List triggerList = [
    {"image": "cloud", "tag": "Weather change", "visible": true},
    {"image": "face", "tag": "Stress/Anxiety", "visible": true},
    {"image": "emoji", "tag": "Sleep Issue", "visible": true},
    {"image": "cutlery", "tag": "Skipping Food", "visible": true},
    {"image": "apple", "tag": "Food", "visible": true},
    {"image": "can", "tag": "Alcohol/Caffiene", "visible": true},
    {"image": "glass", "tag": "Bad Drinking Regime", "visible": true},
    {"image": "sound", "tag": "Noise", "visible": true},
    {"image": "reload", "tag": "Change of life Rythm", "visible": true},
    {"image": "calendar", "tag": "Menstruation", "visible": true},
    {"image": "add", "tag": "Other", "visible": true}
  ];

  List activityList = [
    {"image": "union", "tag": "Missed Work/School", "visible": true},
    {"image": "slow", "tag": "Slower at Work/School", "visible": true},
    {"image": "group", "tag": "Missed Family Time", "visible": true},
    {"image": "zzz", "tag": "Hard to Sleep", "visible": true},
    {"image": "bubble", "tag": "Missed Social Activity", "visible": true},
    {"image": "load", "tag": "Hard to Concentrate", "visible": true},
    {"image": "add", "tag": "Other", "visible": true},
  ];

  List<String> medicationList = [
    "Ibalgin",
    "Paralen",
    "Ajovy",
  ];
  var medicationName = List<String>();

  List selectedTriggers = [];
  List selectedActivities = [];

  TextEditingController src = new TextEditingController();

  double ibalginDouble = 0.0;
  int paralenInt = 0;

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(medicationList);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.toLowerCase().contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        medicationName.clear();
        medicationName.addAll(dummyListData);
        //print(friendname);
      });
      return;
    } else {
      setState(() {
        medicationName.clear();
        medicationName.addAll(medicationList);
        //print(friendname);
      });
    }
  }

  @override
  void initState() {
    medicationName.addAll(medicationList);
    super.initState();
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
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                      border: Border.all(color: mainColor)),
                  margin: EdgeInsets.only(left: 8.5, right: 9, top: 0),
                  child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(
                          top: 0, bottom: 20, left: 60, right: 60),
                      decoration: BoxDecoration(
                        color: selectedColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text("Close",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins"))),
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
                            "NEW MIGRAINE RECORD",
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
                                  image:
                                      AssetImage("assets/images/flower1.png"),
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
                    child: Column(
                      children: <Widget>[
                        Container(
                            margin:
                                EdgeInsets.only(right: 20, left: 20, top: 25),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: itemColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300],
                                  blurRadius: 17,
                                )
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            isPainded
                                                ? Container()
                                                : Container(
                                                    width: 8,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                        color: Colors.redAccent,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5))),
                                                  ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: isPainded ? 0 : 5),
                                              padding: EdgeInsets.all(10),
                                              child: Text("Pain",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 13.0,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Icon(
                                              Icons.info_outline,
                                              color:
                                                  Colors.grey.withOpacity(0.65),
                                              size: 16,
                                            )
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isPainded == false) {
                                              isPainded = true;
                                            } else {
                                              isPainded = false;
                                            }
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: <Widget>[
                                              pain == ""
                                                  ? Container()
                                                  : Container(
                                                      width: 15,
                                                      height: 15,
                                                      decoration: BoxDecoration(
                                                          color: pain == "Low"
                                                              ? Color(
                                                                  0xFFfecb00)
                                                              : pain == "Medium"
                                                                  ? Color(
                                                                      0xFFff9900)
                                                                  : Color(
                                                                      0xFFeb0101),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                    pain == ""
                                                        ? "Choose Severity"
                                                        : pain,
                                                    style: TextStyle(
                                                        color: pain == ""
                                                            ? unselectedColor
                                                            : Colors.black54,
                                                        fontSize: 13.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.normal)),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                color: unselectedColor,
                                                size: 18,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                isPainded == false
                                    ? Container()
                                    : Container(
                                        child: Column(
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  pain = "Low";
                                                });
                                              },
                                              child: Container(
                                                color: pain == "Low"
                                                    ? itemSelectedColor
                                                    : itemColor,
                                                padding:
                                                    EdgeInsets.only(left: 25),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      width: 15,
                                                      height: 15,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xFFfecb00),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Text("Low",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 13.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  pain = "Medium";
                                                });
                                              },
                                              child: Container(
                                                color: pain == "Medium"
                                                    ? itemSelectedColor
                                                    : itemColor,
                                                padding:
                                                    EdgeInsets.only(left: 25),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      width: 15,
                                                      height: 15,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xFFff9900),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Text("Medium",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 13.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  pain = "Big";
                                                });
                                              },
                                              child: Container(
                                                color: pain == "Big"
                                                    ? itemSelectedColor
                                                    : itemColor,
                                                padding:
                                                    EdgeInsets.only(left: 25),
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      width: 15,
                                                      height: 15,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xFFeb0101),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Text("Big",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 13.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            )),
                        Container(
                            margin:
                                EdgeInsets.only(right: 20, left: 20, top: 15),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: itemColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300],
                                  blurRadius: 17,
                                )
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            isType
                                                ? Container()
                                                : Container(
                                                    width: 8,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                        color: Colors.redAccent,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5))),
                                                  ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: isType ? 0 : 5),
                                              padding: EdgeInsets.all(10),
                                              child: Text("Type",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 13.0,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Icon(
                                              Icons.info_outline,
                                              color:
                                                  Colors.grey.withOpacity(0.65),
                                              size: 16,
                                            )
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isType == false) {
                                              isType = true;
                                            } else {
                                              isType = false;
                                            }
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: <Widget>[
                                              type == ""
                                                  ? Container()
                                                  : Container(
                                                      width: 15,
                                                      height: 15,
                                                      child: Container(
                                                        width: 15,
                                                        height: 15,
                                                        child: type ==
                                                                "Migraine"
                                                            ? Image.asset(
                                                                "assets/images/kana.png")
                                                            : type ==
                                                                    "Migraine with aura"
                                                                ? Stack(
                                                                    children: <
                                                                        Widget>[
                                                                      Image.asset(
                                                                          "assets/images/kana.png"),
                                                                      Image.asset(
                                                                          "assets/images/gul.png"),
                                                                    ],
                                                                  )
                                                                : type ==
                                                                        "Aura without migraine"
                                                                    ? Image.asset(
                                                                        "assets/images/gul.png")
                                                                    : Image.asset(
                                                                        "assets/images/tera.png"),
                                                      ),
                                                    ),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                    type == ""
                                                        ? "Select Migraine Type"
                                                        : type,
                                                    style: TextStyle(
                                                        color: type == ""
                                                            ? unselectedColor
                                                            : Colors.black54,
                                                        fontSize: 13.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.normal)),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                color: unselectedColor,
                                                size: 18,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                isType == false
                                    ? Container()
                                    : Container(
                                        child: Column(
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  type = "Migraine";
                                                });
                                              },
                                              child: Container(
                                                color: type == "Migraine"
                                                    ? itemSelectedColor
                                                    : itemColor,
                                                padding:
                                                    EdgeInsets.only(left: 25),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      width: 15,
                                                      height: 15,
                                                      child: Image.asset(
                                                          "assets/images/kana.png"),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Text("Migraine",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 13.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  type = "Migraine with aura";
                                                });
                                              },
                                              child: Container(
                                                color:
                                                    type == "Migraine with aura"
                                                        ? itemSelectedColor
                                                        : itemColor,
                                                padding:
                                                    EdgeInsets.only(left: 25),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      width: 15,
                                                      height: 15,
                                                      child: Stack(
                                                        children: <Widget>[
                                                          Image.asset(
                                                              "assets/images/kana.png"),
                                                          Image.asset(
                                                              "assets/images/gul.png"),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Text(
                                                          "Migraine with aura",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 13.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  type =
                                                      "Aura without migraine";
                                                });
                                              },
                                              child: Container(
                                                color: type ==
                                                        "Aura without migraine"
                                                    ? itemSelectedColor
                                                    : itemColor,
                                                padding:
                                                    EdgeInsets.only(left: 25),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      width: 15,
                                                      height: 15,
                                                      child: Image.asset(
                                                          "assets/images/gul.png"),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Text(
                                                          "Aura without migraine",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 13.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  type = "Tension headache";
                                                });
                                              },
                                              child: Container(
                                                color:
                                                    type == "Tension headache"
                                                        ? itemSelectedColor
                                                        : itemColor,
                                                padding:
                                                    EdgeInsets.only(left: 25),
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      width: 15,
                                                      height: 15,
                                                      child: Image.asset(
                                                          "assets/images/tera.png"),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Text(
                                                          "Tension headache",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 13.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            )),
                        Container(
                            margin:
                                EdgeInsets.only(right: 20, left: 20, top: 15),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: itemColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300],
                                  blurRadius: 17,
                                )
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            isDuration
                                                ? Container()
                                                : Container(
                                                    width: 8,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFff9900),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5))),
                                                  ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: isDuration ? 0 : 5),
                                              padding: EdgeInsets.all(10),
                                              child: Text("Duration",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 13.0,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Icon(
                                              Icons.info_outline,
                                              color:
                                                  Colors.grey.withOpacity(0.65),
                                              size: 16,
                                            )
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isDuration == false) {
                                              isDuration = true;
                                            } else {
                                              isDuration = false;
                                            }
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: <Widget>[
                                              duration == ""
                                                  ? Container()
                                                  : Container(
                                                      width: 20,
                                                      height: 20,
                                                      child: duration == "1-3 Hours"
                                                          ? Image.asset(
                                                              "assets/images/i1-3.png")
                                                          : duration ==
                                                                  "4-6 Hours"
                                                              ? Image.asset(
                                                                  "assets/images/i4-6.png")
                                                              : duration ==
                                                                      "7-9 Hours"
                                                                  ? Image.asset(
                                                                      "assets/images/i7-9.png")
                                                                  : Image.asset(
                                                                      "assets/images/i10.png"),
                                                    ),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                    duration == ""
                                                        ? "Select Migraine Duration"
                                                        : duration,
                                                    style: TextStyle(
                                                        color: duration == ""
                                                            ? unselectedColor
                                                            : Colors.black54,
                                                        fontSize: 13.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.normal)),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                color: unselectedColor,
                                                size: 18,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                isDuration == false
                                    ? Container()
                                    : Container(
                                        child: Column(
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  duration = "1-3 Hours";
                                                });
                                              },
                                              child: Container(
                                                color: duration == "1-3 Hours"
                                                    ? itemSelectedColor
                                                    : itemColor,
                                                padding:
                                                    EdgeInsets.only(left: 25),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      width: 20,
                                                      height: 20,
                                                      child: Image.asset(
                                                          "assets/images/i1-3.png"),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Text("1-3 Hours",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 13.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  duration = "4-6 Hours";
                                                });
                                              },
                                              child: Container(
                                                color: duration == "4-6 Hours"
                                                    ? itemSelectedColor
                                                    : itemColor,
                                                padding:
                                                    EdgeInsets.only(left: 25),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      width: 20,
                                                      height: 20,
                                                      child: Image.asset(
                                                          "assets/images/i4-6.png"),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Text("4-6 Hours",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 13.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  duration = "7-9 Hours";
                                                });
                                              },
                                              child: Container(
                                                color: duration == "7-9 Hours"
                                                    ? itemSelectedColor
                                                    : itemColor,
                                                padding:
                                                    EdgeInsets.only(left: 25),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      width: 20,
                                                      height: 20,
                                                      child: Image.asset(
                                                          "assets/images/i7-9.png"),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Text("7-9 Hours",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 13.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  duration = "10+ Hours";
                                                });
                                              },
                                              child: Container(
                                                color: duration == "10+ Hours"
                                                    ? itemSelectedColor
                                                    : itemColor,
                                                padding:
                                                    EdgeInsets.only(left: 25),
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      width: 20,
                                                      height: 20,
                                                      child: Image.asset(
                                                          "assets/images/i10.png"),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Text("10+ Hours",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 13.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            )),
                        Stack(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(
                                    right: 20, left: 20, top: 15),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 17,
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                isTrigger
                                                    ? Container()
                                                    : Container(
                                                        width: 5,
                                                        height: 60,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .redAccent,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5))),
                                                      ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: isTrigger ? 0 : 5),
                                                  padding: EdgeInsets.all(10),
                                                  child: Text("Triggers",
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 13.0,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                Icon(
                                                  Icons.info_outline,
                                                  color: Colors.grey
                                                      .withOpacity(0.65),
                                                  size: 16,
                                                )
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (isTrigger == false) {
                                                  isTrigger = true;
                                                } else {
                                                  isTrigger = false;
                                                }
                                              });
                                            },
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    child: Text(
                                                        "Choose All Triggers",
                                                        style: TextStyle(
                                                            color: selectedTriggers
                                                                        .length ==
                                                                    0
                                                                ? unselectedColor
                                                                : Colors
                                                                    .black54,
                                                            fontSize: 13.0,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                  ),
                                                  Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: unselectedColor,
                                                    size: 18,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    isTrigger
                                        ? Container()
                                        : selectedTriggers.length == 0
                                            ? Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    margin: EdgeInsets.only(
                                                        left: 15,
                                                        right: 5,
                                                        bottom: 10),
                                                    decoration: BoxDecoration(
                                                      color: backColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 0),
                                                      child: Wrap(
                                                        children: <Widget>[
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(top: 2),
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/add1.png",
                                                                width: 17,
                                                                height: 17,
                                                              )),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5,
                                                                    right: 5),
                                                            child: Text(
                                                              "Add Triggers",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Poppins'),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.only(
                                                    bottom: 0,
                                                    top: 0,
                                                    left: 5,
                                                    right: 5),
                                                margin: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 10),
                                                child: Wrap(
                                                    children: List.generate(
                                                        selectedTriggers.length,
                                                        (int index) {
                                                  String img =
                                                      "${selectedTriggers[index]['image']}";
                                                  print(img);
                                                  return Container(
                                                    padding: EdgeInsets.all(5),
                                                    margin: EdgeInsets.only(
                                                      left: 5,
                                                      right: 5,
                                                      top: 5,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: selectedColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Wrap(
                                                        children: <Widget>[
                                                          Container(
                                                              child:
                                                                  Image.asset(
                                                            "assets/images/${selectedTriggers[index]['image']}.png",
                                                            width: 17,
                                                            height: 17,
                                                          )),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5,
                                                                    right: 5),
                                                            child: Text(
                                                              "${selectedTriggers[index]['tag']}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Poppins'),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                triggerList[selectedTriggers[
                                                                            index]
                                                                        [
                                                                        'index']]
                                                                    [
                                                                    'visible'] = true;
                                                                selectedTriggers
                                                                    .removeAt(
                                                                        index);
                                                              });
                                                            },
                                                            child: Container(
                                                                child:
                                                                    Image.asset(
                                                              "assets/images/cancel.png",
                                                              width: 17,
                                                              height: 17,
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                })),
                                              ),
                                  ],
                                )),
                            Container(
                                margin: EdgeInsets.only(
                                    right: 20,
                                    left: isTrigger ? 20 : 28,
                                    top: 15),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: itemColor,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                isTrigger
                                                    ? Container()
                                                    : Container(
                                                        width: 5,
                                                        height: 60,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5))),
                                                      ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: isTrigger ? 0 : 5),
                                                  padding: EdgeInsets.all(10),
                                                  child: Text("Triggers",
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 13.0,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                Icon(
                                                  Icons.info_outline,
                                                  color: Colors.grey
                                                      .withOpacity(0.65),
                                                  size: 16,
                                                )
                                              ],
                                            ),
                                          ),
                                          isTrigger
                                              ? GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (isTrigger == false) {
                                                        isTrigger = true;
                                                      } else {
                                                        isTrigger = false;
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 10),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          child: Text(
                                                              "Choose All Triggers",
                                                              style: TextStyle(
                                                                  color: selectedTriggers
                                                                              .length ==
                                                                          0
                                                                      ? unselectedColor
                                                                      : Colors
                                                                          .black54,
                                                                  fontSize:
                                                                      13.0,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal)),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          color:
                                                              unselectedColor,
                                                          size: 18,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : selectedTriggers.length == 0
                                                  ? Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 15),
                                                            child: Icon(
                                                              Icons.info,
                                                              color: Colors
                                                                  .redAccent,
                                                              size: 20,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .keyboard_arrow_down,
                                                            color:
                                                                unselectedColor,
                                                            size: 18,
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  : GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          if (isTrigger ==
                                                              false) {
                                                            isTrigger = true;
                                                          } else {
                                                            isTrigger = false;
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            right: 10),
                                                        child: Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          color:
                                                              unselectedColor,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ),
                                        ],
                                      ),
                                    ),
                                    isTrigger
                                        ? Container()
                                        : selectedTriggers.length == 0
                                            ? Row(
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (isTrigger ==
                                                            false) {
                                                          isTrigger = true;
                                                        } else {
                                                          isTrigger = false;
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      margin: EdgeInsets.only(
                                                          left: 15,
                                                          right: 5,
                                                          bottom: 10),
                                                      decoration: BoxDecoration(
                                                        color: backColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 0),
                                                        child: Wrap(
                                                          children: <Widget>[
                                                            Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 2),
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/add1.png",
                                                                  width: 17,
                                                                  height: 17,
                                                                )),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 5,
                                                                      right: 5),
                                                              child: Text(
                                                                "Add Triggers",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'Poppins'),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.only(
                                                    bottom: 0,
                                                    top: 0,
                                                    left: 5,
                                                    right: 5),
                                                margin: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 10),
                                                child: Wrap(
                                                    children: List.generate(
                                                        selectedTriggers.length,
                                                        (int index) {
                                                  String img =
                                                      "${selectedTriggers[index]['image']}";
                                                  print(img);
                                                  return Container(
                                                    padding: EdgeInsets.all(5),
                                                    margin: EdgeInsets.only(
                                                      left: 5,
                                                      right: 5,
                                                      top: 5,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: selectedColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Wrap(
                                                        children: <Widget>[
                                                          Container(
                                                              child:
                                                                  Image.asset(
                                                            "assets/images/${selectedTriggers[index]['image']}.png",
                                                            width: 17,
                                                            height: 17,
                                                          )),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5,
                                                                    right: 5),
                                                            child: Text(
                                                              "${selectedTriggers[index]['tag']}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Poppins'),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                triggerList[selectedTriggers[
                                                                            index]
                                                                        [
                                                                        'index']]
                                                                    [
                                                                    'visible'] = true;
                                                                selectedTriggers
                                                                    .removeAt(
                                                                        index);
                                                              });
                                                            },
                                                            child: Container(
                                                                child:
                                                                    Image.asset(
                                                              "assets/images/cancel.png",
                                                              width: 17,
                                                              height: 17,
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                })),
                                              ),
                                    selectedTriggers.length == 0
                                        ? Container()
                                        : isTrigger == false
                                            ? Container()
                                            : Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey[300],
                                                      blurRadius: 6,
                                                    )
                                                  ],
                                                ),
                                                padding: EdgeInsets.only(
                                                    bottom: 10,
                                                    top: 10,
                                                    left: 5,
                                                    right: 5),
                                                margin: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Wrap(
                                                    children: List.generate(
                                                        selectedTriggers.length,
                                                        (int index) {
                                                  String img =
                                                      "${selectedTriggers[index]['image']}";
                                                  print(img);
                                                  return Container(
                                                    padding: EdgeInsets.all(5),
                                                    margin: EdgeInsets.only(
                                                      left: 5,
                                                      right: 5,
                                                      top: 5,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: selectedColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Wrap(
                                                        children: <Widget>[
                                                          Container(
                                                              child:
                                                                  Image.asset(
                                                            "assets/images/${selectedTriggers[index]['image']}.png",
                                                            width: 17,
                                                            height: 17,
                                                          )),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5,
                                                                    right: 5),
                                                            child: Text(
                                                              "${selectedTriggers[index]['tag']}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Poppins'),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                triggerList[selectedTriggers[
                                                                            index]
                                                                        [
                                                                        'index']]
                                                                    [
                                                                    'visible'] = true;
                                                                selectedTriggers
                                                                    .removeAt(
                                                                        index);
                                                              });
                                                            },
                                                            child: Container(
                                                                child:
                                                                    Image.asset(
                                                              "assets/images/cancel.png",
                                                              width: 17,
                                                              height: 17,
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                })),
                                              ),
                                    isTrigger == false
                                        ? Container()
                                        : Container(
                                            padding: EdgeInsets.only(
                                                left: 5, right: 5, bottom: 15),
                                            child: Wrap(
                                                children: List.generate(
                                                    triggerList.length,
                                                    (int index) {
                                              return triggerList[index]
                                                          ['visible'] ==
                                                      false
                                                  ? Container()
                                                  : GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          triggerList[index]
                                                                  ['visible'] =
                                                              false;
                                                          selectedTriggers.add({
                                                            "image":
                                                                "${triggerList[index]['image']}1",
                                                            "tag":
                                                                "${triggerList[index]['tag']}",
                                                            "visible": false,
                                                            "index": index
                                                          });
                                                        });
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 5,
                                                        ),
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                width: 1,
                                                                color:
                                                                    selectedColor)),
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 5),
                                                          child: Wrap(
                                                            children: <Widget>[
                                                              Container(
                                                                  child: Image
                                                                      .asset(
                                                                "assets/images/${triggerList[index]['image']}.png",
                                                                width: 17,
                                                                height: 17,
                                                              )),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left: 5,
                                                                        right:
                                                                            5),
                                                                child: Text(
                                                                  "${triggerList[index]['tag']}",
                                                                  style: TextStyle(
                                                                      color:
                                                                          selectedColor,
                                                                      fontFamily:
                                                                          'Poppins'),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                            })),
                                          ),
                                    isTrigger
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (isTrigger == false) {
                                                  isTrigger = true;
                                                } else {
                                                  isTrigger = false;
                                                }
                                              });
                                            },
                                            child: Container(
                                                width: 130,
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.only(
                                                    top: 10, bottom: 20),
                                                decoration: BoxDecoration(
                                                    color: selectedColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Text("Confirm",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily:
                                                            "Poppins"))),
                                          )
                                        : Container()
                                  ],
                                )),
                          ],
                        ),

                        ///// Activities /////
                        Stack(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(
                                    right: 20, left: 20, top: 15),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Color(0xFFfecb00),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 17,
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                isActivity
                                                    ? Container()
                                                    : Container(
                                                        width: 5,
                                                        height: 60,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xFFfecb00),
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5))),
                                                      ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: isActivity ? 0 : 5),
                                                  padding: EdgeInsets.all(10),
                                                  child: Text("Activities",
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 13.0,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                Icon(
                                                  Icons.info_outline,
                                                  color: Colors.grey
                                                      .withOpacity(0.65),
                                                  size: 16,
                                                )
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (isActivity == false) {
                                                  isActivity = true;
                                                } else {
                                                  isActivity = false;
                                                }
                                              });
                                            },
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    child: Text(
                                                        "Choose All Activities",
                                                        style: TextStyle(
                                                            color: selectedActivities
                                                                        .length ==
                                                                    0
                                                                ? unselectedColor
                                                                : Colors
                                                                    .black54,
                                                            fontSize: 13.0,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                  ),
                                                  Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: unselectedColor,
                                                    size: 18,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    isActivity
                                        ? Container()
                                        : selectedActivities.length == 0
                                            ? Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    margin: EdgeInsets.only(
                                                        left: 15,
                                                        right: 5,
                                                        bottom: 10),
                                                    decoration: BoxDecoration(
                                                      color: backColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 0),
                                                      child: Wrap(
                                                        children: <Widget>[
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(top: 2),
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/add1.png",
                                                                width: 17,
                                                                height: 17,
                                                              )),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5,
                                                                    right: 5),
                                                            child: Text(
                                                              "Add Triggers",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Poppins'),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.only(
                                                    bottom: 0,
                                                    top: 0,
                                                    left: 5,
                                                    right: 5),
                                                margin: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 10),
                                                child: Wrap(
                                                    children: List.generate(
                                                        selectedActivities
                                                            .length,
                                                        (int index) {
                                                  String img =
                                                      "${selectedActivities[index]['image']}";
                                                  print(img);
                                                  return Container(
                                                    padding: EdgeInsets.all(5),
                                                    margin: EdgeInsets.only(
                                                      left: 5,
                                                      right: 5,
                                                      top: 5,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: selectedColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Wrap(
                                                        children: <Widget>[
                                                          Container(
                                                              child:
                                                                  Image.asset(
                                                            "assets/images/${selectedActivities[index]['image']}.png",
                                                            width: 17,
                                                            height: 17,
                                                          )),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5,
                                                                    right: 5),
                                                            child: Text(
                                                              "${selectedActivities[index]['tag']}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Poppins'),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                activityList[selectedActivities[
                                                                            index]
                                                                        [
                                                                        'index']]
                                                                    [
                                                                    'visible'] = true;
                                                                selectedActivities
                                                                    .removeAt(
                                                                        index);
                                                              });
                                                            },
                                                            child: Container(
                                                                child:
                                                                    Image.asset(
                                                              "assets/images/cancel.png",
                                                              width: 17,
                                                              height: 17,
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                })),
                                              ),
                                  ],
                                )),
                            Container(
                                margin: EdgeInsets.only(
                                    right: 20,
                                    left: isActivity ? 20 : 28,
                                    top: 15),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: itemColor,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                isActivity
                                                    ? Container()
                                                    : Container(
                                                        width: 5,
                                                        height: 60,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5))),
                                                      ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: isActivity ? 0 : 0),
                                                  padding: EdgeInsets.all(10),
                                                  child: Text("Activity",
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 13.0,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                Icon(
                                                  Icons.info_outline,
                                                  color: Colors.grey
                                                      .withOpacity(0.65),
                                                  size: 16,
                                                )
                                              ],
                                            ),
                                          ),
                                          isActivity
                                              ? GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (isActivity == false) {
                                                        isActivity = true;
                                                      } else {
                                                        isActivity = false;
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 10),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          child: Text(
                                                              "Choose All Activities",
                                                              style: TextStyle(
                                                                  color: selectedActivities
                                                                              .length ==
                                                                          0
                                                                      ? unselectedColor
                                                                      : Colors
                                                                          .black54,
                                                                  fontSize:
                                                                      13.0,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal)),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          color:
                                                              unselectedColor,
                                                          size: 18,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : selectedActivities.length == 0
                                                  ? Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 15),
                                                            child: Icon(
                                                              Icons.info,
                                                              color: Colors
                                                                  .redAccent,
                                                              size: 20,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .keyboard_arrow_down,
                                                            color:
                                                                unselectedColor,
                                                            size: 18,
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  : GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          if (isActivity ==
                                                              false) {
                                                            isActivity = true;
                                                          } else {
                                                            isActivity = false;
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            right: 10),
                                                        child: Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          color:
                                                              unselectedColor,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ),
                                        ],
                                      ),
                                    ),
                                    isActivity
                                        ? Container()
                                        : selectedActivities.length == 0
                                            ? Row(
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (isActivity ==
                                                            false) {
                                                          isActivity = true;
                                                        } else {
                                                          isActivity = false;
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      margin: EdgeInsets.only(
                                                          left: 15,
                                                          right: 5,
                                                          bottom: 10),
                                                      decoration: BoxDecoration(
                                                        color: backColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 0),
                                                        child: Wrap(
                                                          children: <Widget>[
                                                            Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 2),
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/add1.png",
                                                                  width: 17,
                                                                  height: 17,
                                                                )),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 5,
                                                                      right: 5),
                                                              child: Text(
                                                                "Add Triggers",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'Poppins'),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.only(
                                                    bottom: 0,
                                                    top: 0,
                                                    left: 5,
                                                    right: 5),
                                                margin: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 10),
                                                child: Wrap(
                                                    children: List.generate(
                                                        selectedActivities
                                                            .length,
                                                        (int index) {
                                                  String img =
                                                      "${selectedActivities[index]['image']}";
                                                  print(img);
                                                  return Container(
                                                    padding: EdgeInsets.all(5),
                                                    margin: EdgeInsets.only(
                                                      left: 5,
                                                      right: 5,
                                                      top: 5,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: selectedColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Wrap(
                                                        children: <Widget>[
                                                          Container(
                                                              child:
                                                                  Image.asset(
                                                            "assets/images/${selectedActivities[index]['image']}.png",
                                                            width: 17,
                                                            height: 17,
                                                          )),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5,
                                                                    right: 5),
                                                            child: Text(
                                                              "${selectedActivities[index]['tag']}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Poppins'),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                activityList[selectedActivities[
                                                                            index]
                                                                        [
                                                                        'index']]
                                                                    [
                                                                    'visible'] = true;
                                                                selectedActivities
                                                                    .removeAt(
                                                                        index);
                                                              });
                                                            },
                                                            child: Container(
                                                                child:
                                                                    Image.asset(
                                                              "assets/images/cancel.png",
                                                              width: 17,
                                                              height: 17,
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                })),
                                              ),
                                    selectedActivities.length == 0
                                        ? Container()
                                        : isActivity == false
                                            ? Container()
                                            : Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey[300],
                                                      blurRadius: 6,
                                                    )
                                                  ],
                                                ),
                                                padding: EdgeInsets.only(
                                                    bottom: 10,
                                                    top: 10,
                                                    left: 5,
                                                    right: 5),
                                                margin: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Wrap(
                                                    children: List.generate(
                                                        selectedActivities
                                                            .length,
                                                        (int index) {
                                                  String img =
                                                      "${selectedActivities[index]['image']}";
                                                  print(img);
                                                  return Container(
                                                    padding: EdgeInsets.all(5),
                                                    margin: EdgeInsets.only(
                                                      left: 5,
                                                      right: 5,
                                                      top: 5,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: selectedColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Wrap(
                                                        children: <Widget>[
                                                          Container(
                                                              child:
                                                                  Image.asset(
                                                            "assets/images/${selectedActivities[index]['image']}.png",
                                                            width: 17,
                                                            height: 17,
                                                          )),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5,
                                                                    right: 5),
                                                            child: Text(
                                                              "${selectedActivities[index]['tag']}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Poppins'),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                activityList[selectedActivities[
                                                                            index]
                                                                        [
                                                                        'index']]
                                                                    [
                                                                    'visible'] = true;
                                                                selectedActivities
                                                                    .removeAt(
                                                                        index);
                                                              });
                                                            },
                                                            child: Container(
                                                                child:
                                                                    Image.asset(
                                                              "assets/images/cancel.png",
                                                              width: 17,
                                                              height: 17,
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                })),
                                              ),
                                    isActivity == false
                                        ? Container()
                                        : Container(
                                            padding: EdgeInsets.only(
                                                left: 5, right: 5, bottom: 15),
                                            child: Wrap(
                                                children: List.generate(
                                                    activityList.length,
                                                    (int index) {
                                              return activityList[index]
                                                          ['visible'] ==
                                                      false
                                                  ? Container()
                                                  : GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          activityList[index]
                                                                  ['visible'] =
                                                              false;
                                                          selectedActivities
                                                              .add({
                                                            "image":
                                                                "${activityList[index]['image']}1",
                                                            "tag":
                                                                "${activityList[index]['tag']}",
                                                            "visible": false,
                                                            "index": index
                                                          });
                                                        });
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        margin: EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 5,
                                                        ),
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                                width: 1,
                                                                color:
                                                                    selectedColor)),
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 5),
                                                          child: Wrap(
                                                            children: <Widget>[
                                                              Container(
                                                                  child: Image
                                                                      .asset(
                                                                "assets/images/${activityList[index]['image']}.png",
                                                                width: 17,
                                                                height: 17,
                                                              )),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left: 5,
                                                                        right:
                                                                            5),
                                                                child: Text(
                                                                  "${activityList[index]['tag']}",
                                                                  style: TextStyle(
                                                                      color:
                                                                          selectedColor,
                                                                      fontFamily:
                                                                          'Poppins'),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                            })),
                                          ),
                                    isActivity
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (isActivity == false) {
                                                  isActivity = true;
                                                } else {
                                                  isActivity = false;
                                                }
                                              });
                                            },
                                            child: Container(
                                                width: 130,
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.only(
                                                    top: 10, bottom: 20),
                                                decoration: BoxDecoration(
                                                    color: selectedColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Text("Confirm",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily:
                                                            "Poppins"))),
                                          )
                                        : Container()
                                  ],
                                )),
                          ],
                        ),

                        ///// Medication /////
                        Container(
                            margin: EdgeInsets.only(
                                right: 20, left: 20, top: 15, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: itemColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300],
                                  blurRadius: 17,
                                )
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            isMedication
                                                ? Container()
                                                : Container(
                                                    width: 8,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFff9900),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  5),
                                                        )),
                                                  ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: isMedication ? 0 : 5),
                                              padding: EdgeInsets.all(10),
                                              child: Text("Medication",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 13.0,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Icon(
                                              Icons.info_outline,
                                              color:
                                                  Colors.grey.withOpacity(0.65),
                                              size: 16,
                                            )
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isMedication == false) {
                                              isMedication = true;
                                            } else {
                                              isMedication = false;
                                            }
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: Text("Choose Medication",
                                                    style: TextStyle(
                                                        color: unselectedColor,
                                                        fontSize: 13.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.normal)),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                color: unselectedColor,
                                                size: 18,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                isMedication == false
                                    ? Container()
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10, top: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[300],
                                              blurRadius: 6,
                                            )
                                          ],
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.search,
                                              color: unselectedColor,
                                            ),
                                            Flexible(
                                              child: TextField(
                                                onChanged: (value) {
                                                  filterSearchResults(value);
                                                },
                                                controller: src,
                                                autofocus: false,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: 'Oswald',
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: "Search Medication",
                                                  hintStyle: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 13,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.normal),
                                                  //labelStyle: TextStyle(color: Colors.white70),
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10.0, 0, 20.0, 0),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                isMedication == false
                                    ? Container()
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[300],
                                              blurRadius: 6,
                                            )
                                          ],
                                        ),
                                        padding: EdgeInsets.only(
                                            bottom: 10,
                                            top: 10,
                                            left: 5,
                                            right: 5),
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                medicationName.length,
                                                (int index) {
                                              return Container(
                                                padding: EdgeInsets.all(5),
                                                margin: EdgeInsets.only(
                                                  left: 5,
                                                  right: 5,
                                                  top: 5,
                                                ),
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 5, right: 5),
                                                        child: Text(
                                                          "${medicationName[index]}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'Poppins'),
                                                        ),
                                                      ),
                                                      medicationName.length -
                                                                  1 ==
                                                              index
                                                          ? Container()
                                                          : Divider()
                                                    ],
                                                  ),
                                                ),
                                              );
                                            })),
                                      ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: isMedication ? 20 : 0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            isMedication
                                                ? Container()
                                                : Container(
                                                    width: 8,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFff9900),
                                                    ),
                                                  ),
                                            Expanded(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                color: itemColor,
                                                padding:
                                                    EdgeInsets.only(left: 15),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      padding: EdgeInsets.only(
                                                          left: 0,
                                                          right: isMedication
                                                              ? 10
                                                              : 0,
                                                          top: isMedication
                                                              ? 10
                                                              : 0,
                                                          bottom: isMedication
                                                              ? 10
                                                              : 0),
                                                      child: Text("Ibalgin",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 13.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (isMedication) {
                                                    if (ibalginOpen == false) {
                                                      ibalginOpen = true;
                                                    } else {
                                                      ibalginOpen = false;
                                                    }
                                                  }
                                                });
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 30),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      child: Text(
                                                          ibalginOpen
                                                              ? ""
                                                              : ibalginDouble
                                                                  .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 13.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                    Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: unselectedColor,
                                                      size: 18,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ibalginOpen == false ||
                                              isMedication == false
                                          ? Container()
                                          : Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: itemColor,
                                              margin:
                                                  EdgeInsets.only(bottom: 20),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        ibalginDouble += 1.0;
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 25,
                                                      height: 25,
                                                      child: Image.asset(
                                                          "assets/images/addition.png"),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        ibalginDouble += 0.5;
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 20,
                                                      height: 20,
                                                      child: Image.asset(
                                                          "assets/images/addition.png"),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    child: Text(
                                                        ibalginDouble
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 13.0,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (ibalginDouble <
                                                            0.5) {
                                                          ibalginDouble = 0.0;
                                                        } else {
                                                          ibalginDouble -= 0.5;
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 20,
                                                      height: 20,
                                                      child: Image.asset(
                                                          "assets/images/subtract.png"),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (ibalginDouble <=
                                                            0.0) {
                                                          ibalginDouble = 0.0;
                                                        } else {
                                                          ibalginDouble -= 1.0;
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 25,
                                                      height: 25,
                                                      child: Image.asset(
                                                          "assets/images/subtract.png"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            isMedication
                                                ? Container()
                                                : Container(
                                                    width: 8,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFff9900),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  5),
                                                        )),
                                                  ),
                                            Expanded(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                color: itemColor,
                                                padding:
                                                    EdgeInsets.only(left: 15),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      padding: EdgeInsets.only(
                                                          left: 0,
                                                          right: isMedication
                                                              ? 10
                                                              : 0,
                                                          top: isMedication
                                                              ? 10
                                                              : 0,
                                                          bottom: isMedication
                                                              ? 10
                                                              : 0),
                                                      child: Text("Paralen",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 13.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (isMedication) {
                                                    if (paralenOpen == false) {
                                                      paralenOpen = true;
                                                    } else {
                                                      paralenOpen = false;
                                                    }
                                                  }
                                                });
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 30),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      child: Text(
                                                          paralenOpen
                                                              ? ""
                                                              : paralenInt
                                                                  .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 13.0,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                    Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: unselectedColor,
                                                      size: 18,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      paralenOpen == false ||
                                              isMedication == false
                                          ? Container()
                                          : Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: itemColor,
                                              margin:
                                                  EdgeInsets.only(bottom: 20),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        paralenInt += 1;
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 25,
                                                      height: 25,
                                                      child: Image.asset(
                                                          "assets/images/addition.png"),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    child: Text(
                                                        paralenInt.toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 13.0,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (paralenInt <= 0) {
                                                          paralenInt = 0;
                                                        } else {
                                                          paralenInt -= 1;
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 25,
                                                      height: 25,
                                                      child: Image.asset(
                                                          "assets/images/subtract.png"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            )),

                        selectedTriggers.length == 0 ||
                                selectedActivities.length == 0
                            ? Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      Icons.info,
                                      color: Colors.redAccent,
                                      size: 16,
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                            "One or more details are missing. Please check again and confirm.",
                                            style: TextStyle(
                                                color: selectedColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins")),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(
                                        top: 10, bottom: 20, right: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 1, color: selectedColor)),
                                    child: Text("Clear Settings",
                                        style: TextStyle(
                                            color: selectedColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins"))),
                              ),
                              Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(
                                        top: 10, bottom: 20, left: 10),
                                    decoration: BoxDecoration(
                                        color: selectedTriggers.length == 0 ||
                                                selectedActivities.length == 0
                                            ? backColor
                                            : selectedColor,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 1, color: mainColor)),
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
                        Container(
                            width: 140,
                            margin: EdgeInsets.only(top: 30, bottom: 25),
                            child: Image.asset("assets/images/main_logo.png")),
                        Container(
                            width: 60,
                            margin: EdgeInsets.only(bottom: 40),
                            child: Image.asset("assets/images/powered_by.png"))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
