// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../model/Person.dart';
import '../widgets/AboutPerson.dart';

Widget peopleList(int num, AsyncSnapshot<List<Person>> snapshot) {
  return ListView.builder(
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return AboutPerson(++index, snapshot);
    },
    itemCount: num,
  );
}
