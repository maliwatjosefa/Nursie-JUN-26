import 'dart:async';
import 'package:se_final/dashboard/maps/maps2.dart';
import 'package:flutter/material.dart';

class Maps1 extends StatefulWidget {
  @override
  _Maps1State createState() => _Maps1State();
}

class _Maps1State extends State<Maps1> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 5000), () {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Maps()));
    });

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: const EdgeInsets.only(top: 0),
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
                            'Getting location for emergency purposes...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 23),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]))));
  }
}
