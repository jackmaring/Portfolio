import 'package:flutter/material.dart';

class AddJobTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
