import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'lab5base.db';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db
        .execute("""CREATE TABLE BMI(
         id INTEGER PRIMARY KEY AUTOINCREMENT,
         weight DOUBLE,
         height DOUBLE,
         result DOUBLE
        );""");
  }

  Future<void> addBMI(Map<String, dynamic> bmi) async{
    Database db = await this.database;
    final result = await db.insert("BMI", bmi);
    print(result);
  }

  Future<List<Map<String, dynamic>>> getAllBMI() async{
    Database db = await this.database;
    final List<Map<String, dynamic>> data = await db.query("BMI");
    return data;
  }
}
