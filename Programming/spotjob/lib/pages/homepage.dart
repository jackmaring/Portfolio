import 'package:flutter/material.dart';

import '../widgets/homepage_widgets/scrollable_job_list.dart';
import '../widgets/homepage_widgets/header.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: LayoutBuilder(
        builder: (ctx, constraints) {
          return Container(
            width: double.infinity,
            height: mediaQuery.size.height,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: constraints.maxHeight * 0.30,
                  child: Header(),
                ),
                Container(
                  width: double.infinity,
                  height: constraints.maxHeight * 0.70,
                  child: ScrollableJobList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
