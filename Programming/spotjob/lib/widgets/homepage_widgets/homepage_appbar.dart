import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spotjob/pages/message_page.dart';

class HomepageAppbar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return GradientAppBar(
      backgroundColorStart: Theme.of(context).accentColor,
      backgroundColorEnd: Theme.of(context).primaryColor,
      leading: Container(),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.mail),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MessagePage(),
              ),
            );
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
