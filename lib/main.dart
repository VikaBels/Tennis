// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:table_tennis/screens/AboutGame.dart';
import 'package:table_tennis/screens/NewGame.dart';
import 'package:table_tennis/screens/NewPerson.dart';
import 'package:table_tennis/screens/PageOne.dart';
import 'package:table_tennis/screens/PageTwo.dart';
import 'package:table_tennis/screens/GameHistory.dart';

void main() {
  /*for SQLite */
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: PageOne(),
        routes: {
          PageTwo.routeName: (ctx) => PageTwo(),
          NewPerson.routeName: (ctx) => NewPerson(),
          NewGame.routeName: (ctx) => NewGame(),
          GameHistory.routeName: (ctx) => GameHistory(),
          PageOne.routeName: (ctx) => PageOne(),
          Home.routeName: (ctx) => Home(),
        });
  }
}
