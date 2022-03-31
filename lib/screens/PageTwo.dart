// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, prefer_typing_uninitialized_variables, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:table_tennis/screens/PageOne.dart';
import '../model/Player.dart';
import '../widgets/PeopleList.dart';
import '../DataBase/FunctionP.dart';
import '../model/Person.dart';
import '../screens/NewGame.dart';
import '../screens/NewPerson.dart';

class PageTwo extends StatefulWidget {
  static const routeName = '/pagetwo';

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  bool isSwitched = false;
  bool startGame = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed(PageOne.routeName);
          },
        ),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(NewPerson.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Person>>(
        future: FuncPerson.instance.getPersons(),
        builder: (BuildContext context, AsyncSnapshot<List<Person>> asyncList) {
          List<Person> personList =
              asyncList.data == null ? [] : asyncList.data!;
          return Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 4, bottom: 8, left: 16, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      'Сколько игроков 2/4?',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                    Transform.scale(
                      scale: 1,
                      child: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: Colors.grey.shade400,
                        activeColor: Colors.white,
                      ),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        for (int i = 0; i < Player.players.length; i++) {
                          if (Player.players[i].checkIfAnyIsNull()) {
                            startGame = false;
                          } else {
                            startGame = true;
                          }
                        }
                        startGame
                            ? Navigator.of(context).pushNamed(NewGame.routeName)
                            : null;
                      },
                      child: Text(
                        'Начать игру',
                        style: TextStyle(
                          color: Colors.black87,
                          //color: startGame ? Colors.black87 : Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              !isSwitched
                  ? peopleList(2, personList)
                  : peopleList(4, personList),
            ],
          );
        },
      ),
    );
  }
}
