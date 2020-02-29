import 'package:flutter/material.dart';
import 'package:spotjob/widgets/new_job_page_widgets/raised_blue_button_white_text.dart';

import 'requirements_list.dart';

class AddJobRequirements extends StatelessWidget {
  final requirements = [
    'Must have college degree',
    'Must have a drivers license',
    'Flexible hours',
    'Must be able to tame wild beasts with beautiful music',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Requirements/Special Notes:',
          style: Theme.of(context).textTheme.title,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8),
          child: RequirementsList(requirements),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RaisedBlueButtonWhiteText(
                'Add',
                () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
