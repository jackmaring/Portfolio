import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import 'package:spotjob/pages/message_page.dart';

class BottombarAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  BottombarAppbar(this.title);

  @override
  Widget build(BuildContext context) {
    return GradientAppBar(
      backgroundColorStart: Theme.of(context).accentColor,
      backgroundColorEnd: Theme.of(context).primaryColor,
      title: Text(title),
      leading: Container(),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.mail),
          onPressed: () {
            Navigator.of(context).pushNamed(MessagePage.routeName);
          },
          color: Colors.white,
          iconSize: 30,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
