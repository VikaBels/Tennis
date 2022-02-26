// ignore_for_file: file_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:table_tennis/model/Player.dart';
import 'package:table_tennis/model/Players.dart';
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
  if (Players.players.length < num) {
    Players.players.add(new Player());
  }
  while (Players.players.length > num) {
    Players.players.removeLast();
  }
}
