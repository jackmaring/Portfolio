import 'package:flutter/material.dart';

class JobsInfo extends StatelessWidget {
  final String name;
  final int number;

  JobsInfo(this.name, this.number);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '$name: $number',
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
