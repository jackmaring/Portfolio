import 'package:flutter/material.dart';

import 'package:spotjob/pages/job_lists_page.dart';
import 'package:spotjob/pages/new_job_page.dart';
import 'package:spotjob/pages/search_page.dart';
import 'package:spotjob/pages/settings_page.dart';

class BottomBar extends StatelessWidget {
  final double buttomBarIconSize = 30;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.add_circle),
          onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewJobPage()),
                  );
                },
          color: Colors.white,
          iconSize: buttomBarIconSize,
        ),
        IconButton(
          icon: Icon(Icons.build),
          onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JobListsPage()),
                  );
                },
          color: Colors.white,
          iconSize: buttomBarIconSize,
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
          color: Colors.white,
          iconSize: buttomBarIconSize,
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
          color: Colors.white,
          iconSize: buttomBarIconSize,
        ),
      ],
    );
  }
}
