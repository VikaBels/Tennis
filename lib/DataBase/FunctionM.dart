// ignore_for_file: file_names

import 'package:sqflite/sqflite.dart';
import 'package:table_tennis/DataBase/DataBaseHelper.dart';
import 'package:table_tennis/model/Match.dart';

Future<List<Match>> getMatch() async {
  Database db = await DatabaseHelper.instance.database;
  var matchs = await db.query('MATCH', orderBy: 'time');
  List<Match> matchList =
      matchs.isNotEmpty ? matchs.map((c) => Match.fromMap(c)).toList() : [];
  return matchList;
}

Future<int> addMat(Match match) async {
  Database db = await DatabaseHelper.instance.database;
  return await db.insert('MATCH', match.toMap());
}

Future<int> removeMat(int id) async {
  Database db = await DatabaseHelper.instance.database;
  return await db.delete('MATCH', where: 'id = ?', whereArgs: [id]);
}

Future<int> updateMat(Match match) async {
  Database db = await DatabaseHelper.instance.database;
  return await db
      .update('MATCH', match.toMap(), where: 'id = ?', whereArgs: [match.id]);
}
