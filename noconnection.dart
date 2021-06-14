import 'package:flutter/material.dart';

class errorpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Icon(
                Icons.network_check,
                size: 50.0,
                color: Colors.black,
              ),
            ),
            Center(
              child: Text(
                "No internet connection.. ",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
