// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unnecessary_new, prefer_final_fields, unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_tennis/model/Player.dart';
import 'package:table_tennis/model/Point.dart';
import '../DataBase/FunctionM.dart';
import '../model/Match.dart';

import '../screens/PageOne.dart';

class NewGame extends StatefulWidget {
  const NewGame({Key? key}) : super(key: key);

  static const routeName = '/newGame';

  @override
  _NewGameState createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  int _counterOne = 0;
  int _counterTwo = 0;
  int _counterClick = 0;

  int _count = 1;
  //List<Map<String, int>> items = [];
  List<Point> point = [];

  String _timeString =
      DateFormat('yyyy-dd-MM  kk:mm').format(DateTime.now()).toString();
  // https://question-it.com/questions/967077/vsplyvajuschee-dialogovoe-okno-pri-nazhatii-knopki-vo-flattere

  void _incrementCounter(bool isOne) {
    setState(() {
      if (isOne) {
        _counterOne++;
      } else {
        _counterTwo++;
      }

      _counterClick++;

      if (_counterOne == 4 || _counterTwo == 4) {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: EdgeInsets.only(top: 8),
                  height: 90,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Игра окончена',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Игра окончена. Счёт $_counterOne-$_counterTwo'),
                      Divider(
                        height: 1,
                      ),
                      TextButton(
                        onPressed: () async {
                          await FuncMatch.instance.addMat(Match(
                            time: _timeString,
                            point_one: _counterOne,
                            point_two: _counterTwo,
                            id_one: Player.players[0].id!,
                            id_two: Player.players[1].id!,
                            id_three: 0,
                            id_four: 0,
                          ));
                          Navigator.of(context).pushNamed(PageOne.routeName);

                          ///
                        },
                        child: Text(
                          'OK',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      }
      _count = _count + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  '${Player.players[0].name}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  '${Player.players[1].name}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _counterClick % 2 == 0
                  ? Icon(Icons.circle)
                  : Icon(Icons.circle_outlined),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  _incrementCounter(true);
                  setState(() {
                    point.add(
                        Point(point_one: _counterOne, point_two: _counterTwo));
                  });
                },
                child: Text(
                  '$_counterOne',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 65,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Text(
                ':',
                style: TextStyle(
                  fontSize: 37,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(width: 12),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  _incrementCounter(false);
                  setState(() {
                    point.add(
                        Point(point_one: _counterOne, point_two: _counterTwo));
                  });
                },
                child: Text(
                  '$_counterTwo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 65,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              _counterClick % 2 == 0
                  ? Icon(Icons.circle_outlined)
                  : Icon(Icons.circle),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 300,
            width: 350,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: point.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('${point[index].point_one}'),
                        Text('${point[index].point_two}'),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 20,
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
