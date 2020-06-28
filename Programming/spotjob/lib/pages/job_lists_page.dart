import 'package:flutter/material.dart';
import 'package:spotjob/widgets/homepage_widgets/job_list_tile.dart';

import 'package:spotjob/widgets/job_lists_page_widgets/displayed_list.dart';
import '../widgets/homepage_widgets/bottombar_appbar.dart';
import '../widgets/job_lists_page_widgets/display_list_tile.dart';
import '../widgets/job_lists_page_widgets/collapse_list_tile.dart';

class JobListsPage extends StatelessWidget {
  void displayedJobList(int amount) {}

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DisplayListTile('Jobs Saved', 9),
            CollapseListTile('Jobs Applied', 4),
            // DisplayedList(4),
            CollapseListTile('Jobs In Progress', 2),
            // DisplayedList(2),
            DisplayListTile('Jobs Completed', 13),
            DisplayListTile('Jobs Posted', 5),
          ],
        ),
      ],
    );
  }
}
