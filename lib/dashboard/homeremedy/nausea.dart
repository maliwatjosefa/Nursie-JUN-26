import 'package:se_final/dashboard/homeremedy/remedies.dart';
import 'package:flutter/material.dart';

class NauseaRemedy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
            height: size.height * 0.32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(27),
                  bottomRight: Radius.circular(27)),
              color: Color(0xffadddce),
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/nausea-pic.png',
                  ),
                  fit: BoxFit.none,
                  alignment: Alignment.centerRight),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: IconButton(
                alignment: Alignment.topLeft,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RemediesPage()));
                }),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: size.height * 0.03),
                Text("Nausea",
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.w900)),
                SizedBox(height: 10),
                SizedBox(
                  width: size.width * 0.7,
                  child: Text(
                    "Nausea is stomach discomfort and the sensation of wanting to vomit. Nausea can be a precursor to vomiting the contents of the stomach.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.05,
                  height: size.height * 0.02,
                ),
                Wrap(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xffadddce),
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 17),
                              blurRadius: 23,
                              spreadRadius: -20)
                        ],
                        image: DecorationImage(
                            image: AssetImage('assets/images/firstaid.png'),
                            fit: BoxFit.none,
                            alignment: Alignment.centerLeft),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/nausea3.png'),
                              fit: BoxFit.none,
                              alignment: Alignment.centerRight),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: size.width * 0.05,
                  height: size.height * 0.01,
                ),
                Text(
                  "Many nausea remedies don’t necessarily cure the condition, but they may help you feel more comfortable. This things will provide fast relief: ",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - taking slow, deep breaths can also help reduce nausea.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - opening a window or sitting in front of a fan. Fresh air eases nausea symptoms in many people. It may get rid of sickening odors, or simply help you focus on something other than the nausea.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - drinking enough water to be hydrated because too much of it may worsen nausea",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - avoiding carbonated drinks that may cause bloating and worsen acid reflux",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(width: size.width * 0.08),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color(0xffadddce),
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 17),
                          blurRadius: 23,
                          spreadRadius: -20)
                    ],
                    image: DecorationImage(
                        image: AssetImage('assets/images/fever_prevent.png'),
                        fit: BoxFit.none,
                        alignment: Alignment.centerLeft),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/nausea2.png'),
                          fit: BoxFit.none,
                          alignment: Alignment.centerRight),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.05,
                  height: size.height * 0.01,
                ),
                Text(
                  "Here are some tips that can help prevent nausea:",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - Avoid foods that are hard to digest.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - Do not lay down after eating. Rest with your head higher than your feet.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - Avoid excessive drinking of liquids during meals.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - Wait to eat until you're feeling less nauseated.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )),
        ]),
      ),
    );
  }
}
