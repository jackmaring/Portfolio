import 'package:flutter/material.dart';

class LeadingInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/images/Chad-Profile-pic-circle.png',
          height: 200,
          width: 200,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Jack Maring',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'jackmaring.com',
            style: Theme.of(context).textTheme.subtitle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 16),
          child: Text(
            'I\'m a college student from Fargo, ND who\'s looking for work on this app.',
            style: Theme.of(context).textTheme.body1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
