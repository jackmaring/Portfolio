import 'package:flutter/material.dart';

import 'raised_blue_button_white_text.dart';

class AddJobDuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            'Duration:',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RaisedBlueButtonWhiteText(
                'Start Date',
                () {},
              ),
            ),
            Text(
              'to',
              style: Theme.of(context).textTheme.title,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RaisedBlueButtonWhiteText(
                'End Date',
                () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
