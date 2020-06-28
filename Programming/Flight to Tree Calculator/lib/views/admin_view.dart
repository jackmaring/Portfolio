import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sustainibility_project/C02_flight_calculator_plugin/airport.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/airport_lookup.dart';
import 'package:sustainibility_project/providers/admin.dart';
import 'package:sustainibility_project/providers/crud_models/admin_crud_model.dart';
import 'package:sustainibility_project/providers/crud_models/profile_crud_model.dart';
import 'package:sustainibility_project/providers/profile.dart';
import 'package:sustainibility_project/styles/custom_colors.dart';
import 'package:sustainibility_project/widgets/admin_widgets/admin_add_entry_form.dart';
import 'package:sustainibility_project/widgets/admin_widgets/admin_datatable.dart';
import 'package:sustainibility_project/widgets/admin_widgets/admin_student_datatable.dart';
import 'package:sustainibility_project/widgets/admin_widgets/admin_totals_bar.dart';
import 'package:sustainibility_project/widgets/navbar/account_navbar.dart';

class AdminView extends StatelessWidget {
  static const routeName = '/admin';

  final List<Airport> airports;

  AdminView(this.airports);

  @override
  Widget build(BuildContext context) {
    AirportLookup airportLookup = AirportLookup(airports: airports);
    final adminCrud = Provider.of<AdminCRUDModel>(context);
    final profileCrud = Provider.of<ProfileCRUDModel>(context);
    final admin = Provider.of<Admin>(context);
    List<AdminDataTableEntry> adminEntries;
    List<ProfileDataTableEntry> profileEntries;
    return StreamBuilder(
      stream: adminCrud.fetchAdminDataEntriesAsStream(),
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
          adminEntries = snapshot.data.documents
              .map((doc) => AdminDataTableEntry.fromMap(doc.data))
              .toList();
        }
        return StreamBuilder(
          stream: profileCrud.fetchProfileDataEntriesAsStream(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
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
                    AdminTotalsBar(adminEntries, profileEntries),
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
                                  AdminAddEntryForm(
                                    airportLookup,
                                    adminEntries,
                                    profileEntries,
                                  ),
                                  SizedBox(height: 80),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'CONCORDIA Table',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                          color: CustomColors.darkGray,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          admin.updateConcoDeleteIsVisible();
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  AdminDataTable(adminEntries),
                                  SizedBox(height: 80),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'STUDENT Table',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                          color: CustomColors.darkGray,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          admin.updateStudentDeleteIsVisible();
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  admin.studentTableIsVisible
                                      ? AdminStudentDataTable(profileEntries)
                                      : Container(),
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
      },
    );
  }
}
