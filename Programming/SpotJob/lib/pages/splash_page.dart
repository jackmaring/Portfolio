import 'package:flutter/material.dart';

import 'package:spotjob/pages/sign_up_page.dart';
import '../widgets/welcome_widgets/welcome_button.dart';
import 'login_page.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/splash';

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.my_location,
                size: 72,
                color: Colors.white,
              ),
              Text(
                'SpotJob',
                style: TextStyle(
                  fontFamily: 'Hevetica',
                  fontSize: 72,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    WelcomeButton(
                      Icon(
                        Icons.edit,
                        color: Theme.of(context).primaryColor,
                      ),
                      ' SIGN UP',
                      () {
                        Navigator.of(context).pushNamed(SignUpPage.routeName);
                      },
                    ),
                    WelcomeButton(
                      Icon(
                        Icons.assignment,
                        color: Theme.of(context).primaryColor,
                      ),
                      ' LOG IN',
                      () {
                        Navigator.of(context).pushNamed(LoginInPage.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
