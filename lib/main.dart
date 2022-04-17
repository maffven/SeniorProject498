import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'Screens/DriverMenu.dart';
import 'Screens/Logo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((value) => print("connected " + value.options.asMap.toString()))
      .catchError((e) => print(e.toString()));
  runApp(MyApp());
}
// develeopment : Fierwbase Emulator
// production and release - firebase
/// fluter flavores

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Training',
      home: DriverMenu(),
    );
  }
}
