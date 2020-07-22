import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class TipsTricksPage extends StatefulWidget {
  @override
  _TipsTricksPageState createState() => _TipsTricksPageState();
}

class _TipsTricksPageState extends State<TipsTricksPage> {
  List imgList = [
    "assets/images/drinking_water.png",
    "assets/images/medicines.png",
  ];

  List txtList = [
    "Do not forget to get a drink. Right drinking regime helps reduce risk of headache.",
    "Right medicine helps reduce risk of migraine.",
  ];

  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
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
                        "TIPS & TRICKS",
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
                              "assets/images/idea.png",
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
                children: <Widget>[
                  Container(
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
                    margin: EdgeInsets.only(
                        bottom: 15, top: 15, left: 15, right: 15),
                    //padding: EdgeInsets.only(top: 5),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(0.0),
                          //color: Colors.black,
                          child: CarouselSlider(
                            height: 350.0,
                            //initialPage: 0,
                            enlargeCenterPage: false,
                            autoPlay: false,
                            reverse: false,
                            //enableInfiniteScroll: true,
                            viewportFraction: 1.0,
                            autoPlayInterval: Duration(seconds: 2),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 2000),
                            //pauseAutoPlayOnTouch: Duration(seconds: 10),
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index) {
                              setState(() {
                                _current = index;
                              });
                            },
                            items: imgList.map((imgUrl) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 20,
                                        bottom: 5),
                                    //margin: EdgeInsets.symmetric(horizontal: 10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(imgUrl),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: map<Widget>(imgList, (index, url) {
                            return Container(
                              width: _current == index ? 8.0 : 6.0,
                              height: _current == index ? 8.0 : 6.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == index
                                    ? selectedColor
                                    : backColor,
                              ),
                            );
                          }),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 15, right: 15, top: 50, bottom: 50),
                          child: Text(
                            "${txtList[_current]}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 55,
                                padding: EdgeInsets.only(top: 2, bottom: 2),
                                decoration: BoxDecoration(
                                    color: selectedColor,
                                    borderRadius: BorderRadius.circular(100)),
                                child: Text(
                                  "${_current + 1}/${imgList.length}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: 140,
                      margin: EdgeInsets.only(top: 30, bottom: 25),
                      child: Image.asset("assets/images/main_logo.png")),
                ],
              ),
            ),
          ),
        ])));
  }
}
