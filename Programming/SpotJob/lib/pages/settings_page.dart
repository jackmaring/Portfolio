import 'package:flutter/material.dart';
import 'package:spotjob/pages/splash_page.dart';
import 'package:spotjob/services/auth_service.dart';

import '../widgets/homepage_widgets/bottombar_appbar.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Logout'),
        onPressed: () {
          AuthService().signOut();
          Navigator.of(context).pushNamed(SplashPage.routeName);
        },
      ),
    );
  }
}
