import 'package:flutter/material.dart';
import 'package:spotjob/widgets/new_job_page_widgets/raised_blue_button_white_text.dart';

class AddJobPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            'Pay:',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RaisedBlueButtonWhiteText(
                'One Time',
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
                'Per Hour',
                () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
