import 'dart:async';
import 'package:se_final/screens/emergency.dart';
import 'package:flutter/material.dart';

class Emergency2 extends StatefulWidget {
  @override
  _Emergency2State createState() => _Emergency2State();
}

class _Emergency2State extends State<Emergency2> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 5000), () {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Details()));
    });

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.black,
                    ),
                    strokeWidth: 6,
                    backgroundColor: Color(0xffadddce),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Text(
                      'Sending details and information to the available medical professional...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 23),
                    ),
                  ),
                ],
              ),
            )));
  }
}
