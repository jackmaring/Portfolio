import 'package:flutter/material.dart';

import '../widgets/profile_page_widgets/profile_appbar.dart';
import '../widgets/profile_page_widgets/leading_info.dart';
import '../widgets/profile_page_widgets/jobs_info.dart';
import '../widgets/profile_page_widgets/social_row.dart';
import '../widgets/profile_page_widgets/blue_gradient_box_with_lists.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile-info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppbar(),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  alignment: Alignment.center,
                  child: LeadingInfo(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      JobsInfo('Jobs Completed', 17),
                      SizedBox(
                        height: 16,
                      ),
                      JobsInfo('Jobs Posted', 2)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                  child: SocialRow(),
                ),
                BlueGradientBoxWithLists(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
