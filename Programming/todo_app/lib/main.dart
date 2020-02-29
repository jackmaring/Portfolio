import 'package:flutter/material.dart';
import 'package:todo_app/screens/calendar_screen.dart';
import 'package:todo_app/screens/tabs_screen.dart';

import './screens/todo_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.yellowAccent,
        fontFamily: 'Open Sans',
        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 24,
            // fontWeight: FontWeight.bold,
          ),
          body1: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CalendarScreen.routeName: (ctx) => CalendarScreen(),
      }
    );
  }
}
