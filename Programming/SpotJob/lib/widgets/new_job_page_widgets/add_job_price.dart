import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spotjob/providers/job.dart';

class AddJobPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final job = Provider.of<CreateJob>(context);
    TextEditingController priceController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Pay:',
          style: Theme.of(context).textTheme.title,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: priceController..text = job.price,
            onChanged: (value) {
              job.price = value;
            },
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
