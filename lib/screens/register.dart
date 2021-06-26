import 'package:se_final/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:se_final/services/authentication.dart';

class Register extends StatefulWidget {
  final Function toggleScreen;

  const Register({Key key, this.toggleScreen}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Users');
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _bdayController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  final AuthenticationService _auth = AuthenticationService();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _bdayController = TextEditingController();
    _ageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/signup_wp.png'),
                  fit: BoxFit.cover),
            ),
            child: Form(
                key: _formkey,
                child: Column(children: [
                  SingleChildScrollView(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 150),
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      50.0, 15.0, 20.0, 15.0),
                                  hintText: "Name",
                                  prefixIcon: Icon(Icons.account_circle),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32))),
                              validator: (name) {
                                if (name.isEmpty) {
                                  return 'Please enter name.';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _bdayController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      50.0, 15.0, 20.0, 15.0),
                                  hintText: "Birthday",
                                  prefixIcon: Icon(Icons.cake),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32))),
                              validator: (bday) {
                                if (bday.isEmpty) {
                                  return 'Please enter birthday.';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _ageController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      50.0, 15.0, 20.0, 15.0),
                                  hintText: "Age",
                                  prefixIcon: Icon(Icons.child_care),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32))),
                              validator: (age) {
                                if (age.isEmpty) {
                                  return 'Please enter age.';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _emailController,
                              validator: (val) => val.isNotEmpty
                                  ? null
                                  : "Please enter an email.",
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      50.0, 15.0, 20.0, 15.0),
                                  hintText: "Email",
                                  prefixIcon: Icon(Icons.mail),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32))),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              validator: (val) => val.length < 6
                                  ? "Please enter more than 6 characters."
                                  : null,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      50.0, 15.0, 20.0, 15.0),
                                  hintText: "Password",
                                  prefixIcon: Icon(Icons.vpn_key),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32))),
                            ),
                            SizedBox(height: 30),
                            MaterialButton(
                              onPressed: () {
                                if (_formkey.currentState.validate()) {
                                  createUser();
                                }
                              },
                              height: 50,
                              minWidth: double.infinity,
                              color: Color(0xffadddce),
                              textColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text("Sign up",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account?"),
                                SizedBox(
                                  width: 5,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) => Login()));
                                  },
                                  //=> widget.toggleScreen(),
                                  child: Text(
                                    "Log in",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.underline),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]))));
  }

  void createUser() async {
    dynamic result = await _auth.createNewUser(
        _nameController.text,
        _bdayController.text,
        _ageController.text,
        _emailController.text,
        _passwordController.text);
    if (result == null) {
      print('Email is not valid');
    } else {
      print(result.toString());
      _nameController.clear();
      _bdayController.clear();
      _ageController.clear();
      _emailController.clear();
      _passwordController.clear();

      Navigator.pop(context);
    }
  }
}
