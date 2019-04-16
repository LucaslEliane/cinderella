import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// 使用单例模式，保证应用中只有唯一一个 DB 入口
class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider provider = DatabaseProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, "Cinderella.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE User ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "user_name TEXT,"
          "blocked BIT"
          ")");
    });
  }
}
