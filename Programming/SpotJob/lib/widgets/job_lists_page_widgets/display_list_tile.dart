import 'package:flutter/material.dart';

class DisplayListTile extends StatelessWidget {
  final String title;
  final int number;

  DisplayListTile(this.title, this.number);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      padding: EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        leading: Icon(
          Icons.add_circle,
          color: Theme.of(context).accentColor,
        ),
        title: Text(
          '$title ($number)',
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
