import 'package:se_final/dashboard/homeremedy/remedies.dart';
import 'package:flutter/material.dart';

class Runny extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
            height: size.height * 0.34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(27),
                  bottomRight: Radius.circular(27)),
              color: Color(0xffadddce),
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/smell-pic.png',
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
                Text("Runny Nose",
                    style:
                        TextStyle(fontSize: 47, fontWeight: FontWeight.w900)),
                SizedBox(height: 10),
                SizedBox(
                  width: size.width * 0.7,
                  child: Text(
                    "A runny nose is mucus being discharged out of the nose. It can be caused by colder outdoor temperatures, or by the cold, flu, or allergies.",
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
                              image: AssetImage('assets/images/runny2.png'),
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
                  "It can be helpful to stop runny nose by:",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - drinking fluids and staying hydrated that can be helpful if you also have symptoms of nasal congestion",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - inhaling hot clean steam",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - drinking hot beverages like tea may sometimes be more helpful than cold ones. It can open and decongest airways",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - getting enough sleep that can keep your immune system in good shape",
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
                          image: AssetImage('assets/images/runny3.png'),
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
                  "Here are some tips that can help prevent runny nose:",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - Wash your hands often, especially before eating, after using the toilet, and after being around large numbers of people.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - Throw away used tissues after blowing or wiping your nose.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - Eat healthily and exercise regularly to help boost your immune system.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - Cough and sneeze into the inside of your elbow, not into your hand.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  " - Clean and disinfect common surfaces such as tables and countertops, toys, door handles and bathroom fixtures.",
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
