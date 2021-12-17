import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'example.db'),
      onCreate: (database, version) async {
        await database.execute(
            "CREATE TABLE User(user_id INTEGER PRIMARY KEY, user_name TEXT, password TEXT)"
        );
        await database.execute(
                "CREATE TABLE Drink(drink_id INTEGER PRIMARY KEY, drink_name TEXT)"
        );
      },
      version: 1,
    );
  }


}
