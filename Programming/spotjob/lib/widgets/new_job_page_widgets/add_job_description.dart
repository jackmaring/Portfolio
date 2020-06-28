import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spotjob/providers/job.dart';

class AddJobDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final job = Provider.of<CreateJob>(context);
    TextEditingController descController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Description:',
          style: Theme.of(context).textTheme.title,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: TextField(
            controller: descController..text = job.descText,
            onChanged: (value) {
              job.descText = value;
            },
            style: Theme.of(context).textTheme.title,
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.subtitle,
            ),
          ),
        ),
      ],
    );
  }
}
