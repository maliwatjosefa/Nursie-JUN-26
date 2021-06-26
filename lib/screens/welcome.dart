import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:se_final/screens/login.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 3000), () {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Welcome()));
    });

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/LOGO.png'), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(1),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LinearPercentIndicator(
              animation: true,
              alignment: MainAxisAlignment.center,
              width: 240.0,
              lineHeight: 4.0,
              percent: 1.0,
              animationDuration: 2250,
              backgroundColor: Color(0xffadddce),
              progressColor: Color(0xffadddce),
            )
          ],
        ),
      ),
    ));
  }
}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 3000), () {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Login()));
    });

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/nursieF.png'), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(1),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LinearPercentIndicator(
              animation: true,
              alignment: MainAxisAlignment.center,
              width: 240.0,
              lineHeight: 4.0,
              percent: 1.0,
              animationDuration: 2250,
              backgroundColor: Color(0xffadddce),
              progressColor: Color(0xffadddce),
            )
          ],
        ),
      ),
    ));
  }
}
