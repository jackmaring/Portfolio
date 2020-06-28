import 'package:flutter/material.dart';

import 'package:spotjob/pages/sign_up_page.dart';
import 'package:spotjob/pages/tabs_page.dart';
import 'package:spotjob/services/auth_service.dart';
import '../widgets/welcome_widgets/login_text_fields.dart';
import '../widgets/welcome_widgets/long_welcome_button.dart';
import '../widgets/welcome_widgets/flat_welcome_button.dart';

class LoginInPage extends StatefulWidget {
  static const routeName = '/log-in';

  @override
  _LoginInPageState createState() => _LoginInPageState();
}

class _LoginInPageState extends State<LoginInPage> {
  String email;
  String password;
  String _error;

  final _formKey = GlobalKey<FormState>();

  checkFields() {
    final form = _formKey.currentState;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String validateEmail(String value) {
    Pattern pattern = r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Homepage Test'),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Log In',
                  style: TextStyle(
                    fontFamily: 'Hevetica',
                    fontSize: 42,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 32, left: 8, right: 8),
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 45,
                          // width: 260,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 15),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            onChanged: (value) {
                              email = value;
                            },
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your email.';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            height: 45,
                            // width: 260,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 15),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              onChanged: (value) {
                                password = value;
                              },
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your email.';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: LongWelcomeButton(
                    Icon(
                      Icons.assignment,
                      color: Theme.of(context).primaryColor,
                    ),
                    ' LOG IN',
                    () {
                      if (_formKey.currentState.validate()) {
                        AuthService().signIn(email, password).then((result) {
                          Navigator.of(context).pushNamed(TabsPage.routeName);
                        }).catchError((e) {
                          // _error = e.message.toString();
                          setState(() {
                            _error =
                                "Error during login, please check your credentials.";
                          });
                          throw e;
                        });
                      }
                    },
                  ),
                ),
                FlatWelcomeButton(
                  'Forget your password?',
                  () {},
                ),
                FlatWelcomeButton(
                  'Don\'t have an account? Click here to sign up!',
                  () {
                    Navigator.of(context).pushNamed(SignUpPage.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
