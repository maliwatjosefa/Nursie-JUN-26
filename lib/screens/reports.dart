import 'package:se_final/dashboard/journal/database.dart';
import 'package:se_final/dashboard/journal/journal.dart';
import 'package:se_final/dashboard/journal/post.dart';
import 'package:flutter/material.dart';
import 'package:se_final/screens/dashboard.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  List<Post> posts = [];
  String dataToChange;

  void getPosts() {
    getAllPosts().then((posts) => {
          this.setState(() {
            this.posts = posts;
          })
        });
  }

  void changeData() {
    setState(() {
      dataToChange = "Allergy";
    });
  }

  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color(0xffe7ecf0),
        body: SingleChildScrollView(
            child: Stack(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(top: 120),
              child: Container(
                  height: size.height * .3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage('assets/images/upperPart.png')))),
            ),
            new Container(
                height: size.height * .3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage('assets/images/reportsHeader.png')))),
            new Padding(
              padding: EdgeInsets.only(top: 55),
              child: IconButton(
                  alignment: Alignment.topLeft,
                  icon: Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  }),
            ),
            SafeArea(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(bottom: 70),
                            child: Column(
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text.rich(
                                          TextSpan(
                                            text: "Reports",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          style: TextStyle(fontSize: 50)),
                                    ]),
                              ],
                            )),
                        Card(
                          color: Color(0xffadddcf),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Text(
                                    "Your record for the last 7 days",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        DataTable(
                          headingRowColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.08);
                            return Color(0xff6eaf99);
                          }),
                          columns: <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Category',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Input',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Date/Time',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          rows: <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('HEADACHE')),
                                DataCell(Text('Temples')),
                                DataCell(Text('Jun25/22:49:28')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('STOMACHACHE')),
                                DataCell(Text('Nausea')),
                                DataCell(Text('Jun25/22:49:55')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('RED SPOTS')),
                                DataCell(Text('RED SPOTS')),
                                DataCell(Text('Jun25/22:50:01')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('RUNNY NOSE')),
                                DataCell(Text('RUNNY NOSE')),
                                DataCell(Text('Jun25/22:50:08')),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Card(
                          color: Color(0xffadddcf),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  changeData();
                                },
                                child: ClipRect(
                                    child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/medical-record.png'))),
                                )),
                              ),
                              SizedBox(height: 70),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Text(
                                    "Nursie predicts that you have...",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Center(
                            child: Text(
                              "$dataToChange",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Card(
                          color: Color(0xffadddcf),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipRect(
                                  child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/exclamation-mark.png'))),
                              )),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Text(
                                    "A reminder from Nursie",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Center(
                            child: Text(
                              "Make sure to consult your doctor for proper diagnosis. Nursie is just a machine learning program trained to predict illnesses based on your input symptoms and NOT a medical professional.",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    )))
          ],
        )));
  }
}
