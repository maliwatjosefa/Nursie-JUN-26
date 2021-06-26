import 'package:se_final/dashboard/maps/maps1.dart';
import 'package:se_final/screens/forgotpw.dart';
import 'package:se_final/screens/register.dart';
import 'package:se_final/screens/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:se_final/services/authentication.dart';

class Login extends StatefulWidget {
  final Function toggleScreen;

  const Login({Key key, this.toggleScreen}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final AuthenticationService _auth = AuthenticationService();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
                  image: AssetImage('assets/images/sign_wp.png'),
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
                            SizedBox(height: 210),
                            TextFormField(
                              controller: _emailController,
                              validator: (val) => val.isNotEmpty
                                  ? null
                                  : "Please enter an email",
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      50.0, 15.0, 20.0, 15.0),
                                  hintText: "Email",
                                  prefixIcon: Icon(Icons.mail),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32))),
                            ),
                            SizedBox(height: 20),
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
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPassword()));
                                  },
                                  child: Container(
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            MaterialButton(
                              onPressed: () {
                                if (_formkey.currentState.validate()) {
                                  signInUser();
                                }
                              },
                              height: 50,
                              minWidth: double.infinity,
                              color: Color(0xffadddce),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text("Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: Text(
                                'Or',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(height: 10),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: <Widget>[
                                        SignInButton(
                                          Buttons.Facebook,
                                          onPressed: () {
                                            AuthenticationService()
                                                .signInWithFacebook()
                                                .then((UserCredential value) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          Dashboard()));
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: <Widget>[
                                        SignInButton(Buttons.GoogleDark,
                                            onPressed: () {
                                          AuthenticationService()
                                              .signWithGoogle()
                                              .then((UserCredential value) {
                                            final displayName =
                                                value.user.displayName;

                                            print(displayName);

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        Dashboard()));
                                          });
                                        }),
                                      ],
                                    ),
                                  )
                                ]),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) => Register()));
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]))));
  }

  void signInUser() async {
    dynamic authResult =
        await _auth.loginUser(_emailController.text, _passwordController.text);
    if (authResult == null) {
      print('Sign in error. could not be able to login');
    } else {
      _emailController.clear();
      _passwordController.clear();
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Maps1()));
    }
  }
}
