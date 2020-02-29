import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/midpoint_changer.dart';

class ContainerWithUpAndDownButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.expand_less,
            ),
            iconSize: 24,
            onPressed: () {
              Provider.of<MidpointChanger>(context, listen: false).goUp();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.expand_more,
            ),
            iconSize: 24,
            onPressed: () {
              Provider.of<MidpointChanger>(context, listen: false).goDown();
            },
          ),
        ],
      ),
    );
  }
}
