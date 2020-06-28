import 'package:flutter/material.dart';

import 'raised_blue_button_white_text.dart';

class AddJobLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            'Location:',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RaisedBlueButtonWhiteText(
                'Remote',
                () {},
              ),
            ),
            Text(
              'or',
              style: Theme.of(context).textTheme.title,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RaisedBlueButtonWhiteText(
                'Location Based',
                () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
