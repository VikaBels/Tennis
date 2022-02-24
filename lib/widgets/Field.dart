// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import '../model/Person.dart';

class Field extends StatefulWidget {
  AsyncSnapshot<List<Person>> snapshot;
  String name;
  bool isName;
  Field(this.snapshot, this.name, this.isName);

  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  int? selectedId;
  final nameController = TextEditingController();
  final departmentController = TextEditingController();

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
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 10,
                      child: ListView(
                        children: widget.snapshot.data!.map((per) {
                          return Center(
                            child: Card(
                              child: ListTile(
                                title: widget.isName
                                    ? Text(per.name)
                                    : Text(per.department),
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    if (selectedId == null) {
                                      nameController.text = per.name;
                                      departmentController.text =
                                          per.department;
                                      selectedId = per.id;
                                    } else {
                                      nameController.text = '';
                                      departmentController.text = '';
                                      selectedId = null;
                                    }
                                  });
                                },
                                onLongPress: () async {},
                              ),
                            ),
                          );
                        })
                            //.where((name) => true)
                            .toList(),
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
