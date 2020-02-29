import 'package:flutter/material.dart';
import 'package:spotjob/widgets/new_job_page_widgets/raised_blue_button_white_text.dart';

import '../profile_page_widgets/skills_grid.dart';

class AddJobTags extends StatelessWidget {
  final skills = [
    'Communication',
    'Coding',
    'Flutter',
    'People',
    'Focused',
    'I go hard',
    'Yo yo enthusiast',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Tags:',
          style: Theme.of(context).textTheme.title,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8),
          child: SkillsGrid(skills),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 20, bottom: 8),
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
