import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sustainibility_project/C02_flight_calculator_plugin/airport.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/airport_lookup.dart';
import 'package:sustainibility_project/providers/calculations.dart';
import 'package:sustainibility_project/providers/crud_models/profile_crud_model.dart';
import 'package:sustainibility_project/providers/profile.dart';
import 'package:sustainibility_project/styles/custom_colors.dart';
import 'package:sustainibility_project/views/profile_view.dart';
import 'package:sustainibility_project/widgets/home_widgets/homepage_category_row.dart';
import 'package:sustainibility_project/widgets/home_widgets/homepage_category_rows/class_row.dart';
import 'package:sustainibility_project/widgets/home_widgets/homepage_category_rows/flight_type_row.dart';
import 'package:sustainibility_project/widgets/home_widgets/homepage_category_rows/time_row.dart';
import 'package:sustainibility_project/widgets/lookup_button.dart';
import 'package:sustainibility_project/widgets/navbar/navbar.dart';
import 'package:sustainibility_project/widgets/rounded_button.dart';

class HomeView extends StatelessWidget {
  static const routeName = '/home';

  final List<Airport> airports;

  HomeView(this.airports);

  @override
  Widget build(BuildContext context) {
    final crud = Provider.of<ProfileCRUDModel>(context);
    final calculations = Provider.of<Calculations>(context);
    final user = Provider.of<FirebaseUser>(context);
    AirportLookup airportLookup = AirportLookup(airports: airports);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 120),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Navbar(airports, user.uid),
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    height: 630,
                    width: MediaQuery.of(context).size.width - 120,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 65, left: 140),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style:
                                  Theme.of(context).textTheme.headline1.merge(
                                        TextStyle(
                                          color: Colors.white,
                                          height: 1,
                                        ),
                                      ),
                              children: <TextSpan>[
                                TextSpan(text: 'Flight to '),
                                TextSpan(
                                  text: 'Tree\n',
                                  style: TextStyle(
                                    color: CustomColors.lightGreen,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(text: 'Calculator'),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 410,
                            child: Text(
                              'Calculate the amount of trees needed to offset your flight’s carbon emissions!',
                              style:
                                  Theme.of(context).textTheme.bodyText2.merge(
                                        TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                            ),
                          ),
                          SizedBox(height: 125),
                          SizedBox(
                            width: 460,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                LookupButton(
                                  height: 65,
                                  width: 200,
                                  text: Text(
                                    'From',
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                  aiportNameStyle:
                                      Theme.of(context).textTheme.button,
                                  airportLookup: airportLookup,
                                  direction: Direction.departure,
                                ),
                                LookupButton(
                                  height: 65,
                                  width: 200,
                                  text: Text(
                                    'To',
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                  aiportNameStyle:
                                      Theme.of(context).textTheme.button,
                                  airportLookup: airportLookup,
                                  direction: Direction.arrival,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          RoundedButton(
                            height: 65,
                            width: 200,
                            text: Text(
                              'Calculate',
                              style: Theme.of(context).textTheme.button,
                            ),
                            color: CustomColors.red,
                            function: calculations.updateTreeNumber,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 350,
                    left: 660,
                    child: Image.asset(
                      'assets/images/tree1.png',
                      height: 375,
                      width: 535,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 120),
              Container(
                padding: EdgeInsets.only(left: 60),
                width: 1005,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline1.merge(
                              TextStyle(
                                color: CustomColors.darkGray,
                              ),
                            ),
                        children: <TextSpan>[
                          TextSpan(text: '${calculations.treeNum} '),
                          TextSpan(
                            text:
                                calculations.treeNum == 1 ? 'Tree ' : 'Trees ',
                            // text: 'Trees ',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: CustomColors.lightGreen,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(text: 'Needed!'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/tree2.png',
                            height: 460,
                            width: 410,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              FlightTypeRow(),
                              SizedBox(height: 50),
                              ClassRow(),
                              SizedBox(height: 50),
                              TimeRow(),
                              SizedBox(height: 50),
                              HomePageCategoryRow(
                                text: '',
                                buttonText: 'Save',
                                function: () {
                                  if (calculations.checkAirplanes()) {
                                    crud.addProfileDataEntry(
                                      ProfileDataTableEntry(
                                        uid: user.uid,
                                        departure: calculations.departure,
                                        arrival: calculations.arrival,
                                        flightClass: calculations.flightClass,
                                        isConco: false,
                                      ),
                                    );
                                    calculations.resetStats();
                                    Navigator.of(context)
                                        .pushNamed(ProfileView.routeName);
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 150)
            ],
          ),
        ),
      ),
    );
  }
}
