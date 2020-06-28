import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spotjob/providers/job.dart';

class AddJobTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final job = Provider.of<CreateJob>(context);
    TextEditingController titleController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Title:',
          style: Theme.of(context).textTheme.title,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: TextField(
            controller: titleController..text = job.titleText,
            onChanged: (value) {
              job.titleText = value;
            },
            style: Theme.of(context).textTheme.title,
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.subtitle,
            ),
          ),
        ),
      ],
    );
  }
}
