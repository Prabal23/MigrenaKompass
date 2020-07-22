import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:migrena_kompas/Ajovy/Ajovy.dart';
import 'package:migrena_kompas/ApplicationDiary/ApplicationDiaryScreen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../main.dart';

class BiologicalPage extends StatefulWidget {
  @override
  _BiologicalPageState createState() => _BiologicalPageState();
}

class _BiologicalPageState extends State<BiologicalPage> {
  bool _isCodeGiven = false, isChecked = false, isError = false;
  String pinCode = "1234567", pin = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: _isCodeGiven == false
            ? Container(
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/images/lock.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 11),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25, top: 30),
                    child: Text(
                      "Enter Code",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: PinCodeTextField(
                      length: 7,
                      obsecureText: false,
                      animationType: AnimationType.fade,
                      shape: PinCodeFieldShape.underline,
                      backgroundColor: mainColor,
                      animationDuration: Duration(milliseconds: 300),
                      borderRadius: BorderRadius.circular(5),
                      activeColor: selectedColor,
                      inactiveColor: backColor,
                      fieldHeight: 40,
                      fieldWidth: 40,
                      textInputType: TextInputType.number,
                      textStyle: TextStyle(
                          fontFamily: 'Poppins',
                          color: selectedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      onChanged: (String value) {
                        setState(() {
                          pin = value;
                          if (pin != pinCode) {
                            isError = true;
                          } else {
                            isError = false;
                          }
                        });
                      },
                    ),
                  ),
                  pin == "" || !isError
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.info,
                                color: Colors.redAccent,
                                size: 18,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text("Invalid Code! Please re-enter",
                                    style: TextStyle(
                                        color: selectedColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins")),
                              ),
                            ],
                          ),
                        ),
                  Container(
                    margin: EdgeInsets.only(left: 50, right: 50, top: 30),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: 20),
                            child: CustomSwitchButton(
                              // buttonWidth: 40,
                              // buttonHeight: 20,
                              backgroundColor:
                                  !isChecked ? Colors.white : selectedColor,
                              unCheckedColor: Colors.grey.withOpacity(0.3),
                              animationDuration: Duration(milliseconds: 400),
                              checkedColor: Color(0xFF8ACBCC),
                              checked: isChecked,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy ",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: "\nTerms & Conditions",
                                      style: TextStyle(
                                          color: selectedColor,
                                          fontSize: 10,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: " ut labore et dolore.",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold)),
                                  // can add more TextSpans here...
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (pin != "" && isChecked) {
                          if (!_isCodeGiven) {
                            _isCodeGiven = true;
                          } else {
                            _isCodeGiven = false;
                          }
                        }
                      });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                            top: 30, bottom: 20, left: 55, right: 55),
                        decoration: BoxDecoration(
                            color: pin == "" || !isChecked
                                ? backColor
                                : selectedColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: mainColor)),
                        child: Text("Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins"))),
                  ),
                ]),
              )
            : Container(
                child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ApplicationDiaryScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                      decoration: BoxDecoration(
                          color: subColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              blurRadius: 17,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 15, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/b1.png",
                              width: 45,
                              height: 45,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  "Application Diary",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Ajovy()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                      decoration: BoxDecoration(
                          color: subColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              blurRadius: 17,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 15, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/b2.png",
                              width: 45,
                              height: 45,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  "Ajovy",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
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
                    margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                    decoration: BoxDecoration(
                        color: subColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 17,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/b3.png",
                            width: 45,
                            height: 45,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                "Mechanism of Action",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
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
                    margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                    decoration: BoxDecoration(
                        color: subColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 17,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/b4.png",
                            width: 45,
                            height: 45,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                "Injection",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
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
                    margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                    decoration: BoxDecoration(
                        color: subColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 17,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/b5.png",
                            width: 45,
                            height: 45,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                "SPC",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
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
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
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
                ],
              )),
      ),
    );
  }
}
