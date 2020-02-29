import 'package:flutter/material.dart';

class AddJobDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
