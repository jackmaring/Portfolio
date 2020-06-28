import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sustainibility_project/C02_flight_calculator_plugin/airport.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/airport_lookup.dart';
import 'package:sustainibility_project/providers/calculations.dart';
import 'package:sustainibility_project/providers/crud_models/profile_crud_model.dart';
import 'package:sustainibility_project/providers/profile.dart';
import 'package:sustainibility_project/styles/custom_colors.dart';
import 'package:sustainibility_project/widgets/lookup_button.dart';
import 'package:sustainibility_project/widgets/profile_widgets/flight_class_dropdown_button.dart';
import 'package:sustainibility_project/widgets/profile_widgets/is_conco_checkbox.dart';
import 'package:sustainibility_project/widgets/profile_widgets/profile_datatable.dart';
import 'package:sustainibility_project/widgets/profile_widgets/profile_totals_bar.dart';
import 'package:sustainibility_project/widgets/rounded_button.dart';
import 'package:sustainibility_project/widgets/navbar/account_navbar.dart';

class ProfileView extends StatelessWidget {
  static const routeName = '/profile';

  final List<Airport> airports;

  ProfileView(this.airports);

  @override
  Widget build(BuildContext context) {
    final crud = Provider.of<ProfileCRUDModel>(context);
    final calculations = Provider.of<Calculations>(context);
    final profile = Provider.of<Profile>(context);
    final user = Provider.of<FirebaseUser>(context);
    List<ProfileDataTableEntry> profileEntries;
    AirportLookup airportLookup = AirportLookup(airports: airports);
    return StreamBuilder(
      stream: crud.fetchProfileDataEntriesAsStream(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Container(
              height: 200,
              width: 200,
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          profileEntries = snapshot.data.documents
              .map((doc) => ProfileDataTableEntry.fromMap(doc.data))
              .toList();
        }
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ProfileTotalsBar(profileEntries, user.uid),
                SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 390,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AccountNavbar(),
                        Padding(
                          padding: EdgeInsets.only(top: 30, left: 120),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                calculations.treeNum == 1
                                    ? '${calculations.treeNum} Tree Needed!'
                                    : '${calculations.treeNum} Trees Needed!',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              SizedBox(height: 50),
                              Row(
                                children: <Widget>[
                                  LookupButton(
                                    height: 50,
                                    width: 150,
                                    text: Text(
                                      'From',
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                    aiportNameStyle:
                                        Theme.of(context).textTheme.button,
                                    airportLookup: airportLookup,
                                    direction: Direction.departure,
                                  ),
                                  SizedBox(width: 40),
                                  LookupButton(
                                    height: 50,
                                    width: 150,
                                    text: Text(
                                      'To',
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                    aiportNameStyle:
                                        Theme.of(context).textTheme.button,
                                    airportLookup: airportLookup,
                                    direction: Direction.arrival,
                                  ),
                                  SizedBox(width: 40),
                                  IsConcoCheckBox(),
                                  Text(
                                    'Concordia associated flight?',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: CustomColors.darkGray,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Row(
                                children: <Widget>[
                                  FlightClassDropDownButton(),
                                  SizedBox(width: 40),
                                  RoundedButton(
                                    height: 50,
                                    width: 150,
                                    text: Text(
                                      'Save',
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                    color: CustomColors.brown,
                                    function: () {
                                      crud.addProfileDataEntry(
                                        ProfileDataTableEntry(
                                            uid: user.uid,
                                            departure: calculations.departure,
                                            arrival: calculations.arrival,
                                            flightClass:
                                                calculations.flightClass,
                                            isConco: profile.isConco),
                                      );
                                      profile.calculateProfileTotals(
                                        profileEntries,
                                        profile.concoOnly,
                                        user.uid,
                                      );
                                      calculations.resetStats();
                                    },
                                  ),
                                  SizedBox(width: 40),
                                  RoundedButton(
                                    height: 50,
                                    width: 150,
                                    text: Text(
                                      'Calculate',
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                    color: CustomColors.red,
                                    function: calculations.updateTreeNumber,
                                  ),
                                ],
                              ),
                              SizedBox(height: 80),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Flights Saved',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.edit, color: CustomColors.darkGray, size: 30,),
                                    onPressed: profile.updateDeleteIsVisible,
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              ProfileDataTable(profileEntries, user.uid),
                            ],
                          ),
                        ),
                        SizedBox(height: 150),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
