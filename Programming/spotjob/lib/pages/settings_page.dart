import 'package:flutter/material.dart';

import '../widgets/homepage_widgets/bottombar_appbar.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget _showMenu() {
    return Container(
      height: 50,
      width: 50,
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Test'),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Show Menu'),
        onPressed: _showMenu,
      ),
    );
  }
}
