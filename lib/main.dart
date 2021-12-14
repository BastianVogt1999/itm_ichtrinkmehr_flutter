// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My SuperHero Picker',
      home: Scaffold(
        body: Center(
          child: MainApp(),
        ),
      ),
    );
  }

  }

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _SuperHeroName(); //Unterstrich = geheime (private) Klasse oder Variables (private)
}
class _SuperHeroName extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    return loginFile(context);
  }
  }




