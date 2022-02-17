// ignore_for_file: file_names

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _dataBase;
  Future<Database> get database async => _dataBase ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'TENNIS.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE PERSON(
      id INTEGER PRIMARY KEY,
      name TEXT,
      department TEXT
    )
    ''');
    //time-int/Unixtime
    //points - 2 int
    await db.execute('''
    CREATE TABLE MATCH(
      id INTEGER PRIMARY KEY,
      time TEXT,
      points TEXT
    )
    ''');
  }
}
