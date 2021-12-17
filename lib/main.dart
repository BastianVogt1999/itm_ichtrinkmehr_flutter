import 'package:flutter/material.dart';
import 'package:itm_ichtrinkmehr_flutter/local_db/insertStatements.dart';

import 'Values/User.dart';
import 'local_db/make_db.dart';
import 'login.dart';
void main() => runApp(MyApp());
late DatabaseHandler handler;
InsertStatements insertStatements = InsertStatements();

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
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      await addUsers();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return loginFile(context);
  }
  }




  Future<int> addUsers() async {
    User firstUser = User(user_id: 24, user_name: "peter", password: "Lebanon");
    User secondUser = User(user_id: 31, user_name: "john", password: "United Kingdom");
    List<User> listOfUsers = [firstUser, secondUser];
    return await insertStatements.insertUser(listOfUsers);
  }




