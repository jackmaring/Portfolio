import 'package:flutter/material.dart';

import 'package:spotjob/pages/filter_page.dart';
import 'package:spotjob/pages/profile_page.dart';
import 'package:spotjob/widgets/homepage_widgets/category_dropdowns.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CategoryDropdowns(),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: GestureDetector(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.sort,
                        color: Colors.black,
                        size: 30,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        size: 20,
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(FilterPage.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 55),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ProfilePage.routeName);
                },
                child: Image.asset(
                  'assets/images/Chad-Profile-pic-circle.png',
                  height: 65,
                  width: 65,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
