import 'package:flutter/material.dart';

import 'app.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Assignment'),
        ),
        body: App(),
      ),
    );
  }
}