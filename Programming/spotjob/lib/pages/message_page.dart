import 'package:flutter/material.dart';

import '../widgets/homepage_widgets/bottombar_appbar.dart';

class MessagePage extends StatelessWidget {
  static const routeName = '/messenger';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BottombarAppbar('Send a Message'),
      body: Center(
        child: Text('Send a Message'),
      ),
    );
  }
}