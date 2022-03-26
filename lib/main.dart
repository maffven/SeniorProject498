import 'package:flutter/material.dart';

import 'Screens/Menu.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Training',
      home: Main(),
    );
  }
}