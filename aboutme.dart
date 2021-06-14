import 'package:flutter/material.dart';

class aboutme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Me",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10),
                child: Text("Hi..There ",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.red[400]))),
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "My name is Neelesh Kumar . I am second year undergraduate from NIT RAIPUR . I made Newzy  app so all the news get available with one touch, this app use an API based app developed with Flutter .I have provided many interactive features to users and also option to search their interested topics                                                                                                                       I hope you are enjoying Neezy ,but if you have any techinical issue or want to provide us suggestions please do suggest here....  ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black))),
            Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  minLines: 5,
                  maxLines: 10,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Write your query  here',
                    filled: true,
                    fillColor: Colors.red[50],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(8),
              child: RaisedButton(
                onPressed: () {},
                child: Text("submit"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.red,
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
