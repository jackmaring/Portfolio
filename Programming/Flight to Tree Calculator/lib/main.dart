import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sustainibility_project/C02_flight_calculator_plugin/airport.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/airport_data_reader.dart';
import 'package:sustainibility_project/locator.dart';
import 'package:sustainibility_project/providers/admin.dart';
import 'package:sustainibility_project/providers/calculations.dart';
import 'package:sustainibility_project/providers/crud_models/admin_crud_model.dart';
import 'package:sustainibility_project/providers/crud_models/profile_crud_model.dart';
import 'package:sustainibility_project/providers/profile.dart';
import 'package:sustainibility_project/root.dart';
import 'package:sustainibility_project/styles/custom_colors.dart';
import 'package:sustainibility_project/views/admin_view.dart';
import 'package:sustainibility_project/views/home_view.dart';
import 'package:sustainibility_project/views/login_view.dart';
import 'package:sustainibility_project/views/profile_view.dart';
import 'package:sustainibility_project/views/signup_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Airport> airports;

  initialize() async {
    airports = await AirportDataReader.load('assets/airports.txt');
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(
          value: FirebaseAuth.instance.onAuthStateChanged,
        ),
        ChangeNotifierProvider(
          create: (_) => Calculations(),
        ),
        ChangeNotifierProvider(
          create: (_) => Profile(),
        ),
        ChangeNotifierProvider(
          create: (_) => Admin(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileCRUDModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => AdminCRUDModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Sustainibility Project',
        theme: ThemeData(
          primaryColor: CustomColors.green,
          accentColor: CustomColors.lightGreen,
          fontFamily: 'Rubik',
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 72,
              color: CustomColors.darkGray,
              fontWeight: FontWeight.w500,
            ),
            headline2: TextStyle(
              fontSize: 48,
              color: CustomColors.darkGray,
              fontWeight: FontWeight.w500,
            ),
            headline3: TextStyle(
              fontSize: 36,
              color: CustomColors.darkGray,
              fontWeight: FontWeight.w500,
            ),
            headline4: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            headline5: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            bodyText1: TextStyle(
              fontSize: 18,
              color: CustomColors.darkGray,
              fontWeight: FontWeight.w500,
            ),
            bodyText2: TextStyle(
              fontSize: 16,
              color: CustomColors.darkGray,
              fontWeight: FontWeight.w300,
            ),
            button: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        home: RootPage(airports),
        routes: {
          HomeView.routeName: (ctx) => HomeView(airports),
          AdminView.routeName: (ctx) => AdminView(airports),
          ProfileView.routeName: (ctx) => ProfileView(airports),
          LoginView.routeName: (ctx) => LoginView(),
          SignUpView.routeName: (ctx) => SignUpView(),
        },
      ),
    );
  }
}
