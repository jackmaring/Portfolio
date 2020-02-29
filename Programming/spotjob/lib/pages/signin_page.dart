import 'package:flutter/material.dart';

import 'package:spotjob/pages/tabs_page.dart';
import 'homepage.dart';
import 'login_page.dart';
import '../widgets/welcome_widgets/flat_welcome_button.dart';
import '../widgets/welcome_widgets/long_welcome_button.dart';
import '../widgets/welcome_widgets/terms_and_conditions.dart';
import '../widgets/welcome_widgets/sign_in_text_fields.dart';

class SignInPage extends StatelessWidget {
  static const routeName = '/sign-in';

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
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'Hevetica',
                      fontSize: 42,
                      color: Colors.white,
                    ),
                  ),
                ),
                SignInTextFields(),
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
                    Navigator.of(context).pushNamed(TabsPage.routeName);
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
