import 'package:se_final/services/data-manager.dart';
import 'package:se_final/services/authentication.dart';
import 'package:se_final/screens/dashboard.dart';
import 'package:se_final/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserProfile2 extends StatefulWidget {
  @override
  _UserProfile2State createState() => _UserProfile2State();
}

class _UserProfile2State extends State<UserProfile2> {
  final AuthenticationService _auth = AuthenticationService();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _bdayController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  List userProfilesList = [];
  List<String> _selectSex = <String>['Male', 'Female'];

  String userID = "";

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
    fetchDatabaseList();
  }

  fetchUserInfo() async {
    User getUser = await FirebaseAuth.instance.currentUser;
    userID = getUser.uid;
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsersList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }

  updateData(String name, String bday, String age, String userID) async {
    await DatabaseManager().updateUserList(name, bday, age, userID);
    fetchDatabaseList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Container(
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage('assets/images/profileHeader.png')))),
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: IconButton(
                  alignment: Alignment.topLeft,
                  icon: Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  }),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 90.0, left: 30),
                  child: Text(
                    "User Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 190, left: 115),
              child: SizedBox(
                  height: 120,
                  width: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    overflow: Overflow.visible,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage('assets/images/user.png'),
                      ),
                      Positioned(
                          right: -12,
                          bottom: 0,
                          child: SizedBox(
                              height: 46,
                              width: 46,
                              child: FlatButton(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(color: Colors.white)),
                                color: Color(0xffffffff),
                                onPressed: () {},
                                child: SvgPicture.asset(
                                    "assets/images/camera.svg",
                                    width: 23),
                              ))),
                    ],
                  )),
            ),
            Container(child: StreamBuilder(builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.only(top: 290),
                child: ListView.builder(
                    itemCount: userProfilesList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Column(
                        children: [
                          Text(
                            userProfilesList[index]()['name'],
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 35),
                          Text(
                            userProfilesList[index]()['bday'],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 10),
                          Text(
                            userProfilesList[index]()['email'],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ));
                    }),
              );
            })),
            Padding(
              padding: const EdgeInsets.only(top: 550),
              child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(0xFFadddcf),
                  onPressed: () async {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Edit User Details',
                            ),
                            content: Container(
                              height: 150,
                              child: Column(
                                children: [
                                  TextField(
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        hintText: 'Name',
                                      )),
                                  TextField(
                                    controller: _bdayController,
                                    decoration:
                                        InputDecoration(hintText: 'Birthday'),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  submitAction(context);
                                  Navigator.pop(context);
                                },
                                child: Text('Submit'),
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel'),
                              )
                            ],
                          );
                        });
                  },
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/images/settings.svg", width: 22),
                      SizedBox(width: 20),
                      Expanded(
                          child: Text(
                        "Edit Profile",
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 630),
              child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(0xFFadddcf),
                  onPressed: () async {
                    await _auth.signOut().then((result) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => Login()));
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/images/settings.svg", width: 22),
                      SizedBox(width: 20),
                      Expanded(
                          child: Text(
                        "Sign Out",
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  )),
            ),
          ],
        ));
  }

  submitAction(BuildContext context) {
    updateData(_nameController.text, _bdayController.text, _ageController.text,
        userID);
    _nameController.clear();
    _bdayController.clear();
    _ageController.clear();
    _emailController.clear();
  }
}
