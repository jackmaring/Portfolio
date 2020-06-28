import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sustainibility_project/C02_flight_calculator_plugin/airport.dart';
import 'package:sustainibility_project/providers/admin.dart';
import 'package:sustainibility_project/providers/calculations.dart';
import 'package:sustainibility_project/providers/profile.dart';
import 'package:sustainibility_project/services/auth_service.dart';
import 'package:sustainibility_project/styles/custom_colors.dart';
import 'package:sustainibility_project/views/admin_view.dart';
import 'package:sustainibility_project/views/login_view.dart';
import 'package:sustainibility_project/views/profile_view.dart';
import 'package:sustainibility_project/views/signup_view.dart';
import 'package:sustainibility_project/widgets/rounded_button.dart';
import 'package:sustainibility_project/widgets/navbar/navbar_item.dart';

class Navbar extends StatefulWidget {
  final List<Airport> airports;
  final String uid;

  Navbar(this.airports, this.uid);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List<ProfileDataTableEntry> profileEntries;
  List<AdminDataTableEntry> adminEntries;

  Widget _buildAdminNavbarItem(BuildContext context, String uid) {
    final admin = Provider.of<Admin>(context);
    if (uid == 'AjIPI4Komqg3U0kRcm0dMfqTzjt2') {
      return NavbarItem(
        'Admin',
        () {
          // admin.calculateAdminTotals(
          //     adminEntries, profileEntries, admin.adminOnly);
          Navigator.of(context).pushNamed(AdminView.routeName);
        },
      );
    } else {
      return Container();
    }
  }

  Widget _buildProfileNavbarItem(BuildContext context, String uid) {
    final profile = Provider.of<Profile>(context);
    final calculations = Provider.of<Calculations>(context);
    return NavbarItem(
      'Profile',
      () {
        calculations.resetStats();
        // profile.calculateProfileTotals(
        //   profileEntries,
        //   profile.concoOnly,
        //   uid,
        // );
        Navigator.of(context).pushNamed(ProfileView.routeName);
      },
    );
  }

  // void initialize() {
  //   final profileCrud = Provider.of<ProfileCRUDModel>(context, listen: false);
  //   final adminCrud = Provider.of<AdminCRUDModel>(context, listen: false);
  //   profileCrud.fetchProfileDataEntries().then((value) {
  //     profileEntries = value;
  //   });
  //   adminCrud.fetchAdminDataEntries().then((value) {
  //     adminEntries = value;
  //   });
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   initialize();
  // }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return Container(
      height: 120,
      // width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildAdminNavbarItem(context, widget.uid),
          _buildProfileNavbarItem(context, widget.uid),
          NavbarItem(
            'Login',
            () => Navigator.of(context).pushNamed(LoginView.routeName),
          ),
          NavbarItem(
            'Logout',
            () {
              AuthService().signOut();
              print(user);
              Navigator.of(context).pushNamed(LoginView.routeName);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: RoundedButton(
              height: 60,
              width: 170,
              text: Text(
                'Sign Up',
                style: Theme.of(context).textTheme.button.merge(
                      TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
              ),
              color: CustomColors.brown,
              function: () {
                Navigator.of(context).pushNamed(SignUpView.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
