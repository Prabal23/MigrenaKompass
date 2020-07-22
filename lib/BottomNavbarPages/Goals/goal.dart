import 'package:flutter/material.dart';

import '../../main.dart';

class Goal extends StatefulWidget {
  @override
  _GoalState createState() => _GoalState();
}

class _GoalState extends State<Goal> {
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
                            "GOALS",
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
                                  "assets/images/goalIcon.png",
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 100,
                            width: 60,
                            margin: EdgeInsets.fromLTRB(40, 30, 2, 10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G1.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 100,
                            width: 60,
                            margin: EdgeInsets.fromLTRB(8, 30, 2, 10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G2.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 100,
                            width: 60,
                            margin: EdgeInsets.fromLTRB(8, 30, 2, 10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G3.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 100,
                            width: 60,
                            margin: EdgeInsets.fromLTRB(8, 30, 2, 10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G4.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 100,
                            width: 70,
                            margin: EdgeInsets.fromLTRB(40, 20, 0, 20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G5.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 100,
                            width: 70,
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G6.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 100,
                            width: 70,
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G7.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 100,
                            width: 70,
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G8.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 110,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 100,
                            width: 60,
                            margin: EdgeInsets.fromLTRB(40, 10, 0, 25),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G9.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 100,
                            width: 60,
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 25),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G10.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 100,
                            width: 60,
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 25),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G12.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 100,
                            width: 60,
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 25),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G11.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(left:50, right:50),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right:10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G13.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right:5, left: 5),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G14.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right:0, left: 5),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G15.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right:5, left: 10),
                           decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G16.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right:5, left: 5),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/G17.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    margin: EdgeInsets.only(
                      top: 50,
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/main_logo.png'),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
            ),
          ),
        ])));
  }
}
