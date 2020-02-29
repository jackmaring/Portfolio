import 'package:flutter/material.dart';

import 'package:spotjob/pages/profile_page.dart';
import 'package:spotjob/pages/job_info_page.dart';

class JobListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 5,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JobInfoPage()),
              );
            },
            child: ListTile(
              leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: Image.asset('assets/images/circleprofilepic.jpeg'),
              ),
              title: Text(
                'Web Design Job',
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: Text(
                  'Drunken Noodle',
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              trailing: Padding(
                padding: EdgeInsets.only(right: 40),
                child: Text(
                  '\$250',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),
          ),
        );
  }
}