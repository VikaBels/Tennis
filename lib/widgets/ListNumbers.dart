// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ListNumbers extends StatefulWidget {
  final int kolOne;
  final int kolTwo;

  ListNumbers({required this.kolOne, required this.kolTwo});

  @override
  State<StatefulWidget> createState() => _ListNumbers();
}

class _ListNumbers extends State<ListNumbers> {
  @override
  Widget build(BuildContext context) {
    return line(context, widget.kolOne, widget.kolTwo);
  }
}

Widget line(BuildContext context, int kolOne, int kolTwo) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('$kolOne'),
          Text('$kolTwo'),
        ],
      ),
      Divider(
        color: Colors.grey,
        height: 18,
        thickness: 1,
        indent: 15,
        endIndent: 15,
      ),
    ],
  );
}
