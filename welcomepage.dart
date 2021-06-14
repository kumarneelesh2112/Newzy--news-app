import 'dart:async';
import 'homepage.dart';
import 'login.dart';
import 'package:flutter/material.dart';

class welcomepage extends StatefulWidget {
  @override
  _welcomepageState createState() => _welcomepageState();
}

class _welcomepageState extends State<welcomepage> {
  void jump_to_homepage() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => loginpage())));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    jump_to_homepage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Newzy",
              style: TextStyle(
                  fontFamily: 'cursive',
                  fontSize: 80.0,
                  color: Colors.red,
                  fontWeight: FontWeight.w700),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Awareness is the greatest agent for change.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Center(
              child: Text(
                "-Eckhart Tolle",
                textAlign: TextAlign.left,
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400),
              ),
            ),
            Center(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              )),
            ))
          ],
        ),
      ),
    );
  }
}
