// ignore_for_file: file_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:table_tennis/model/Player.dart';
import '../model/Person.dart';
import '../widgets/AboutPerson.dart';

Widget peopleList(int num, AsyncSnapshot<List<Person>> snapshot) {
  fillPlayersList(num);
  return ListView.builder(
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return AboutPerson(++index, snapshot);
    },
    itemCount: num,
  );
}

void fillPlayersList(int num) {
  if (Player.players.length < num) {
    Player.players.add(new Player());
  }
  while (Player.players.length > num) {
    Player.players.removeLast();
  }
}
