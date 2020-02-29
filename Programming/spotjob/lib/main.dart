import 'package:flutter/material.dart';

import 'package:spotjob/pages/filter_page.dart';
import 'package:spotjob/pages/job_info_page.dart';
import 'package:spotjob/pages/login_page.dart';
import 'package:spotjob/pages/message_page.dart';
import 'package:spotjob/pages/profile_page.dart';
import 'package:spotjob/pages/signin_page.dart';
import 'package:spotjob/pages/tabs_page.dart';
import './pages/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff0277BD),
        accentColor: Color(0xff26C6DA),
        fontFamily: 'Helvetica',
        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 18,
          ),
          subtitle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
          ),
          body1: TextStyle(
            fontSize: 16,
          ),
          display1: TextStyle(
            fontSize: 28,
            color: Colors.black,
          ),
          button: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 15,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      // home: WelcomePage(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => WelcomePage(),
        LoginInPage.routeName: (ctx) => LoginInPage(),
        SignInPage.routeName: (ctx) => SignInPage(),
        TabsPage.routeName: (ctx) => TabsPage(),
        FilterPage.routeName: (ctx) => FilterPage(),
        JobInfoPage.routeName: (ctx) => JobInfoPage(),
        MessagePage.routeName: (ctx) => MessagePage(),
        ProfilePage.routeName: (ctx) => ProfilePage(),
      },
    );
  }
}
