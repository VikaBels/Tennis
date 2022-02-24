// ignore_for_file: file_names
import 'package:sqflite/sqflite.dart';
import 'package:table_tennis/DataBase/DataBaseHelper.dart';
import 'package:table_tennis/model/Person.dart';

class FuncPerson {
  FuncPerson._privateConstructor();
  static final FuncPerson instance = FuncPerson._privateConstructor();

  Future<List<Person>> getPersons() async {
    Database db = await DatabaseHelper.instance.database;
    var persons = await db.query('PERSON', orderBy: 'name');
    List<Person> personList = persons.isNotEmpty
        ? persons.map((c) => Person.fromMap(c)).toList()
        : [];
    return personList;
  }

  ////////
  /* Future<List<Department>> getDepartment() async {
    Database db = await DatabaseHelper.instance.database;
    var departments =
        await db.rawQuery('SELECT DISTINCT department FROM PERSON;');
    List<Department> departmentList = departments.isNotEmpty
        ? departments.map((c) => Department.fromMap(c)).toList()
        : [];
    return departmentList;
  }
  ///////

  Future<List<Person>> getPersonsByName(String dep) async {
    Database db = await DatabaseHelper.instance.database;
    var persons =
        await db.rawQuery('SELECT * FROM PERSON WHERE department="$dep"');
    List<Person> personList = persons.isNotEmpty
        ? persons.map((c) => Person.fromMap(c)).toList()
        : [];
    return personList;
  }*/
  //////

  Future<int> addPer(Person person) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('PERSON', person.toMap());
  }

  Future<int> removePer(int id) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete('PERSON', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updatePer(Person person) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.update('PERSON', person.toMap(),
        where: 'id = ?', whereArgs: [person.id]);
  }
}
