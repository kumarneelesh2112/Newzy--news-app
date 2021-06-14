import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newzy/homepage.dart';
import 'new_account.dart';
import 'package:http/http.dart' as http;
import "dart:async";

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future userlogin() async {
    String email = emailController.text;
    String password = passwordController.text;
    //var url = "http://192.168.43.9/newzyserver/login.php";

    //var data = {'email': email, 'password': password};
    //var response = await http.post(url, body: json.encode(data));
    var status = "login success"; //jsonDecode(response.body);
    if (status == "login success") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => homepage()));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("invalid email or password try again"),
              actions: <Widget>[
                FlatButton(
                  child: Text("ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Let's get started....",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(Icons.account_circle, size: 70, color: Colors.red),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 15),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: "enter your email.."),
                  autofocus: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 15),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: "enter your password.."),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        child: Text(
                          "login",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.red,
                        onPressed: () {
                          userlogin();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: RaisedButton(
                          child: Text(
                            "sign up ",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.red,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => make_account()));
                          },
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
