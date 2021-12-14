import 'package:flutter/material.dart';

import 'login.dart';
void main() => runApp(MyApp());

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




