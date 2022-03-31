// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:table_tennis/model/Person.dart';
import 'package:table_tennis/widgets/Field.dart';

class AboutPerson extends StatelessWidget {
  final int number;
  List<Person> personList;
  AboutPerson(this.number, this.personList);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 28, 12, 4),
          child: Text('$number'),
        ),
        Flexible(
          flex: 2,
          child: Field(personList, 'Отдел', false, number),
        ),
        SizedBox(width: 16),
        Flexible(
          flex: 2,
          child: Field(personList, 'Имя', true, number),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
