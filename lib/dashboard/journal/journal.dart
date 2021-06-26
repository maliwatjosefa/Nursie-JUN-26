import 'package:se_final/dashboard/journal/apetite.dart';
import 'package:se_final/dashboard/journal/backpain.dart';
import 'package:se_final/dashboard/journal/colds.dart';
import 'package:se_final/dashboard/journal/cough.dart';
import 'package:se_final/dashboard/journal/feverpage.dart';
import 'package:se_final/dashboard/journal/headache.dart';
import 'package:se_final/dashboard/journal/muscle-pain.dart';
import 'package:se_final/dashboard/journal/nausea.dart';
import 'package:se_final/dashboard/journal/red-spots.dart';
import 'package:se_final/dashboard/journal/runny-nose.dart';
import 'package:se_final/dashboard/journal/smell.dart';
import 'package:se_final/dashboard/journal/stomach.dart';
import 'package:se_final/screens/dashboard.dart';
import 'package:flutter/material.dart';

class JournalPage extends StatefulWidget {
  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  void clickFever() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FeverPage()));
  }

  void clickHeadache() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HeadachePage()));
  }

  void clickStomachache() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StomachachePage()));
  }

  void clickCough() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CoughPage()));
  }

  void clickColds() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ColdsPage()));
  }

  void clickSmell() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SmellPage()));
  }

  void clickNausea() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NauseaPage()));
  }

  void clickMusclePain() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MusclePage()));
  }

  void clickRedSpots() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RedSpotsPage()));
  }

  void clickBackPain() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BackPainPage()));
  }

  void clickRunnyNose() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RunnyNosePage()));
  }

  void clickAppetiteLoss() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AppetiteLossPage()));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xffe7ecf0),
        body: Stack(
          children: <Widget>[
            Container(
                height: size.height * .3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage('assets/images/journalHeader.png')))),
            Padding(
              padding: EdgeInsets.only(top: 55),
              child: IconButton(
                  alignment: Alignment.topLeft,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(top: 600),
              child: Container(
                  height: size.height * .3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage('assets/images/lower.png')))),
            ),
            SafeArea(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            height: 90,
                            margin: EdgeInsets.only(bottom: 70),
                            child: Column(children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text.rich(
                                        TextSpan(
                                          text: "Journal",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        style: TextStyle(fontSize: 55)),
                                  ]),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Today, I had...",
                                        style: TextStyle(fontSize: 18)),
                                  ])
                            ])),
                        Expanded(
                          child: GridView.count(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            primary: false,
                            children: <Widget>[
                              ClipRect(
                                  child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/fever.png'))),
                                child: TextButton(
                                  onPressed: this.clickFever,
                                  child: Container(),
                                ),
                              )),
                              ClipRect(
                                  child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/headache.png'))),
                                child: TextButton(
                                  onPressed: this.clickHeadache,
                                  child: Container(),
                                ),
                              )),
                              ClipRect(
                                  child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/stomach.png'))),
                                child: TextButton(
                                  onPressed: this.clickStomachache,
                                  child: Container(),
                                ),
                              )),
                              ClipRect(
                                  child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/cough.png'))),
                                child: TextButton(
                                  onPressed: this.clickCough,
                                  child: Container(),
                                ),
                              )),
                              ClipRect(
                                  child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/colds.png'))),
                                child: TextButton(
                                  onPressed: this.clickColds,
                                  child: Container(),
                                ),
                              )),
                              ClipRect(
                                  child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/loss of smell.png'))),
                                child: TextButton(
                                  onPressed: this.clickSmell,
                                  child: Container(),
                                ),
                              )),
                              ClipRect(
                                  child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Jnausea.png'))),
                                child: TextButton(
                                  onPressed: this.clickNausea,
                                  child: Container(),
                                ),
                              )),
                              ClipRect(
                                  child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Jmuscle pain.png'))),
                                child: TextButton(
                                  onPressed: this.clickMusclePain,
                                  child: Container(),
                                ),
                              )),
                              ClipRect(
                                  child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Jred spots.png'))),
                                child: TextButton(
                                  onPressed: this.clickRedSpots,
                                  child: Container(),
                                ),
                              )),
                              ClipRect(
                                  child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/JbackPain.png'))),
                                child: TextButton(
                                  onPressed: this.clickBackPain,
                                  child: Container(),
                                ),
                              )),
                              ClipRect(
                                  child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Jrunny.png'))),
                                child: TextButton(
                                  onPressed: this.clickRunnyNose,
                                  child: Container(),
                                ),
                              )),
                              ClipRect(
                                  child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/appetite5.png'))),
                                child: TextButton(
                                  onPressed: this.clickAppetiteLoss,
                                  child: Container(),
                                ),
                              )),
                            ],
                            crossAxisCount: 2,
                          ),
                        ),
                      ],
                    )))
          ],
        ));
  }
}
