// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:table_tennis/screens/NewGame.dart';
import 'package:table_tennis/screens/NewPerson.dart';
import 'package:table_tennis/widgets/AboutPerson.dart';

import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class PageTwo extends StatefulWidget {
  static const routeName = '/pagetwo';

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  bool isTwo = true;

  ///
  var _tabSelectedIndexSelected = 0;
  var _listTextSelectedToggle = ["2", "4"];

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
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 2, bottom: 7, left: 15, right: 10),
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
                FlutterToggleTab(
                  width: 18,
                  height: 22,
                  borderRadius: 6,
                  selectedIndex: _tabSelectedIndexSelected,
                  selectedBackgroundColors: [Colors.white],
                  selectedTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                  unSelectedTextStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  labels: _listTextSelectedToggle,
                  selectedLabelIndex: (index) {
                    setState(() {
                      _tabSelectedIndexSelected = index;
                      if (_tabSelectedIndexSelected == 0) {
                        isTwo = true;
                      } else {
                        isTwo = false;
                      }
                    });
                  },
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
          isTwo ? peopleList(2) : peopleList(4),
        ],
      ),
    );
  }
}

Widget peopleList(int num) {
  return ListView.builder(
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return AboutPerson(++index);
    },
    itemCount: num,
  );
}
