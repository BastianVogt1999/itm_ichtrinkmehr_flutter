import 'package:itm_ichtrinkmehr_flutter/Values/User.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'make_db.dart';

class InsertStatements {
DatabaseHandler database = DatabaseHandler();
Future<int> insertUser(List<User> users) async {
  int result = 0;
  final Database db = await database.initializeDB();
  for(var user in users){
    result = await db.insert('User', user.toMap());
  }
  return result;
}
}
