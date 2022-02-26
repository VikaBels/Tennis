// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:table_tennis/model/Player.dart';
import 'package:table_tennis/model/Players.dart';
import '../model/Person.dart';

class Field extends StatefulWidget {
  AsyncSnapshot<List<Person>> snapshot;
  //ДЛЯ НОМЕРА ПЕДАТЬ РАНЕЕ
  String name;
  bool isName;
  int num;
  Field(this.snapshot, this.name, this.isName, this.num);

  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  int? selectedId;
  final nameController = TextEditingController();
  final departmentController = TextEditingController();
  bool startGame = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(widget.name),
        ),
        Container(
          height: 30,
          child: TextField(
              controller: widget.isName ? nameController : departmentController,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              onTap: () {
                showModalBottomSheet(
                  barrierColor: Colors.white.withOpacity(0),
                  backgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10)), //for the round edges
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      child: ListView(
                        children: widget.snapshot.data!.map((per) {
                          return Card(
                            color: Colors.grey.shade400,
                            child: ListTile(
                              title: Text(
                                widget.isName ? per.name : per.department,
                                textAlign: TextAlign.center,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  widget.isName
                                      ? {
                                          nameController.text = per.name,
                                          Players.players[widget.num - 1].name =
                                              per.name
                                        }
                                      : {
                                          departmentController.text =
                                              per.department,
                                          Players.players[widget.num - 1]
                                              .department = per.department
                                        };
                                });
                              },
                              //Клик на соответствующее имя(нижнее меню)-> очищает поле
                              /*onLongPress: () {
                                widget.isName
                                    ? {
                                        nameController.text = '',
                                        Players.players[widget.num - 1].name =
                                            null
                                      }
                                    : {
                                        departmentController.text = '',
                                        Players.players[widget.num - 1]
                                            .department = null
                                      };
                              },*/
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                );
              }),
        ),
      ],
    );
  }
}
