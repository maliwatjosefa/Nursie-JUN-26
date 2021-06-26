import 'dart:async';

import 'package:se_final/screens/dashboard.dart';
import 'package:flutter/material.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 3000), () {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Dashboard()));
    });
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/maps.png'),
                      fit: BoxFit.cover),
                ),
                child: Center(
                    child: Column(children: [
                  SingleChildScrollView(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 86),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'User located!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ])))));
  }
}
