// ignore_for_file: file_names

import 'package:sqflite/sqflite.dart';
import '../DataBase/DataBaseHelper.dart';
import '../model/Match.dart';

class FuncMatch {
  FuncMatch._privateConstructor();
  static final FuncMatch instance = FuncMatch._privateConstructor();

  Future<List<Match>> getMatchs() async {
    Database db = await DatabaseHelper.instance.database;
    //db raw qwery
    var matchs = await db.query('MATCH', orderBy: 'point_one');
    List<Match> matchList =
        matchs.isNotEmpty ? matchs.map((c) => Match.fromMap(c)).toList() : [];
    return matchList;
  }

  /*Future<List> queryAll() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map> names = await db.rawQuery(
        'select PERSON.name, count(MATCH.id_one) from PERSON left join Date using(id) group by PEROSN.name');
    if (names.length > 0) {
      return names;
    }
    return [];
  }*/

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
}
