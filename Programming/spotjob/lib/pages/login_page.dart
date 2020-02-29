import 'package:flutter/material.dart';

import 'package:spotjob/pages/tabs_page.dart';
import 'homepage.dart';
import '../widgets/welcome_widgets/login_text_fields.dart';
import '../widgets/welcome_widgets/long_welcome_button.dart';
import '../widgets/welcome_widgets/flat_welcome_button.dart';

class LoginInPage extends StatelessWidget {
  static const routeName = '/log-in';

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
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'Hevetica',
                      fontSize: 42,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: LogInTextFields(),
                ),
                LongWelcomeButton(
                  Icon(
                    Icons.assignment,
                    color: Theme.of(context).primaryColor,
                  ),
                  ' LOG IN',
                  () {
                    Navigator.of(context).pushNamed(TabsPage.routeName);
                  },
                ),
                FlatWelcomeButton(
                  'Forget your password?',
                  () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
