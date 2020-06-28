import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ProfileAppbar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return GradientAppBar(
      backgroundColorStart: Theme.of(context).accentColor,
      backgroundColorEnd: Theme.of(context).primaryColor,
      title: Text(
        'ACheekWeasl\'s Profile',
        style: Theme.of(context).textTheme.title.merge(
              TextStyle(
                color: Colors.white,
              ),
            ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {},
          color: Colors.white,
          iconSize: 30,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
