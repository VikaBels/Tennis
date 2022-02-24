// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:table_tennis/widgets/PeopleList.dart';
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
  bool isTwo = true;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        builder: (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
          return Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 4, bottom: 8, left: 16, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      'Сколько игроков?',
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
                            if (value == true) {
                              isTwo = false;
                            } else {
                              isTwo = true;
                            }
                          });
                        },
                        activeTrackColor: Colors.grey.shade400,
                        activeColor: Colors.white,
                      ),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(NewGame.routeName);
                      },
                      child: Text(
                        'Начать игру',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
              isTwo ? peopleList(2, snapshot) : peopleList(4, snapshot),
            ],
          );
        },
      ),
    );
  }
}
