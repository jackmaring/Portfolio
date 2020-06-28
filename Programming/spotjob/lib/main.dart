import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spotjob/pages/filter_page.dart';
import 'package:spotjob/pages/job_info_page.dart';
import 'package:spotjob/pages/login_page.dart';
import 'package:spotjob/pages/message_page.dart';
import 'package:spotjob/pages/profile_page.dart';
import 'package:spotjob/pages/sign_up_page.dart';
import 'package:spotjob/pages/splash_page.dart';
import 'package:spotjob/pages/tabs_page.dart';
import 'package:spotjob/providers/crud_models/job_crud_model.dart';
import 'package:spotjob/providers/crud_models/user_crud_model.dart';
import 'package:spotjob/providers/job.dart';
import 'package:spotjob/providers/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(
          value: FirebaseAuth.instance.onAuthStateChanged,
        ),
        StreamProvider(
          create: (_) => JobCRUD().fetchJobsAsStream(),
        ),
        StreamProvider(
          create: (_) => UserCRUD().fetchUsersAsStream(),
        ),
        ChangeNotifierProvider(
          create: (_) => CreateJob(),
        ),
        ChangeNotifierProvider(
          create: (_) => JobCRUD(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserCRUD(),
        ),
      ],
      child: MaterialApp(
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
        home: SplashPage(), // default is '/'
        routes: {
          SplashPage.routeName: (ctx) => SplashPage(),
          LoginInPage.routeName: (ctx) => LoginInPage(),
          SignUpPage.routeName: (ctx) => SignUpPage(),
          TabsPage.routeName: (ctx) => TabsPage(),
          FilterPage.routeName: (ctx) => FilterPage(),
          // JobInfoPage.routeName: (ctx) => JobInfoPage(),
          MessagePage.routeName: (ctx) => MessagePage(),
          ProfilePage.routeName: (ctx) => ProfilePage(),
        },
      ),
    );
  }
}
