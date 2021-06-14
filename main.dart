import 'dart:async';
import 'welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'noconnection.dart';
import 'package:url_launcher/url_launcher.dart';

//fae8da09cb3c4efb88266b2bb554465a
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "newseasy",
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: connectionCheck(),
    );
  }
}

class connectionCheck extends StatefulWidget {
  @override
  _connectionCheckState createState() => _connectionCheckState();
}

class _connectionCheckState extends State<connectionCheck> {
  checker() async {
    Timer(Duration(seconds: 5), () {});
    var result = await (Connectivity().checkConnectivity());

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => welcomepage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => errorpage()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        )),
      ),
    );
  }
}
