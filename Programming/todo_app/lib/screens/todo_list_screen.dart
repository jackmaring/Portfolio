import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/container_with_up_and_down_buttons.dart';
import '../widgets/todo_container.dart';
import '../widgets/goals_container.dart';
import '../providers/midpoint_changer.dart';

class ToDoListScreen extends StatelessWidget {
  final Midpoint midpoint = Midpoint.Mid;

  // void goUp(Midpoint midpoint) {
  //     switch (midpoint) {
  //       case Midpoint.Low:
  //         midpoint = Midpoint.MidLow;
  //         break;
  //       case Midpoint.MidLow:
  //         midpoint = Midpoint.Mid;
  //         break;
  //       case Midpoint.Mid:
  //         midpoint = Midpoint.MidHigh;
  //         break;
  //       case Midpoint.MidHigh:
  //         midpoint = Midpoint.High;
  //         break;
  //       case Midpoint.High:
  //         midpoint = Midpoint.High;
  //         break;
  //     }
  //   print('midpoint is now ' + midpoint.toString());
  // }

  // void goDown(Midpoint midpoint) {
  //     switch (midpoint) {
  //       case Midpoint.Low:
  //         midpoint = Midpoint.Low;
  //         break;
  //       case Midpoint.MidLow:
  //         midpoint = Midpoint.Low;
  //         break;
  //       case Midpoint.Mid:
  //         midpoint = Midpoint.MidLow;
  //         break;
  //       case Midpoint.MidHigh:
  //         midpoint = Midpoint.Mid;
  //         break;
  //       case Midpoint.High:
  //         midpoint = Midpoint.MidHigh;
  //         break;
  //     }
  //   print('midpoint is now ' + midpoint.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return ChangeNotifierProvider.value(
          value: MidpointChanger(),
          child: Column(
            children: <Widget>[
              ToDoContainer(constraints, midpoint),
              GoalsContainer(constraints, midpoint),
              // Container(
              //   height: 50,
              //   width: double.infinity,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: <Widget>[
              //       IconButton(
              //         icon: Icon(
              //           Icons.expand_less,
              //         ),
              //         iconSize: 24,
              //         onPressed: () {
              //           setState(() {
              //             goUp(midpoint);
              //           });
              //         },
              //       ),
              //       IconButton(
              //         icon: Icon(
              //           Icons.expand_more,
              //         ),
              //         iconSize: 24,
              //         onPressed: () {
              //           setState(() {
              //             goDown(midpoint);
              //           });
              //         },
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
