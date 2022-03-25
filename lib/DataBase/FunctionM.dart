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

  /*Future<String> queryAll() async {
    Database db = await DatabaseHelper.instance.database;

    var name = await db.rawQuery(
        '''Select p1.name as first_player, p2.name as second_player, m.point_one, m.point_two from Match m
          Left join Person p1
          On m.id_one=p1.id
          Left join Person p2
          On m.id_two=p2.id''');
    //return name.last['name'].toString();
    String
        n = /*name.last['first_player'].toString() +
        ' ' +
        name.last['second_player'].toString() +*/
        name.elementAt(0)['first_player'].toString();
    return n;
  }*/
  /* Future<List<dynamic>> queryAllForTwo() async {
    Database db = await DatabaseHelper.instance.database;

    var inf = await db.rawQuery(
        '''Select p1.name as first_player, p2.name as second_player, m.point_one, m.point_two, m.time from Match m
          Left join Person p1
          On m.id_one=p1.id
          Left join Person p2
          On m.id_two=p2.id''');
    List<dynamic> infList = inf.isNotEmpty ? inf.toList() : [];
    return infList;
  }*/

  Future<List<dynamic>> queryAllForAll() async {
    Database db = await DatabaseHelper.instance.database;

    var inf = await db.rawQuery(
        '''Select p1.name as first_player, p2.name as second_player, p3.name as third_player, p4.name as fourth_player,
          m.point_one, m.point_two, m.time from Match m
          Left join Person p1
          On m.id_one=p1.id
          Left join Person p2
          On m.id_two=p2.id
          Left join Person p3
          On m.id_three=p3.id
          Left join Person p4
          On m.id_four=p4.id
          ''');
    List<dynamic> infList = inf.isNotEmpty ? inf.toList() : [];
    return infList;
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
}
