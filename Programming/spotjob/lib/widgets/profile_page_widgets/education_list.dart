import 'package:flutter/material.dart';

class EducationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          child: ListTile(
            leading: Icon(
              Icons.school,
              size: 30,
            ),
            title: Text(
              'High School Diploma',
              style: Theme.of(context).textTheme.title,
            ),
            subtitle: Text(
              'Davies High School',
              style: Theme.of(context).textTheme.subtitle,
            ),
          ),
        );
      },
    );
  }
}
