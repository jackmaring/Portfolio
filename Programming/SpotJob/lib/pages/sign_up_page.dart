import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spotjob/pages/tabs_page.dart';
import 'package:spotjob/providers/crud_models/user_crud_model.dart';
import 'package:spotjob/providers/user.dart';
import 'package:spotjob/services/auth_service.dart';
import 'login_page.dart';
import '../widgets/welcome_widgets/flat_welcome_button.dart';
import '../widgets/welcome_widgets/long_welcome_button.dart';
import '../widgets/welcome_widgets/terms_and_conditions.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/sign-in';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String username;
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
    final userCrud = Provider.of<UserCRUD>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff0277BD),
              Color(0xff26C6DA),
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
                  'Sign In',
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
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            onChanged: (value) {
                              username = value;
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
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              onChanged: (value) {
                                email = value;
                              },
                              // The validator receives the text that the user has entered.
                              validator: (value) => value.isEmpty
                                  ? 'Email is required'
                                  : validateEmail(value.trim()),
                            ),
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
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: TermsAndConditions(),
                ),
                LongWelcomeButton(
                  Icon(
                    Icons.edit,
                    color: Color(0xff0277BD),
                  ),
                  ' SIGN IN',
                  () {
                    if (_formKey.currentState.validate()) {
                      AuthService().signUp(email, password).then((result) {
                        userCrud.addUser(
                          User(
                            uid: result,
                            email: email,
                            username: username,
                          ),
                        );
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
                FlatWelcomeButton(
                  'Already have an account? Click here to log in.',
                  () {
                    Navigator.of(context).pushNamed(LoginInPage.routeName);
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
